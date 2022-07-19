# -*- coding: utf-8 -*-
"""
Jacobi eigenvalue algorithm, not to be confused with the Jacobi method which 
is a iterative algorithm for determining the solutions of a strictly 
diagonally dominant system of linear equations.

This code take a real symmetric matrix  A and retruns the eigenvalues. 
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
n = 30

# create a real symmetric matrix 
A_in_matrix_temp = np.random.rand(n,n)
A_in_matrix = (A_in_matrix_temp+A_in_matrix_temp.T)/2


#%% Jacobi eigenvalue algorithm in 1D arrays

max_rotation = 20000  # Set limit on number of rotations, 5*(n**2) is a default number


# index key
# the key for the index is
# index _ row _ column and is A[row*n+col] where row is multiplied by n


A = np.reshape(A_in_matrix,n*n)
for i_rotation in range(max_rotation): # Jacobi rotation loop 

    # find the location (in k,l) in the top triangle with the greatest value
    A_Max = 0.0
    for i_row in range(n-1):
        for j_col in range(n-1-i_row):
            index_i_ji1 = i_row*n+j_col+i_row+1
            if abs(A[index_i_ji1]) >= A_Max:
                A_Max = abs(A[index_i_ji1]) #i_row,j_col+i_row+1])
                k = i_row
                l = j_col+i_row+1
    index_k_k = k*n+k 
    index_l_l = l*n+l 
    A_Diff = A[index_l_l] - A[index_k_k] # difference of the orthogonal distance
    index_k_l = k*n+l
    if abs(A[index_k_l]) < abs(A_Diff)*1.0e-36:  # some sort of check
        t = A[index_k_l]/A_Diff
    else:   # calculate phi and t for the rotation
        phi = A_Diff/(2.0*A[index_k_l])
        t = 1.0/(abs(phi) + np.sqrt(phi**2 + 1.0))
        if phi < 0.0:
            t = -t
    c = 1.0/np.sqrt(t**2 + 1.0)
    s = t*c
    tau = s/(1.0 + c)
    temp = A[index_k_l]
    A[index_k_l] = 0.0
    A[index_k_k] = A[index_k_k] - t*temp
    A[index_l_l] = A[index_l_l] + t*temp
    # rotate around the high value point
    for i in range(k):      # Case of i < k
        index_i_k = i*n+k
        index_i_l = i*n+l
        temp = A[index_i_k]
        A[index_i_k] = temp - s*(A[index_i_l] + tau*temp)
        A[index_i_l] = A[index_i_l] + s*(temp - tau*A[index_i_l])
    for i in range(l-1-k):  # Case of k < i < l
        index_k_i1k = k*n+i+1+k
        index_i1k_l = (i+1+k)*n+l
        temp = A[index_k_i1k]
        A[index_k_i1k] = temp - s*(A[index_i1k_l] + tau*A[index_k_i1k])
        A[index_i1k_l] = A[index_i1k_l] + s*(temp - tau*A[index_i1k_l])
    for i in range(n-1-l):  # Case of i > l
        index_k_i1l = k*n+i+1+l
        index_l_i1l = n*l+i+1+l        
        temp = A[index_k_i1l]
        A[index_k_i1l] = temp - s*(A[index_l_i1l] + tau*temp)
        A[index_l_i1l] = A[index_l_i1l] + s*(temp - tau*A[index_l_i1l])


# resahpe A back to a matrix, the eigenvalues are now on the diagnol. 
A_out_matrix = np.reshape(A,(n,n))
Jacobi_eigvals = np.diagonal(A_out_matrix)

scipy_eigvals = np.real(sp.linalg.eig(A_out_matrix)[0])

# # for a check, calculate the error between the two methods. They have to be sorted as the order does not come out the same in each method.
error = np.mean(np.abs(np.sort(Jacobi_eigvals)-np.sort(scipy_eigvals))/np.sort(scipy_eigvals))*100
print('total error of ' +str(round(error,20))+'%')


















