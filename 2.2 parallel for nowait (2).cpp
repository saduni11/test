#include <omp.h>
#include <stdio.h>

#define WORKLOAD_SIZE 8

// Function to compute factorial (simplified for large numbers)
unsigned long long factorial(int n) {
    unsigned long long result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int workload[WORKLOAD_SIZE] = { 100000, 10000, 20000, 800000, 1000, 400000, 5000, 25000 }; // Example workload sizes
    double start, end;

    // Measure time without 'nowait'
    start = omp_get_wtime();

    #pragma omp parallel num_threads(8)
    {
        #pragma omp for
        for (int i = 0; i < WORKLOAD_SIZE; i++) {
            printf("Thread %d calculating factorial of %d\n", omp_get_thread_num(), workload[i]);
            unsigned long long result = factorial(workload[i]);
        }
    }

    end = omp_get_wtime();
    printf("Time without nowait: %f seconds\n\n", end - start);

    // Measure time with 'nowait'
    start = omp_get_wtime();
    
    #pragma omp parallel num_threads(8)
    {
        #pragma omp for nowait
        for (int i = 0; i < WORKLOAD_SIZE; i++) {
            printf("Thread %d calculating factorial of %d\n", omp_get_thread_num(), workload[i]);
            unsigned long long result = factorial(workload[i]);
        }
        // No barrier here due to nowait
    }

    end = omp_get_wtime();
    printf("Time with nowait: %f seconds\n", end - start);

    return 0;
}