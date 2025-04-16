#include <iostream>

__global__ void sumIterative(int *arr, int *result, int n) {
    int idx = threadIdx.x;
    int sum = 0;
    if (idx == 0) {
        for (int i = 0; i < n; ++i) {
            sum += arr[i];
        }
        *result = sum;
    }
}

int main() {
    int n = 1024;
    int *h_arr = new int[n];
    int h_result = 0;

    for (int i = 0; i < n; i++) h_arr[i] = i + 1;

    int *d_arr, *d_result;
    cudaMalloc(&d_arr, n * sizeof(int));
    cudaMalloc(&d_result, sizeof(int));
    cudaMemcpy(d_arr, h_arr, n * sizeof(int), cudaMemcpyHostToDevice);

    sumIterative<<<1, 1>>>(d_arr, d_result, n);

    cudaMemcpy(&h_result, d_result, sizeof(int), cudaMemcpyDeviceToHost);
    std::cout << "Iterative Sum: " << h_result << std::endl;

    cudaFree(d_arr);
    cudaFree(d_result);
    delete[] h_arr;
    return 0;
}
