# -*- coding: utf-8 -*-
"""
Jacobi eigenvalue algorithm, not to be confused with the Jacobi method which 
is an iterative algorithm for determining the solutions of a strictly 
diagonally dominant system of linear equations.

This code takes a real symmetric matrix  A and returns the eigenvalues. 

As of 10/3 this code is not working
"""

#%% import modules
import IPython as IP
IP.get_ipython().magic('reset -sf')
import matplotlib.pyplot as plt
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import os as os
import numpy as np
import scipy as sp
from scipy.interpolate import griddata
from matplotlib import cm
import time
import subprocess
import pickle
import scipy.io as sio
import sympy as sym
from matplotlib import cm
import re as re
from scipy import signal
import json as json


#from math import sqrt

plt.close('all')

cc = plt.rcParams['axes.prop_cycle'].by_key()['color'] 


#%% Create a real symmetric matrix 

# Set the dimensions of a side of the matrix
n = 3

# create a real symmetric matrix 
A_in_matrix_temp = np.random.rand(n,n)
A_in_matrix = (A_in_matrix_temp+A_in_matrix_temp.T)/2


# a special A matrix for troubleshooping
# A_in_matrix = np.array([[1,2,0],[2,3,4],[0,4,5]])
# n=3

# use scipy to compute the correct eigenvalue. 
scipy_eigvals = np.real(sp.linalg.eig(A_in_matrix)[0])
scipy_eigvals[scipy_eigvals==0]=1E-35   # a small fix so to allow for percent error calculations when a 0 is the true eigenvalue.


# Create the A matrix in a 1D array.
A = np.copy(np.reshape(A_in_matrix,n*n))




#%% Jacobi eigenvalue algorithm in 1D arrays

number_of_rotations = 30000  # Set limit on number of rotations, 5*(n**2) is a default number

# index key
# the key for the index is
# index _ row _ column and is A[row*n+col] where the row is multiplied by n

# Main Loop: Iterate through each step of the algorithm 
for i_rotation in range(number_of_rotations): # Jacobi rotation loop 

    # Step #1: Find the location (in k,l) in the top triangle with the greatest value
    A_Max = 0.0
    for i_row in range(n-1):
        for j_col in range(n-1-i_row):
            index_i_ji1 = (i_row*n)+j_col+i_row+1
            if abs(A[index_i_ji1]) >= A_Max:
                A_Max = abs(A[index_i_ji1]) #i_row,j_col+i_row+1])
                k = i_row
                l = j_col+i_row+1

    # Step #2: Difference of the orthogonal distance & calculate variables for rotation  

    # Step #2.1: Get K[I,I], K[k,k], K[k,l]
    index_k_k = k*n+k 
    index_l_l = l*n+l 
    A_Diff = A[index_l_l] - A[index_k_k] # difference of the orthogonal distance
    index_k_l = k*n+l

    # Step #2.2: update t or calculate phi and t, A[k,l] < abs(A_diff)*1e-36
    if abs(A[index_k_l]) < abs(A_Diff)*1.0e-36:  # some sort of check
        t = A[index_k_l]/A_Diff
    else:   # calculate phi and t for the rotation
        phi = A_Diff/(2.0*A[index_k_l])
        t = 1.0/(abs(phi) + np.sqrt(phi**2 + 1.0))
        if phi < 0.0:
            t = -t
    
    # Step #2.3: Calculate "tau"       
    c = 1.0/np.sqrt(t**2 + 1.0)
    s = t*c
    tau = s/(1.0 + c)
    
    # Step #2.4: update the A matrix
    temp = A[index_k_l]
    A[index_k_l] = 0.0
    A[index_k_k] = A[index_k_k] - t*temp
    A[index_l_l] = A[index_l_l] + t*temp
    
    
    # Step #3: Rotate around the high value point
    for i in range(k):      # Case of i < k
        index_i_k = i*n+k
        index_i_l = i*n+l
        #temp = A[index_i_k] # keeping for now just in case there is an error. 
        
        # Step 3.1.1: Update A[i,k]
        A[index_i_k] = A[index_i_k] - s*(A[index_i_l] + tau*A[index_i_k])
        
        # Step 3.1.2: Update A[i,l]
        A[index_i_l] = A[index_i_l] + s*(A[index_i_k] - tau*A[index_i_l])
        
    for i in range(l-1-k):  # Case of k < i < l
        index_k_i1k = k*n+i+1+k
        index_i1k_l = (i+1+k)*n+l
        #temp = A[index_k_i1k]
        
        # Step 3.2.1: Update A[k,i+1+k?]
        A[index_k_i1k] = A[index_k_i1k] - s*(A[index_i1k_l] + tau*A[index_k_i1k])
        # Step 3.2.2: Update A[i+1+k,l?]
        A[index_i1k_l] = A[index_i1k_l] + s*(A[index_k_i1k] - tau*A[index_i1k_l])
        
        
    for i in range(n-1-l):  # Case of i > l
        index_k_i1l = k*n+i+1+l
        index_l_i1l = n*l+i+1+l        
        #temp = A[index_k_i1l]
        
        # Step 3.3.1: Update A[k,i+1+l?]
        A[index_k_i1l] = A[index_k_i1l] - s*(A[index_l_i1l] + tau*A[index_k_i1l])
        # Step 3.3.2: Update A[l,i+1+l?]
        A[index_l_i1l] = A[index_l_i1l] + s*(A[index_k_i1l] - tau*A[index_l_i1l])


# Step 4: extract the Eigen values from the diagonal
# the Eigen values are on the diagonal of the resulting matrix, so the must be
# pulled out. 
FPGA_Jacobi_eigenvalue = np.zeros(n)
for i in range(n):
    FPGA_Jacobi_eigenvalue[i] = A[i*n+i]  


# for a check, calculate the error between the two methods. They have to be sorted as the order does not come out the same in each method.
error_per = np.abs(np.mean(np.abs(np.sort(FPGA_Jacobi_eigenvalue)-np.sort(scipy_eigvals))/np.sort(scipy_eigvals)))*100
print('total error of ' +str(round(error_per,20))+'%')


error_RMSE = np.sqrt(np.mean((np.sort(FPGA_Jacobi_eigenvalue)-np.sort(scipy_eigvals))**2))
print('RMSE is ' +str(round(error_RMSE,20)))















