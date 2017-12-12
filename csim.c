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


	int s; /* 2**s cache sets */
	int b; /* cacheline block size 2**b bytes */
	int E; /* number of cachelines per set */
	int S; /* number of sets, derived from S = 2**s */
	int B; /* cacheline block size (bytes), derived from B = 2**b */




struct line {
	int last_used;
	int valid;
	mem_addr_t tag;
	char *block;
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


int verbosity;



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


/* setCache() - sets the data in the cache to zero
*/
void setCache(struct cache *myCache) {

	myCache->numSets = S;
	myCache->mySets = malloc(sizeof(struct set) * S);
	
	for (int i = 0; i < S; i++) {
	
		struct set  mySet = myCache->mySets[i];
		mySet.numLines = E;
		mySet.myLines = malloc(sizeof(struct line) * E);
		
		for (int j = 0; j < E; j++) {
		
			struct line myLine;
			myLine.blockSize = B;
			myLine.last_used = 0;
			myLine.valid = 0;
			myLine.tag = 0; 
			mySet.myLines[j] = myLine;	
		}
		
	}
	
}



struct cache build_cache(int num_sets, int num_lines, int block_size) 
{

	struct cache newCache;	
	struct set mySet;
	struct line myLine;

	newCache.mySets = (struct set *) malloc(sizeof(struct set) * num_sets);

	for (int setIndex = 0; setIndex < num_sets; setIndex ++) {
		
		mySet.myLines =  (struct line *) malloc(sizeof(struct line) * num_lines);
		newCache.mySets[setIndex] = mySet;

		for (int lineIndex = 0; lineIndex < num_lines; lineIndex ++) {
			
			myLine.last_used = 0;
			myLine.valid = 0;
			myLine.tag = 0; 
			mySet.myLines[lineIndex] = myLine;	
		}
		
	} 

	return newCache;
	
}



/*
 *
 */
void freeCache(struct cache sim_cache, long long num_sets, int num_lines, long long block_size) {
	

	for (int setIndex = 0; setIndex < num_sets; setIndex ++) 
	{
		struct set mySet = sim_cache.mySets[setIndex];
		
		if (mySet.myLines != NULL) {	
			free(mySet.myLines);
		}
		
	} 
	if (sim_cache.mySets != NULL) {
		free(sim_cache.mySets);
	}
}



/*
 *
 */
int find_empty_line(struct set query_set) {
	
	int num_lines = E;
	struct line myLine;

	for (int index = 0; index < num_lines; index ++) {
		myLine = query_set.myLines[index];
		if (myLine.valid == 0) {
			return index;
		}
	}
	//Control flow should not fall here. Method is only called if cache_full flag is set to false.
	return -1;
}



/*
 *
 */
int find_evict_line(struct set query_set, int *used_lines) {
	
	//Returns index of least recently used line.
	//used_lines[0] gives least recently used line, used_lines[1] gives current lru counter or most recently used line.
	int num_lines = E;
	int max_used = query_set.myLines[0].last_used;
	int min_used = query_set.myLines[0].last_used;
	int min_used_index = 0;

	struct line myLine;

	for (int lineIndex = 1; lineIndex < num_lines; lineIndex ++) {
		myLine = query_set.myLines[lineIndex];

		if (min_used > myLine.last_used) {
			min_used_index = lineIndex;	
			min_used = myLine.last_used;
		}

		if (max_used < myLine.last_used) {
			max_used = myLine.last_used;
		}
	}

	used_lines[0] = min_used;
	used_lines[1] = max_used;
	return min_used_index;
}



/*
 *
 */
void run_sim(struct cache sim_cache, mem_addr_t address) {
		
		int cache_full = 1;

		int num_lines = E;
		int prev_hits = hit_count;

		int tag_size = (64 - (s + b));
		mem_addr_t input_tag = address >> (s + b);
		unsigned long long setIndex = (address << tag_size) >> (tag_size + b);
		
  		struct set query_set = sim_cache.mySets[setIndex];

		for (int lineIndex = 0; lineIndex < num_lines; lineIndex ++) 	{
			
			struct line myLine = query_set.myLines[lineIndex];
			
			if (myLine.valid) {
					
				if (myLine.tag == input_tag) {
						
					myLine.last_used ++;
					hit_count ++;
					query_set.myLines[lineIndex] = myLine;
				}

			} else if (!(myLine.valid) && (cache_full)) {
				//We found an empty line
				cache_full = 0;		
			}

		}	

		if (prev_hits == hit_count) {
			//Miss in cache;
			miss_count++;
		} else {
			//Data is in cache
			return;
		}

		//We missed, so evict if necessary and write data into cache.
		
		int *used_lines = (int*) malloc(sizeof(int) * 2);
		int min_used_index = find_evict_line(query_set, used_lines);	

		if (cache_full) 
		{
			eviction_count++;

			//Found least-recently-used line, overwrite it.
			query_set.myLines[min_used_index].tag = input_tag;
			query_set.myLines[min_used_index].last_used = used_lines[1] + 1;
		
		}

		else
	        {
			int empty_index = find_empty_line(query_set);

			//Found first empty line, write to it.
			query_set.myLines[empty_index].tag = input_tag;
			query_set.myLines[empty_index].valid = 1;
			query_set.myLines[empty_index].last_used = used_lines[1] + 1;
		}						

		free(used_lines);
		return;
}



/*
 *
 */
int main(int argc, char *argv[]) {

	int opt;	

	char *traceFile;
	
    while((opt = getopt(argc, argv, "vs:E:b:t:h")) != -1) {
        switch(opt) {
        case 'v':
            verbosity = 1;
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
            printUsage();
            exit(0);
        }
    }

    if (s == 0 || E == 0 || b == 0 || traceFile == NULL) 
	{
        printf("%s: Missing required command line argument\n", argv[0]);
        printUsage(argv);
        exit(1);
    }

	
	
	hit_count = 0;
	miss_count = 0;
	eviction_count = 0;
	
	//struct cache myCache build_cache(1 << s, E, 1 << b);
	struct cache *myCache = malloc(sizeof(struct cache));
	setCache(myCache);
	
	
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

		switch(instruction) {
			case 'I':
				break;
			case 'L':
				run_sim(myCache, address);
				break;
			case 'S':
				run_sim(myCache, address);
				break;
			case 'M':
				run_sim(myCache, address);
				run_sim(myCache, address);	
				break;
		}
	}
	
	freeCache(myCache, 1 << s, E, 1 << b);
	
    printSummary(hit_count, miss_count, eviction_count);
	fclose(fptr);

    return 0;
}
