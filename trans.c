/* 
 * trans.col - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
	int blocksize; // dimensions of block
	int col, row; // variables to iterate between blocks
	int i, j, d; // variables to iterate within blocks, d when i and j are equal
	int temp; //temporary variablt to transfer A -> B
	int e0, e1, e2, e3, e4; // elements of block with dimensions 64x64

	// Block sizes according to Matrix dimensions
	if(N == 32 && M == 32)
		blocksize = 8;
	else if(N == 64 && M == 64)
		blocksize = 4;
	else
		blocksize = 16;


	if(N == 32 && M == 32) {
		for(row = 0; row < N; row += blocksize) {
			for(col = 0; col < M; col += blocksize) {
				for(i = row; i < row + blocksize; i++) {
					for(j = col; j < col + blocksize; j++){
						if(i != j) {
							B[j][i] = A[i][j];
						}
						else {
							temp = A[i][j];
							d = i;
						}
					}
					if (row == col)	
					{
						B[d][d] = temp;
					}
				}
			}
		}
	}
	else if(N == 64 && M == 64){
		for(row = 0; row < N; row += blocksize) {
			for(col = 0; col < M; col += blocksize) {

				//Elements reassigned to separate variables from A[row][], A[row+1][], A[row+2][]
				//because A[][] cannot be modiied
				e0 = A[row][col];
				e1 = A[row+1][col];
				e2 = A[row+2][col];
				e3 = A[row+2][col+1];
				e4 = A[row+2][col+2];

				//Elements assigned to B[col+3][]
				B[col+3][row] = A[row][col+3];
				B[col+3][row+1] = A[row+1][col+3];
				B[col+3][row+2] = A[row+2][col+3];

				//Elements assigned to B[col+2][] 
				B[col+2][row] = A[row][col+2];
				B[col+2][row+1] = A[row+1][col+2];
				B[col+2][row+2] = e4;

				//Elements assigned to B[col+1][]
				e4 = A[row+1][col+1];
				B[col+1][row] = A[row][col+1];
				B[col+1][row+1] = e4;
				B[col+1][row+2] = e3;

				//Elements assigned to B[col][]
				B[col][row] = e0;
				B[col][row+1] = e1;
				B[col][row+2] = e2;

				//Elements assigned from A[row+3][] to B[...][row+3]
				B[col][row+3] = A[row+3][col];
				B[col+1][row+3] = A[row+3][col+1];
				B[col+2][row+3] = A[row+3][col+2];

				//Elements asigned to B[col+3][]
				e0 = A[row+3][col+3];
				B[col+3][row+3] = e0;
			}
		}
	}
	else {
		for(row = 0; row < N; row += blocksize) {
			for(col = 0; col < M; col += blocksize) {
				for(i = row; i < row + blocksize && i < N; i++) {
					for(j = col; j < col + blocksize && j < M; j++){
							temp = A[i][j];
							B[j][i] = temp;
						
					}
				}
			}
		}
	}
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}
