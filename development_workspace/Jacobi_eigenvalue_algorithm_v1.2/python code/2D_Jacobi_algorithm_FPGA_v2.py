# -*- coding: utf-8 -*-
"""

A 2D implementation of the Jacobi Algorithm to find eigenvalues. 


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

# # Set the dimensions of a side of the matrix
# n = 10

# # create a real symmetric matrix 
# A_in_matrix_temp = np.random.rand(n,n)
# A_in_matrix = (A_in_matrix_temp+A_in_matrix_temp.T)/2


# a special A matrix for troubleshooping
A_in_matrix = np.array([[1,2,0],[2,3,4],[0,4,5]])
n=3


# Create the A matrix in a 1D array.
#A = np.copy(np.reshape(A_in_matrix,n*n))





#%% Jacobi eigenvalue algorithm in 2D arrays


A = np.copy(A_in_matrix)
max_rotation = 1  # Set limit on number of rotations, 5*(n**2) is a default number
for i_rotation in range(max_rotation): #for i in range(max_rotation): # Jacobi rotation loop 

    # find the location (in k,l) in the top triangle with the greatest value
    A_Max = 0.0
    for i in range(n-1):
        for j in range(n-1-i):
            if abs(A[i,j+i+1]) >= A_Max:
                A_Max = abs(A[i,j+i+1])
                k = i
                l = j+i+1      

    A_Diff = A[l,l] - A[k,k] # difference of the orthogonal distance
    if abs(A[k,l]) < abs(A_Diff)*1.0e-36:  # some sort of check
        t = A[k,l]/A_Diff
    else:   # calculate phi and t for the rotation
        phi = A_Diff/(2.0*A[k,l])
        t = 1.0/(abs(phi) + np.sqrt(phi**2 + 1.0))
        if phi < 0.0:
            t = -t
    c = 1.0/np.sqrt(t**2 + 1.0)
    s = t*c
    tau = s/(1.0 + c)
    temp = A[k,l]
    A[k,l] = 0.0
    A[k,k] = A[k,k] - t*temp
    A[l,l] = A[l,l] + t*temp
    print(A)  
    break

    # rotate around the high value point
    for i in range(k):      # Case of i < k
        temp = A[i,k]
        A[i,k] = A[i,k] - s*(A[i,l] + tau*A[i,k])
        A[i,l] = A[i,l] + s*(temp - tau*A[i,l])
    for i in range(l-1-k):  # Case of k < i < l
        temp = A[k,i+1+k]
        A[k,i+1+k] = A[k,i+1+k] - s*(A[i+1+k,l] + tau*A[k,i+1+k])
        A[i+1+k,l] = A[i+1+k,l] + s*(temp - tau*A[i+1+k,l])
    for i in range(n-1-l):  # Case of i > l
        temp = A[k,i+1+l]
        A[k,i+1+l] = A[k,i+1+l] - s*(A[l,i+1+l] + tau*A[k,i+1+l])
        A[l,i+1+l] = A[l,i+1+l] + s*(temp - tau*A[l,i+1+l])



Jacobi_eigenvalue = np.diagonal(A)


















# # reshape A back to a matrix, the eigenvalues are now on the diagonal. 
# A_out_matrix = np.reshape(A,(n,n))

scipy_eigvals = np.real(sp.linalg.eig(A_in_matrix)[0])

# # for a check, calculate the error between the two methods. They have to be sorted as the order does not come out the same in each method.
error = np.abs(np.mean(np.abs(np.sort(Jacobi_eigenvalue)-np.sort(scipy_eigvals))/np.sort(scipy_eigvals)))*100
print('total error of ' +str(round(error,20))+'%')


error_RMSE = np.sqrt(np.mean((np.sort(Jacobi_eigenvalue)-np.sort(scipy_eigvals))**2))
print('RMSE is ' +str(round(error_RMSE,20)))





# working 




# C = np.copy(A_in_matrix)
# #n = C.shape[0] # the length of one of the sides of the matirx
# max_rotation = 20000  # Set limit on number of rotations, 5*(n**2) is a default number
# for i_rotation in range(max_rotation): #for i in range(max_rotation): # Jacobi rotation loop 

#     # find the location (in k,l) in the top triangle with the greatest value
#     A_Max = 0.0
#     for i in range(n-1):
#         for j in range(n-1-i):
#             if abs(C[i,j+i+1]) >= A_Max:
#                 A_Max = abs(C[i,j+i+1])
#                 k = i
#                 l = j+i+1      
   
#     C_Diff = C[l,l] - C[k,k] # difference of the orthogonal distance
#     if abs(C[k,l]) < abs(C_Diff)*1.0e-36:  # some sort of check
#         t = C[k,l]/C_Diff
#     else:   # calculate phi and t for the rotation
#         phi = C_Diff/(2.0*C[k,l])
#         t = 1.0/(abs(phi) + np.sqrt(phi**2 + 1.0))
#         if phi < 0.0:
#             t = -t
#     c = 1.0/np.sqrt(t**2 + 1.0)
#     s = t*c
#     tau = s/(1.0 + c)
#     temp = C[k,l]
#     C[k,l] = 0.0
#     C[k,k] = C[k,k] - t*temp
#     C[l,l] = C[l,l] + t*temp
#     # rotate around the high value point
#     for i in range(k):      # Case of i < k
#         temp = C[i,k]
#         C[i,k] = C[i,k] - s*(C[i,l] + tau*C[i,k])
#         C[i,l] = C[i,l] + s*(temp - tau*C[i,l])
#     for i in range(l-1-k):  # Case of k < i < l
#         temp = C[k,i+1+k]
#         C[k,i+1+k] = C[k,i+1+k] - s*(C[i+1+k,l] + tau*C[k,i+1+k])
#         C[i+1+k,l] = C[i+1+k,l] + s*(temp - tau*C[i+1+k,l])
#     for i in range(n-1-l):  # Case of i > l
#         temp = C[k,i+1+l]
#         C[k,i+1+l] = C[k,i+1+l] - s*(C[l,i+1+l] + tau*C[k,i+1+l])
#         C[l,i+1+l] = C[l,i+1+l] + s*(temp - tau*C[l,i+1+l])



# Jacobi_eigenvalue = np.diagonal(C)







































































#
##%% Jacobi eigenvalue algorithm in 2D arrays
#
#C_input = np.copy(C)
#n = C.shape[0] # the length of one of the sides of the matirx
#max_rotation = 2000  # Set limit on number of rotations, 5*(n**2) is a default number
#for i in range(max_rotation): # Jacobi rotation loop 
#
##     find the location (in k,l) in the top triangle with the greatest value
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
#




















