/* Peter Maida, Paris Lopez
 * December 10, 2017
 */

#include "cachelab.h"

#include <getopt.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Record the statistics of running the cache
static int hit_count = 0, miss_count = 0, eviction_count = 0;


/* Always use a 64-bit variable to hold memory addresses*/
typedef unsigned long long int mem_addr_t; //rename! "tag"?*********************************




struct line {
	int timeUsed;
	int validBit;
	mem_addr_t tag; //**********"tag myTag"?*****************************************
	int blockSize;
};

struct set{
	struct line *myLines;
	int numLines;
};

struct cache{
	struct set *mySets;
	int numSets;
};





/*
 * printUsage() - Print usage info
 */
void printUsage() {

    printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits.\n");
    printf("  -E <num>   Number of lines per set.\n");
    printf("  -b <num>   Number of block offset bits.\n");
    printf("  -t <file>  Trace file.\n");
    
}




/* 
 * printCache(struct cache *) - prints all of the data in the cache (loop)...
 */
void printCache(struct cache *myCache) {

	for (int i = 0; i < myCache->numSets; i++) {
		struct set  mySet = myCache->mySets[i];
		printf("set = %d", i);
		for (int j = 0; j < mySet.numLines; j++) {
			printf("\tline = %d\t", j);
			struct line myLine = mySet.myLines[j];
			printf("block tag = %llu\n", myLine.tag);
		}
	}
	
}




/* 
 * setCache(struct cache *, int, int, int) - sets the data/tag in the cache to zero(malloc)...
 */
void setCache(struct cache *myCache, int S, int E, int B) {

	// set space aside for S sets
	myCache->numSets = S;
	myCache->mySets = malloc(sizeof(struct set) * S);
	
	// loop through every set
	for (int i = 0; i < S; i++) {
	
		// set space aside for E lines
		struct set  mySet;
		mySet.numLines = E;
		mySet.myLines = malloc(sizeof(struct line) * E);
		
		// loop through every line
		for (int j = 0; j < E; j++) {
		
			// fill in current line with invalid data
			struct line myLine;
			myLine.timeUsed = 0;
			myLine.validBit = 0;
			myLine.tag = 0; 
			myLine.blockSize = B;
			// set the sets current line to this line
			mySet.myLines[j] = myLine;	
			
		}
		// set the caches current set to this set
		myCache->mySets[i] = mySet;
	}
	
}




/*
 * freeCache(struct cache *) - ...
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




/*
 * checkEmptyLine(struct set) - ...
 */
int checkEmptyLine(struct set mySet) {

	// loop through every line in this set
	for (int index = 0; index < mySet.numLines; index ++) {
		if (mySet.myLines[index].validBit == 0) {
			// if this line is invalid, it can be used
			return index;
		}
	}
	
	return -1; // no empty line index was found
	
}




/* 
 * getMostRecent(struct set) - find the most recently used in this line...
 */
int getMostRecent(struct set mySet) {

	int mostRecent = mySet.myLines[0].timeUsed;
	// check every line in this set
	for (int i = 1; i < mySet.numLines; i++) {
		struct line currLine = mySet.myLines[i];
		
		if (currLine.timeUsed > mostRecent) {
			// if this line is more recent, use it
			mostRecent = currLine.timeUsed;
		}
	}
	
	return mostRecent;
	
}




/*
 * evictLine(struct set) - returns index of least recently used line...
 */
int evictLine(struct set mySet) {

	// record the least recently used time and corresponding index
	int lruTime = mySet.myLines[0].timeUsed;
	int lruIndex = 0;

	// check every line in this set
	for (int i = 1; i < mySet.numLines; i++) {
		struct line currLine = mySet.myLines[i];

		if (currLine.timeUsed < lruTime) {
			// if this line is even less recent, use it	
			lruTime = currLine.timeUsed;
			lruIndex = i;
		}

	}

	return lruIndex;
	
}




/*
 * checkSet(struct set, mem_addr_t) - check if the tag is in the set return 1 if in cache, 0 if not...*
 */
int checkSet(struct set mySet, mem_addr_t tag) {
	
	// loop through every line in the current set
	for (int i = 0; i < mySet.numLines; i++) {
		struct line currLine = mySet.myLines[i];
			
		if (currLine.validBit && currLine.tag == tag) {	
			// if the line is valid and the tag matches 	
			currLine.timeUsed++;
			mySet.myLines[i] = currLine;
			return 1;
		}

	}
			
	return 0; // the target tag was not found within the set
}




