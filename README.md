# CUDA Assignment

This repository contains solutions to CUDA problems focused on:

- CUDA kernel launching
- Device memory allocation and transfer
- Thread block layouts

## Problem 1

**Task:** Compute the sum of the first `n = 1024` integers using:
- (a) Iterative approach
- (b) Direct formula

### Output

```
Iterative Sum: 524800
Formula Sum: 524800
```

Both approaches produce the same correct result.

---

## How to Compile

```bash
nvcc sum_iterative.cu -o sum_iterative
./sum_iterative

nvcc sum_formula.cu -o sum_formula
./sum_formula
```
