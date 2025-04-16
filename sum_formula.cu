#include <iostream>

__global__ void sumFormula(int n, int *result) {
    if (threadIdx.x == 0) {
        *result = n * (n + 1) / 2;
    }
}

int main() {
    int n = 1024;
    int h_result = 0;
    int *d_result;

    cudaMalloc(&d_result, sizeof(int));
    sumFormula<<<1, 1>>>(n, d_result);
    cudaMemcpy(&h_result, d_result, sizeof(int), cudaMemcpyDeviceToHost);

    std::cout << "Formula Sum: " << h_result << std::endl;

    cudaFree(d_result);
    return 0;
}
