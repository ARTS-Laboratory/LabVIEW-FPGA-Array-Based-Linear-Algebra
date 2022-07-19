# -*- coding: utf-8 -*-
"""
To inverse square matrix of order n using Gauss Jordan Elimination. First 
augment input matrix of size n x n by Identity Matrix of size n x n.

After augmentation, row operation is carried out according to Gauss Jordan 
Elimination to transform first n x n part of n x 2n augmented matrix to 
identity matrix.
"""

#%% import modules
import IPython as IP
IP.get_ipython().magic('reset -sf')


# Importing NumPy Library
import numpy as np
import sys

# Reading order of matrix
n = 100

# Making numpy array of n x 2n size and initializing 
# to zero for storing augmented matrix


a = np.random.rand(n,n)


a_temp = np.hstack((a,np.zeros(a.shape)))

# Augmenting Identity Matrix of Order n
for i in range(n):        
    for j in range(n):
        if i == j:
            a_temp[i][j+n] = 1

# Applying Guass Jordan Elimination
for i in range(n):
    if a_temp[i][i] == 0.0:
        sys.exit('Divide by zero detected!')
        
    for j in range(n):
        if i != j:
            ratio = a_temp[j][i]/a_temp[i][i]

            for k in range(2*n):
                a_temp[j][k] = a_temp[j][k] - ratio * a_temp[i][k]

# Row operation to make principal diagonal element to 1
for i in range(n):
    divisor = a_temp[i][i]
    for j in range(2*n):
        a_temp[i][j] = a_temp[i][j]/divisor


FPGA_inverse = a_temp[:,n:]
python_inverse = np.linalg.inv(a)
    
sum_of_error = np.sum(np.abs(FPGA_inverse- python_inverse))
print(sum_of_error)    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    