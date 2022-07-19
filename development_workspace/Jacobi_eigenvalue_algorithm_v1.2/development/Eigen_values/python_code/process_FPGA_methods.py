# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
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
import make_M_K as MK


#from math import sqrt

plt.close('all')

cc = plt.rcParams['axes.prop_cycle'].by_key()['color'] 

#%% Cholesky decomposition

M,K = MK.make_M_K()

# Cholesky factorization
L = np.zeros(M.shape)
for i in range(M.shape[0]):
    for j in range(i+1):
        s=0
        for k in range(j):
            s = (L[i][k] * L[j][k])+s
        if (i == j):
            L[i][j] = np.sqrt(M[i][i] - s)
        else:
            L[i][j] = (1.0 / L[j][j] * (M[i][j] - s))
                 

# build the reduction matrix A'
A1 = np.matmul(K,sp.linalg.inv(L.T))
C = np.matmul(sp.linalg.inv(L),A1)

# some small errors exist in the matrix so its not perfectly symmetrical, this takes the average so it symmetric
C = (C+C.T)/2


#%% Jacobi eigenvalue algorithm

C_input = np.copy(C)
n = C.shape[0] # the length of one of the sides of the matirx
max_rotation = 100  # Set limit on number of rotations, 5*(n**2) is a default number
p = np.identity(n)*1.0     # Initialize transformation matrix
for i in range(max_rotation): # Jacobi rotation loop 

    # find the location (in k,l) in the top triangle with the greatest value
    C_Max = 0.0
    for i in range(n-1):
        for j in range(i+1,n):
            if abs(C[i,j]) >= C_Max:
                C_Max = abs(C[i,j])
                k = i
                l = j      
    
    C_Diff = C[l,l] - C[k,k] # difference of the orthogonal distance
    if abs(C[k,l]) < abs(C_Diff)*1.0e-36:  # some sort of check
        t = C[k,l]/C_Diff
    else:   # calculate phi and t for the rotation
        phi = C_Diff/(2.0*C[k,l])
        t = 1.0/(abs(phi) + np.sqrt(phi**2 + 1.0))
        if phi < 0.0:
            t = -t
    c = 1.0/np.sqrt(t**2 + 1.0)
    s = t*c
    tau = s/(1.0 + c)
    temp = C[k,l]
    C[k,l] = 0.0
    C[k,k] = C[k,k] - t*temp
    C[l,l] = C[l,l] + t*temp
    # rotate around the high value point
    for i in range(k):      # Case of i < k
        temp = C[i,k]
        C[i,k] = temp - s*(C[i,l] + tau*temp)
        C[i,l] = C[i,l] + s*(temp - tau*C[i,l])
    for i in range(k+1,l):  # Case of k < i < l
        temp = C[k,i]
        C[k,i] = temp - s*(C[i,l] + tau*C[k,i])
        C[i,l] = C[i,l] + s*(temp - tau*C[i,l])
    for i in range(l+1,n):  # Case of i > l
        temp = C[k,i]
        C[k,i] = temp - s*(C[l,i] + tau*temp)
        C[l,i] = C[l,i] + s*(temp - tau*C[l,i])
    for i in range(n):      # Update transformation matrix
        temp = p[i,k]
        p[i,k] = temp - s*(p[i,l] + tau*p[i,k])
        p[i,l] = p[i,l] + s*(temp - tau*p[i,l])

eigvals_LU_2 = np.diagonal(C)

#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(eigvals_LU_2)))) # Natural frequencies, rad/s
Frequencies = np.expand_dims(FEA_wn/(2*np.pi),axis=1) # Natural freq in Hz
print(Frequencies)





