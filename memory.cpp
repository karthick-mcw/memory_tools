#include <iostream>
#include <cstdlib>

#define N 3 

// Function to perform matrix multiplication
void matrix_multiply(int A[N][N], int B[N][N], int C[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            C[i][j] = 0;
            for (int k = 0; k < N; ++k) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

int main() {
    // Define two 3x3 matrices for multiplication
    int A[N][N] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    
    int B[N][N] = {
        {2, 2, 2},
        {2, 2, 2},
        {2, 2, 2}
    };
    
    int C[N][N] = {0}; 

    matrix_multiply(A, B, C);

    // Print the result matrix C
    std::cout << "Matrix C (Result of A x B):\n";
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            std::cout << C[i][j] << " "; 
        }
        std::cout << "\n";
    }

    return 0;
}
