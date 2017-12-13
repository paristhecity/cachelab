#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <strings.h>
#include <math.h>

#include "cachelab.h"

// Record the statistics of running the cache
static int hit_count, miss_count, eviction_count;


/* Always use a 64-bit variable to hold memory addresses*/
typedef unsigned long long int mem_addr_t;




struct line {
	int timeUsed;
	int validBit;
	mem_addr_t tag;
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
}




/* 
 * printCache() - prints all of the data in the cache
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
 * setCache() - sets the data in the cache to zero
 */
void setCache(struct cache *myCache, int S, int E, int B) {

	myCache->numSets = S;
	myCache->mySets = malloc(sizeof(struct set) * S);
	
	for (int i = 0; i < S; i++) {
	
		struct set  mySet = myCache->mySets[i];
		mySet.numLines = E;
		mySet.myLines = malloc(sizeof(struct line) * E);
		for (int j = 0; j < E; j++) {
		
			struct line myLine;
			myLine.blockSize = B;
			myLine.timeUsed = 0;
			myLine.validBit = 0;
			myLine.tag = 0; 
			mySet.myLines[j] = myLine;	
		}
		myCache->mySets[i] = mySet;
	}
	
}




/*
 * freeCache() -
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
 * checkEmptyLine() -
 */
int checkEmptyLine(struct set mySet) {

	for (int index = 0; index < mySet.numLines; index ++) {
		if (mySet.myLines[index].validBit == 0) {
			return index;
		}
	}
	
	return -1;
}




/* 
 * getMostRecent() - find the most recently used in this line
 */
int getMostRecent(struct set mySet) {
	int max_used = mySet.myLines[0].timeUsed;
	for (int lineIndex = 1; lineIndex < mySet.numLines; lineIndex ++) {
		struct line currLine = mySet.myLines[lineIndex];
		if (max_used < currLine.timeUsed) {
			max_used = currLine.timeUsed;
		}
	}
	return max_used;
}




/*
 * evictLine() -
 */
int evictLine(struct set mySet) {
	
	//Returns index of least recently used line.

	int lruTime = mySet.myLines[0].timeUsed;
	int lruIndex = 0;


	for (int lineIndex = 1; lineIndex < mySet.numLines; lineIndex++) {
		struct line currLine = mySet.myLines[lineIndex];

		if (currLine.timeUsed < lruTime) {
			lruIndex = lineIndex;	
			lruTime = currLine.timeUsed;
		}

	}

	return lruIndex;
}




/*
 * checkSet() - check if the tag is in the set return 1 if in cache, 0 if not
 */
int checkSet(struct set mySet, mem_addr_t tag) {
	
	for (int lineIndex = 0; lineIndex < mySet.numLines; lineIndex++) {
			
		struct line currLine = mySet.myLines[lineIndex];
			
		if (currLine.validBit && currLine.tag == tag) {
						
			currLine.timeUsed++;
			mySet.myLines[lineIndex] = currLine;
			return 1;
				
		}

	}
			
	return 0;
}




/*
 * putInSet() - return 0 if no eviction, 1 if an eviction
 */
int putInSet(struct set targetSet, mem_addr_t tag) {


	//evict if necessary and write data into cache.
		
	int mostRecent = getMostRecent(targetSet);
	int lineIndex = checkEmptyLine(targetSet);
	int evicted = 0;
	
	if (lineIndex == -1) {
		lineIndex = evictLine(targetSet);
		evicted = 1;
	} 
	
	targetSet.myLines[lineIndex].tag = tag;
	targetSet.myLines[lineIndex].validBit = 1;
	targetSet.myLines[lineIndex].timeUsed = mostRecent + 1;
	
	return evicted;
	
}




/*
 * runSim() -
 */
char *runSim(struct cache *myCache, mem_addr_t address, int s, int b) {

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
  				//
	  			return "miss";
  			}
  		}

}




/*
 * main() -
 */
int main(int argc, char *argv[]) {

	int opt;	
	int verboseFlag = 0, helpFlag = 0;
	int s, E, b;
	char *traceFile;
	
    while((opt = getopt(argc, argv, "vs:E:b:t:h")) != -1) {
        switch(opt) {
        case 'v':
            verboseFlag = 1;
            break;
        case 's':
            s = atoi(optarg);
            break;
        case 'E':
            E = atoi(optarg);
            break;
        case 'b':
            b = atoi(optarg);
            break;
        case 't':
            traceFile = optarg;
            break;
        case 'h':
            helpFlag = 1;
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

	
	// reset the global counters for hits, misses, and evictions
	hit_count = 0;
	miss_count = 0;
	eviction_count = 0;

	
	struct cache *myCache = malloc(sizeof(struct cache*));
	setCache(myCache, 1 << s, E, 1 << b); // use S=2^s and B=2^b
	
	
	FILE *fptr;
	if ((fptr = fopen(traceFile, "r")) == NULL) {
		// quit the program if the tracefile could not be opened
		printf("Error opening file");
		exit(1);
	}
	

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
		char *status;
		status = runSim(myCache, address, s, b);
		
		if (instruction == 'M') {
			// run the simulation again, hit regardless???
			status = runSim(myCache, address, s, b);
		}
		
		if (verboseFlag) {
			// if the verbose flag is set, print the input line and hit/miss/eviction status
			printf("%c %llx,%d %s\n", instruction, address, size, status);
		}
	}
	
	fclose(fptr);
	freeCache(myCache);
	
    printSummary(hit_count, miss_count, eviction_count);

    return 0;
}
