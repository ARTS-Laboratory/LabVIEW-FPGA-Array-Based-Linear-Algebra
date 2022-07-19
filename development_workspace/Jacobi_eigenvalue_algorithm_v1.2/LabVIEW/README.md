# LabVIEW code for Jacobi Eigenvalue algorithm 

## 2D Jacobi Eigenvalue algorithm
1. v1 has matrices and is the original code from 2019.
1. v2 converts the matrix types to 2D arrays.

## 1D Jacobi Eigenvalue algorithm
1. v1 First try at an implementation of the 1D python code, does not work.
1. v2 Implementation of the 1D python code. I got this to work on a 3x3 matrix array with set numbers, but not on a random array of 3x3. 
1. v3 Added another text matrix, but this one has more complicated numbers (not integers). 
	* I think the major issue on this was that temp was subtracting from the updated box when it should of been getting the previous one. I fixed 3.3.2, but I assume the others are wrong so I moved to a new version.
	* This is correct after 1 rotation, but the 3.1 and 3.2 were not called. 
1. v4 (skipped so LabVIEW will line up with the Python Numbers)
1. v5 Updated where the temp value is called from. Running this code a few time shows the error us usually less tan 0.1%, the highest I saw was 6% on a 30x30 matrix. 
1. v6. A cleaned up code that works. The full code is in this VI. This matches Python v6
1. v7. A cleaned up code that works. This calls the function "eigenvalue"
