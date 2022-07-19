# -*- coding: utf-8 -*-
"""
To inverse square matrix of order n using Gauss Jordan Elimination. First 
augment input matrix of size n x n by Identity Matrix of size n x n.

After augmentation, row operation is carried out according to Gauss Jordan 
Elimination to transform first n x n part of n x 2n augmented matrix to 
identity matrix.

v1 does the 1D and 2D side by side
v2 does just the 1D
"""

#%% import modules
import IPython as IP
IP.get_ipython().magic('reset -sf')


# Importing NumPy Library
import numpy as np
import sys

#%% build the matrix

# Reading order of matrix
n = 3

# Making numpy joint array of n x 2n size and initializing to zero for storing
# augmented matrix
#A = np.random.rand(n,n)

# This array results in a 163.27% error in the labVIEW code. 
A = np.array([[-0.118752, 0.147569, 0.172393],[0.322827, -0.401167, 0.499674],[-0.338922, -0.0698271, 0.49506]])

#%% Loop #1

# seed the A values into the left hand side of the joint matrix
A_1D = np.reshape(A,-1) 
A_1D_temp = np.zeros(n*n*2)
for i in range(n):        
    for j in range(n):
        A_1D_temp[i*n*2+j] = A_1D[i*n+j]

        
#%% Loop #2

# Augmenting Identity Matrix of Order n.
# this programmatically generate an identity matrix on the right-hand side of 
# the joint system
for i in range(n):        
   for j in range(n):
       if i == j:
           A_1D_temp[(i*2*n)+j+n] = 1
            
            
#%% Loop #3

# Applying Guass Jordan Elimination, this results in a diagonal matrix on the
# left side, but they are not a unity matrix. 
for i in range(n):
    if A_1D_temp[i+(i*2*n)] == 0.0:
        sys.exit('Divide by zero detected!')
        
    for j in range(n):
        if i != j:
            ratio = A_1D_temp[(j*2*n)+i]/A_1D_temp[(i*2*n)+i]

            for k in range(2*n):
                A_1D_temp[(j*2*n)+k] = A_1D_temp[(j*2*n)+k] - ratio * A_1D_temp[(i*2*n)+k]


#%% Loop #4

# Row operation to make principal diagonal element to 1 on the left side of
# the joint matrix
for i in range(n):
    divisor = A_1D_temp[(i*2*n)+i]
    for j in range(2*n):
        A_1D_temp[(i*2*n)+j] = A_1D_temp[(i*2*n)+j]/divisor


#%% Loop #5

# extract the inverse matrix from the right hand side of the joint matrix.
FPGA_inverse = np.zeros(A.shape[0]*A.shape[1])
for i in range(n):
    for j in range(n):
          FPGA_inverse[(i*n)+j] = A_1D_temp[(i*2*n)+j+n]  


python_inverse = np.linalg.inv(A)
    
sum_of_error = np.sum(np.abs(np.reshape(FPGA_inverse,(n,n))- python_inverse))
print(sum_of_error)    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    