/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
// 519021910380 Lin Qilong
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
void transpose_submit(int M, int N, int A[N][M], int B[M][N]){
    // all local variables (12 in total)
    int im, jm, i, j;
    int tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;


    if (M == 32 && N == 32) {
        // 8 * 8 blocks
        for (im = 0; im < 4; ++im) {
            for (jm = 0; jm < 4; ++jm) {
                for (i = 0; i < 8; ++i) {
                    for (j = 0; j < 8; ++j) {
                        if (i != j){
                            B[8 * jm + j][8 * im + i] = A[8 * im + i][8 * jm + j];
                        }
                    }
                    B[8 * jm + i][8 * im + i] = A[8 * im + i][8 * jm + i];
                }
            }
        }
    }
    else if (M == 64 && N == 64){
        //still spilt into 8*8 blocks
        for (im = 0; im < 8; ++im){
            for (jm = 0; jm < 8; ++jm){
                // BUT for each 8*8 block
                // split into 4 4*4 smaller blocks
                // use the target matrix & some temporary variable to record the right top / left botton small block
                // to reduce missing

                
                for (i = 0; i < 4; ++i){
                    // as normal
                    tmp0 = A[im * 8 + i][jm * 8 + 0];
                    tmp1 = A[im * 8 + i][jm * 8 + 1];
                    tmp2 = A[im * 8 + i][jm * 8 + 2];
                    tmp3 = A[im * 8 + i][jm * 8 + 3];
                    tmp4 = A[im * 8 + i][jm * 8 + 4];
                    tmp5 = A[im * 8 + i][jm * 8 + 5];
                    tmp6 = A[im * 8 + i][jm * 8 + 6];
                    tmp7 = A[im * 8 + i][jm * 8 + 7];

                    B[jm * 8 + 0][im * 8 + i] = tmp0;
                    B[jm * 8 + 1][im * 8 + i] = tmp1;
                    B[jm * 8 + 2][im * 8 + i] = tmp2;
                    B[jm * 8 + 3][im * 8 + i] = tmp3;

                    // right top
                    // store for temporary on B's right top
                    B[jm * 8 + 0][im * 8 + i + 4] = tmp4;
                    B[jm * 8 + 1][im * 8 + i + 4] = tmp5;
                    B[jm * 8 + 2][im * 8 + i + 4] = tmp6;
                    B[jm * 8 + 3][im * 8 + i + 4] = tmp7;
                }

                for (j = 0; j < 4; ++j){
                    // store the temporary variable above
                    tmp0 = B[jm * 8 + j][im * 8 + 4];
                    tmp1 = B[jm * 8 + j][im * 8 + 5];
                    tmp2 = B[jm * 8 + j][im * 8 + 6];
                    tmp3 = B[jm * 8 + j][im * 8 + 7];

                    // write the top right datas correctly
                    tmp4 = A[im * 8 + 4][jm * 8 + j];
                    tmp5 = A[im * 8 + 5][jm * 8 + j];
                    tmp6 = A[im * 8 + 6][jm * 8 + j];
                    tmp7 = A[im * 8 + 7][jm * 8 + j];

                    B[jm * 8 + j][im * 8 + 4] = tmp4;
                    B[jm * 8 + j][im * 8 + 5] = tmp5;
                    B[jm * 8 + j][im * 8 + 6] = tmp6;
                    B[jm * 8 + j][im * 8 + 7] = tmp7;

                    // get the button right datas
                    tmp4 = A[im * 8 + 4][jm * 8 + j + 4];
                    tmp5 = A[im * 8 + 5][jm * 8 + j + 4];
                    tmp6 = A[im * 8 + 6][jm * 8 + j + 4];
                    tmp7 = A[im * 8 + 7][jm * 8 + j + 4];

                    // store back tem variables (button parts)
                    B[jm * 8 + j + 4][im * 8 + 0] = tmp0;
                    B[jm * 8 + j + 4][im * 8 + 1] = tmp1;
                    B[jm * 8 + j + 4][im * 8 + 2] = tmp2;
                    B[jm * 8 + j + 4][im * 8 + 3] = tmp3;
                    B[jm * 8 + j + 4][im * 8 + 4] = tmp4;
                    B[jm * 8 + j + 4][im * 8 + 5] = tmp5;
                    B[jm * 8 + j + 4][im * 8 + 6] = tmp6;
                    B[jm * 8 + j + 4][im * 8 + 7] = tmp7;
                }
            }
        }
    }
    else if (M == 61 && N == 67){
        // 16 * 16 blocks
        for (im = 0; im < 5; ++im) {
            for (jm = 0; jm < 4; ++jm) {
                for (i = 0; i < 16 && im * 16 + i < N; ++i) {
                    for (j = 0; j < 16 && jm * 16 + j < M; ++j) {
                        B[16 * jm + j][16 * im + i] = A[16 * im + i][16 * jm + j];
                    }
                }
            }
        }
    }
    else {
        for (i = 0; i < N; ++i){
            for (j = 0; j < M; ++j){
                B[j][i] = A[i][j];
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

