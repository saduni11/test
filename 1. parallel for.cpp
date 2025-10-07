    
    #include <stdio.h>
    #include <omp.h>  

    int main() {
        int i;
        #pragma omp parallel for
        for (i = 0; i < 20; i++) {
            printf("Thread %d working on iteration %d\n", omp_get_thread_num(), i);
        }

        return 0;
    }

