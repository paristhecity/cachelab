#define _GNU_SOURCE

#include "cachelab.h"

#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

// Record the statistics of running the cache
static int hit_count, miss_count, eviction_count;


//Cache Parameters
typedef struct {
	int s; /* 2**s cache sets */
	int b; /* cacheline block size 2**b bytes */
	int E; /* number of cachelines per set */
	int S; /* number of sets, derived from S = 2**s */
	int B; /* cacheline block size (bytes), derived from B = 2**b */

	int hits;
	int misses;
	int evicts;
} cache_params;

struct line {
	int validBit;
	//tag???
	int data; //blocks, pointer, mem address?
	int dataSize; // num blocks?
};

struct set {
	struct line* myLines;
	int numLines;
};

struct cache {
	struct set* mySets;
	int numSets;
};


/* printCache() - prints all of the data in the cache
*/
void printCache(struct cache *myCache) {
	for (int i = 0; i < myCache->numSets; i++) {
		struct set  mySet = myCache->mySets[i];
		for (int j = 0; j < mySet.numLines; j++) {
			struct line myLine = mySet.myLines[j];
			printf("%d,", myLine.data);
		}
		printf("\n");
	}
}


/* setCache() - sets the data in the cache to zero
*/
void setCache(struct cache *myCache, int S, int E, int B) {

	myCache->numSets = S;
	myCache->mySets = malloc(sizeof(struct set) * S);
	
	for (int i = 0; i < S; i++) {
	
		struct set  mySet = myCache->mySets[i];
		mySet.numLines = E;
		mySet.myLines = malloc(sizeof(struct line) * E);
		
		for (int j = 0; j < E; j++) {
		
			struct line myLine = mySet.myLines[j];
			myLine.dataSize = B;
			printf("%d,", myLine.dataSize);
		}
		
		printf("\n");
	}
	
}


/* getInputs() - returns a malloced array of 3 ints, the input. must be freed ****
*/
int *getInputs(char* line, ssize_t len) {

	int *input = malloc(3 * sizeof(int));
	
	char *tokens;
	tokens = strtok(line, " ");
	input[0] = (int) tokens[0]; // unicode ****
	
	tokens = strtok(NULL, ",");
	input[1] = atoi(tokens);
	
	tokens = strtok(NULL, " ");
	input[2] = atoi(tokens);
	
	return input;
}


/*
*/
int main(int argc, char *argv[])
{
	
	// Set the command line input
	int opt;
	int helpFlag = 0, verboseFlag = 0;
	int s,E,b;
	char *traceFile;
	while ((opt = getopt(argc, argv, "vs:E:b:t:h")) != -1) {
		switch (opt) {
		case 'h':
			// the helpFlag is set
			helpFlag = 1;
			break;
		case 'v':
			// the verboseFlag is set
			verboseFlag = 1;
			break;
		case 's':
			// s is the number of set index bits
			s = atoi(optarg);
			break;
		case 'E':
			// E is the number of lines per set
			E = atoi(optarg);
			break;
		case 'b':
			// b is the number of block bits
			b = atoi(optarg);
			break;
		case 't':
			// the given tracefile
			traceFile = optarg;
			break;
		}
	}
	
	if (optind >= argc) {
		//printf("Seeking Argument, none found?!?!\n"); //weird? thing from opt man page
	}
	
	if (helpFlag) {
		// print the usage of csim and exit the program successfully
		printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num -t <file>\n");
		// check csim-ref for rest *****
		return 0;
	}
	
	
	//check options! kick user out!
	
	printf("%d,%d,%d\n", s, E, b);
	hit_count = 0;
	miss_count = 0;
	eviction_count = 0;
	struct cache myCache;
	setCache(myCache, 2<<s, E, 2<<b); // use S=2^s and B=2^b
	//printCache(myCache); //personal use, remove
	
	
	FILE *fptr;
	if ((fptr = fopen(traceFile, "r")) == NULL) {
		// quit the program if the tracefile could not be opened
		printf("Error opening file");
		exit(1);
	}
	
	
	char *line;
	size_t len = 0;
	ssize_t read = 0;
	while ((read = getline(&line, &len, fptr)) != -1) {
		// while there is still a line in the file
		
		if (line[0] != ' ') {
			// if there is an instruction load this line, skip this line
			continue;
		}
		
		if (verboseFlag) {
			// if the verbose flag is set, print the input line
			line[read - 1] = '\0';
			line++;
			printf("%s", line);
		}
		
		int *inputs= getInputs(line, read); // inputs is a malloced array that must be freed

		printf("\t");
		for (int i = 0; i < 3; i++) {
			printf("*%d* ",inputs[i]); //print what the recieved inputs was!, remove
		}
		printf("\t");
		
		
		if ((char) inputs[0] == 'M'){
			// if the instruction is a data modify
			//runSim twice, each returns a 0,1,2 if hit miss or evict
			printf("Run Simulation Twice");
		} else { // (char) inputs[0] == 'L' || (char) inputs[0] == 'S'
			// if the instruction is a data load or data store
			//runSim once, returns print info
			printf("Run Simulation Once");
		}
		
		if (verboseFlag) {
			// if the user wants output printed
			// print if there are any hits, misses, or evictions *****************************
			printf("\n");
		}
		
		free(inputs); // done using the input line
		
		
	}
	
	fclose(fptr);
	
    printSummary(hit_count, miss_count, eviction_count);
    return 0;
}





