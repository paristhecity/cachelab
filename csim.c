#define _GNU_SOURCE

#include "cachelab.h"

#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

// Record the statistics of running the cache
static int hit_count, miss_count, eviction_count;



struct line {
	int validBit;
	//tag???
	int block; //blocks, pointer, mem address?
	int blockSize; // B = 2**b
};

struct set {
	int s; //this set
	struct line* myLines; 
	int numLines; //E
};

struct cache {
	struct set* mySets;
	int numSets; //S = 2**s
};

/*
 * printUsage - Print usage info
 */
void printUsage()
{
    printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits.\n");
    printf("  -E <num>   Number of lines per set.\n");
    printf("  -b <num>   Number of block offset bits.\n");
    printf("  -t <file>  Trace file.\n");
    exit(0);
}



/* printCache() - prints all of the data in the cache
*/
void printCache(struct cache *myCache) {
	for (int i = 0; i < myCache->numSets; i++) {
		struct set  mySet = myCache->mySets[i];
		printf("set = %d", i);
		for (int j = 0; j < mySet.numLines; j++) {
			printf("\tline = %d\t", j);
			struct line myLine = mySet.myLines[j];
			printf("block = %d\n", myLine.block);
		}
	}
}



/* setCache() - sets the data in the cache to zero
*/
void setCache(struct cache *myCache, int S, int E, int B) {

	myCache->numSets = S;
	myCache->mySets = malloc(sizeof(struct set) * S);
	printf("%d, %d, %d\n", S, E, B);
	// sets each set
	for (int i = 0; i < S; i++) {
	
		struct set *mySet = (struct set*) malloc(sizeof(struct set));
		mySet->numLines = E;
		mySet->myLines = malloc(sizeof(struct line) * E);
		
		// sets each line
		for (int j = 0; j < E; j++) {
		
			struct line *myLine = (struct line*) malloc(sizeof(struct line));
			myLine->blockSize = B;
			myLine->block = 0; // remove!!
			myLine->validBit = 0;
			mySet->myLines[j] = *myLine;
		}
		
		myCache->mySets[i] = *mySet;
		
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
		printUsage();
		return 0;
	}
	
	
	
	
	// set an empty cache
	hit_count = 0;
	miss_count = 0;
	eviction_count = 0;
	struct cache *myCache = (struct cache*) malloc(sizeof(struct cache));
	setCache(myCache, 1<<s, E, 1<<b); // use S=2^s and B=2^b



	
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





