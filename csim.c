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
	//tag??? **************************************?
	int block;
	int blockSize; // B = 2^b
};

struct set {
	int s; //this set ????????????????????????????????????? not necessary? rename if was?
	struct line* myLines; 
	int numLines; // E
};

struct cache {
	struct set* mySets;
	int numSets; // S = 2^s
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
    return;
}




/* 
 * printCache() - prints all of the data in the cache, keep it around for later :P
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




/* setCache() - sets the data in the cache blocks to zero, each are invalid, each size B...
					(say S is number Sets, E is num Lines...)
*/
void setCache(struct cache *myCache, int S, int E, int B) {

	myCache->numSets = S;
	myCache->mySets = malloc(sizeof(struct set) * S);
	
	// sets each set within cache
	for (int i = 0; i < S; i++) {
	
		struct set *mySet = (struct set*) malloc(sizeof(struct set));
		mySet->numLines = E;
		mySet->myLines = malloc(sizeof(struct line) * E);
		
		// sets each line within set
		for (int j = 0; j < E; j++) {
		
			struct line *myLine = (struct line*) malloc(sizeof(struct line));
			myLine->blockSize = B;
			myLine->block = 0;
			myLine->validBit = 0;
			mySet->myLines[j] = *myLine;
		}
		
		myCache->mySets[i] = *mySet;

	}
}




/*
 * freeCache() - * Stuff left unfreed ?!?!
 */
void freeCache(struct cache *myCache) {
	
	int numSets = myCache->numSets;
	
	// free the lines in each set created by setCache
	for (int i = 0; i < numSets; i++) {
		free(myCache->mySets[i].myLines);
	}
	// free mySets created by setCache
	free(myCache->mySets);
	// free myCache created by main
	free(myCache);
	return;
	
}




/* getInputs() - returns a malloced array of 3 ints, the input. must be freed ****
				- kinda ugly? ******
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
 * checkCache() - returns 0 if not in cache
 				- returns 1 if in cache
 				- if in cache, will update the time last used
 */
int checkCache(struct cache *myCache, int value) {

	// loop through every set in the cache
	for (int i = 0; i < myCache->numSets; i++) {
		struct set  mySet = myCache->mySets[i];
		// loop through every line in this set
		for (int j = 0; j < mySet.numLines; j++) {
			struct line myLine = mySet.myLines[j];
			if (myLine.block == value && myLine.validBit == 1) {
				// if the value is in this block and is valid
				//update time used! **************************************
				return 1;
			}
		}
	}
	return 0;
		
	//weird thing with block size??***
}





/*
 * putInCache() - returns 0 if no eviction, 1 if an eviction
 				- will store addr into the cache, evicting a slot if necessary
 */
int putInCache(struct cache *myCache, int addr) {
	return 0;
	// beef of program! Rename?!? 'storeCache'? ***********************
	//loop until availble line
	//use a helper function to find evicted slot
}




/*
 * runSim() - returns hit,miss,evict msg
 			- increments hit, misses, eviction counters accordingly
 */
char *runSim(struct cache *myCache, int addr) {
	
	// check if the given value is in the cache
	int inCache = checkCache(myCache, addr);
	
	if (inCache) {
		// if the element was in the cache, a hit occured
		hit_count++;
		return "hit";
	} else {
		// if the element was not in the cache, a miss occured
		miss_count++;
		
		// put in the element in the cache, evicting if necessary
		int evicted = putInCache(myCache, addr);
		if (evicted) {
			// an eviction occured to store the element
			eviction_count++;
			return "miss eviction";
		} else {
			// the element was stored without an eviction
			return "miss";
		}
	}
	
}
 
 
 
 
/*
 * main() - 
 */
int main(int argc, char *argv[]) {
	
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
		//printf("Seeking Argument, none found?!?!\n"); //weird? thing from opt man page!*!*!*!
	}
	
	if (helpFlag) {
		// print the usage of csim and exit the program successfully
		printUsage();
		exit(0);
	}
	
	
	
	// reset the global counters for hits, misses, and evictions
	hit_count = 0;
	miss_count = 0;
	eviction_count = 0;
	
	// allocate space for a cache
	struct cache *myCache = (struct cache*) malloc(sizeof(struct cache));
	setCache(myCache, 1<<s, E, 1<<b); // use S=2^s and B=2^b



	// check the tracefile
	FILE *fptr;
	if ((fptr = fopen(traceFile, "r")) == NULL) {
		// quit the program if the tracefile could not be opened
		printf("Error opening file");
		exit(1);
	}
	
	
	// loops through each line of the file seperately
	char *line;
	size_t len = 0;
	ssize_t read = 0;
	while ((read = getline(&line, &len, fptr)) != -1) {
		// while there is still a line in the file
		
		if (line[0] != ' ') {
			// if there is an 'instruction load' this line, skip this line
			continue;
		}
		
		if (verboseFlag) {
			// if the verbose flag is set, print the input line
			line[read - 1] = '\0';
			line++;
			printf("%s ", line);
		}
		
		int *inputs= getInputs(line, read); // inputs is a malloced array that must be freed

		
		// run the simulation and store the return message in status
		char status[20] = "";
		if ((char) inputs[0] == 'M'){
			// if the instruction is a data modify
			strcat(status, runSim(myCache, inputs[1]));
			strcat(status, " ");
			strcat(status, runSim(myCache, inputs[1])); // run the simulation again
		} else { // (char) inputs[0] == 'L' || (char) inputs[0] == 'S'
			// if the instruction is a data load or data store
			strcat(status, runSim(myCache, inputs[1]));
		}
		
		if (verboseFlag) {
			// if the user requested printed output
			printf("%s\n", status);
		}
		
		free(inputs); // finished using this input line
		
	}
	
	fclose(fptr); // finished reading lines from the file
	freeCache(myCache); // finished using the cache
	
	//printCache(myCache); // remove*
    printSummary(hit_count, miss_count, eviction_count);
    return 0;
}





