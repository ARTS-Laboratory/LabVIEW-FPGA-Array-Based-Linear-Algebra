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
import json as json


#from math import sqrt

plt.close('all')

cc = plt.rcParams['axes.prop_cycle'].by_key()['color'] 


#%% Load the M and K matrix

with open('data/data_19_nodes.txt') as json_file:  
    D = json.load(json_file)

M = np.asarray(D['M'])
K = np.asarray(D['K'])



#%% Cholesky decomposition with square root in 1-D
    
n= M.shape[0]
M = np.reshape(M,n*n)
L = np.zeros(n*n)
for i_row in range(n):
    for j_col in range(i_row+1):
        s=0
        index_i_j = i_row*n+j_col
        index_j_j = j_col*n+j_col
        for k in range(j_col):
            index_i_K =  i_row*n+k
            index_j_K =  j_col*n+k
            s = (L[index_i_K] * L[index_j_K])+s
        if i_row == j_col:
            L[index_i_j] = np.sqrt(M[index_i_j] - s)
        else:
            L[index_i_j] = (1.0 / L[index_j_j] * (M[index_i_j] - s))

# convert from flat back to matrix for simplicity
L = np.reshape(L,(n,n))
K = np.reshape(K,(n,n))
M = np.reshape(M,(n,n))

# build the reduction matrix C
# Use this line for lower where M = L*L^T and C = L^-1*K*L^-T
C = np.matmul(sp.linalg.inv(L),np.matmul(K,sp.linalg.inv(L.T)))

# In LabVIEW the Cholesky only gives the upper so it uses M = U^T*U and C = U^-T*K*U^-1
# https://www.netlib.org/lapack/lug/node54.html

# some small errors exist in the matrix so its not perfectly symmetrical, this takes the average so it symmetric
C = (C+C.T)/2

L_python = np.linalg.cholesky(M)              

#%% Jacobi eigenvalue algorithm in 1D arrays

max_rotation = 2000  # Set limit on number of rotations, 5*(n**2) is a default number

C_input = np.copy(C)
C = np.reshape(C,n*n)
for i_rotation in range(max_rotation): # Jacobi rotation loop 

    # find the location (in k,l) in the top triangle with the greatest value
    C_Max = 0.0
    for i_row in range(n-1):
        for j_col in range(n-1-i_row):
            i_j_index = j_col+i_row+1+i_row*n
            
            if abs(C[i_j_index]) >= C_Max:
                C_Max = abs(C[i_j_index]) #i_row,j_col+i_row+1])
                k = i_row
                l = j_col+i_row+1      
    
    C_Diff = C[(n+1)*l] - C[(n+1)*k] # difference of the orthogonal distance
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
    for i in range(l-1-k):  # Case of k < i < l
        temp = C[k,i+1+k]
        C[k,i+1+k] = temp - s*(C[i+1+k,l] + tau*C[k,i+1+k])
        C[i+1+k,l] = C[i+1+k,l] + s*(temp - tau*C[i+1+k,l])
    for i in range(n-1-l):  # Case of i > l
        temp_i = i+1+l
        temp = C[k,temp_i]
        C[k,temp_i] = temp - s*(C[l,temp_i] + tau*temp)
        C[l,temp_i] = C[l,temp_i] + s*(temp - tau*C[l,temp_i])

eigvals_LU_2 = np.diagonal(C)

#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn = np.sort(np.sqrt(eigvals_LU_2)) # Natural frequencies, rad/s
Frequencies = FEA_wn/(2*np.pi) # Natural freq in Hz
print(Frequencies[0:3])

# for a check, calculate the frequencies using python libaries
eigvals_python,eigvects_python = sp.linalg.eig(K,M)
Frequencies_python = np.sort(np.sqrt(np.real(eigvals_python))) /(2*np.pi) # Natural freq in Hz
error = np.mean(np.abs(Frequencies-Frequencies_python)/Frequencies_python)*100
print('total error of ' +str(round(error,8))+'%')


#%% Jacobi eigenvalue algorithm in 2D arrays
#
#C_input = np.copy(C)
#n = C.shape[0] # the length of one of the sides of the matirx
#max_rotation = 2000  # Set limit on number of rotations, 5*(n**2) is a default number
#for i in range(max_rotation): # Jacobi rotation loop 
#
    # find the location (in k,l) in the top triangle with the greatest value
#    C_Max = 0.0
#    for i in range(n-1):
#        for j in range(n-1-i):
#            if abs(C[i,j+i+1]) >= C_Max:
#                C_Max = abs(C[i,j+i+1])
#                k = i
#                l = j+i+1      
#    
#    C_Diff = C[l,l] - C[k,k] # difference of the orthogonal distance
#    if abs(C[k,l]) < abs(C_Diff)*1.0e-36:  # some sort of check
#        t = C[k,l]/C_Diff
#    else:   # calculate phi and t for the rotation
#        phi = C_Diff/(2.0*C[k,l])
#        t = 1.0/(abs(phi) + np.sqrt(phi**2 + 1.0))
#        if phi < 0.0:
#            t = -t
#    c = 1.0/np.sqrt(t**2 + 1.0)
#    s = t*c
#    tau = s/(1.0 + c)
#    temp = C[k,l]
#    C[k,l] = 0.0
#    C[k,k] = C[k,k] - t*temp
#    C[l,l] = C[l,l] + t*temp
#    # rotate around the high value point
#    for i in range(k):      # Case of i < k
#        temp = C[i,k]
#        C[i,k] = temp - s*(C[i,l] + tau*temp)
#        C[i,l] = C[i,l] + s*(temp - tau*C[i,l])
#    for i in range(k+1,l):  # Case of k < i < l
#        temp = C[k,i]
#        C[k,i] = temp - s*(C[i,l] + tau*C[k,i])
#        C[i,l] = C[i,l] + s*(temp - tau*C[i,l])
#    for i in range(l+1,n):  # Case of i > l
#        temp = C[k,i]
#        C[k,i] = temp - s*(C[l,i] + tau*temp)
#        C[l,i] = C[l,i] + s*(temp - tau*C[l,i])
#
#eigvals_LU_2 = np.diagonal(C)
#
##eigvals=np.expand_dims(np.real(eigvals), axis=0)
#FEA_wn = np.sort(np.sqrt(eigvals_LU_2)) # Natural frequencies, rad/s
#Frequencies = FEA_wn/(2*np.pi) # Natural freq in Hz
#print(Frequencies[0:3])
#
## for a check, calculate the frequencies using python libaries
#eigvals_python,eigvects_python = sp.linalg.eig(K,M)
#Frequencies_python = np.sort(np.sqrt(np.real(eigvals_python))) /(2*np.pi) # Natural freq in Hz
#error = np.mean(np.abs(Frequencies-Frequencies_python)/Frequencies_python)*100
#print('total error of ' +str(round(error,5))+'%')
#





