/*
 * putInSet(struct set, mem_addr_t) - return 0 if no eviction, 1 if an eviction...
 */
int putInSet(struct set targetSet, mem_addr_t tag) {
		
	// update the most recent time and check for an empty line
	int mostRecent = getMostRecent(targetSet);
	int lineIndex = checkEmptyLine(targetSet);
	int evicted = 0; // no eviction occured
	
	if (lineIndex == -1) {
		// if there was no empty line in the set, evict one
		lineIndex = evictLine(targetSet);
		evicted = 1; // an eviction occured
	} 
	
	// the tag is inserted into the set, is valid, and is the new most recent
	targetSet.myLines[lineIndex].tag = tag;
	targetSet.myLines[lineIndex].validBit = 1;
	targetSet.myLines[lineIndex].timeUsed = mostRecent + 1;
	
	return evicted;
	
}




/*
 * runSim(struct cache *, mem_addr_t, int, int) - ...
 */
char *runSim(struct cache *myCache, mem_addr_t address, int s, int b) {

		// extract the tagBits and setBits from the address
		int tagLength = (64 - (s + b));
		mem_addr_t tag = address >> (s + b);
		unsigned long long setIndex = (address << tagLength) >> (tagLength + b);
		
  		struct set targetSet = myCache->mySets[setIndex];
  		
  		if (checkSet(targetSet, tag)) {
  			// if the tag was in the set, a hit occured
  			hit_count++;
  			return "hit";
  		} else {
  			// otherwise, a miss occured
  			miss_count++;
  			
  			if (putInSet(targetSet, tag)) {
  				// an eviction occured while putting the tag in the set
  				eviction_count++;
  				return "miss eviction";
  			} else {
  				// no eviction occured, an empty line was found
	  			return "miss";
  			}
  		}

}




/*
 * main(int, char * []) - ...
 */
int main(int argc, char *argv[]) {

	// Set the command line input
	int opt;	
	int verboseFlag = 0, helpFlag = 0;
	int s, E, b;
	char *traceFile;
	
    while((opt = getopt(argc, argv, "vs:E:b:t:h")) != -1) {
        switch(opt) {
        case 'v':
        	// the verboseFlag is set
            verboseFlag = 1;
            break;
        case 'h':
        	// the helpFlag is set
            helpFlag = 1;
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

	if (helpFlag) {
		// print the usage of csim and exit the program successfully
		printUsage();
		exit(0);
	} else if (s == 0 || E == 0 || b == 0 || traceFile == NULL) {
		// if incorrect input was given, exit the program unsuccessfully
        printf("Invalid input\n");
        exit(1);
    }

	
	// check if a valid file was given
	FILE *fptr;
	if ((fptr = fopen(traceFile, "r")) == NULL) {
		// exit the program unsuccessfully if the tracefile could not be opened
		printf("Error opening file");
		exit(1);
	}
	
	
	// create a cache and set it to zero zalues
	struct cache *myCache = malloc(sizeof(struct cache*));
	setCache(myCache, 1 << s, E, 1 << b); // use S=2^s and B=2^b
	

	char instruction;
	mem_addr_t address;
	int size;
	
	while (fscanf(fptr, " %c %llx,%d", &instruction, &address, &size) == 3) {
		// while there is still a line in the file

		if (instruction == 'I') {
			// if there is an 'instruction load' this line, skip this line
			continue;
		}
		
		// run the simulation once (for 'L' or 'S') and record the result
		char status[18] = ""; //"miss eviction hit\0" is the longest status string
		strcat(status, runSim(myCache, address, s, b));
		
		if (instruction == 'M') {
			// run the simulation again, will be a hit regardless?
			strcat(status, " ");
			strcat(status, runSim(myCache, address, s, b));
		}
		
		if (verboseFlag) {
			// if the verbose flag is set, print the input line and hit/miss/eviction status
			status[18] = '\0';
			printf("%c %llx,%d %s\n", instruction, address, size, status);
		}
	}
	
	fclose(fptr); // finished reading from the file
	freeCache(myCache); // finished using the cache
	
    printSummary(hit_count, miss_count, eviction_count);

    return 0;
}



