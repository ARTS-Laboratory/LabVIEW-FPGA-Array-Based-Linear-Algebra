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

from numpy import array,identity,diagonal
from math import sqrt

plt.close('all')

cc = plt.rcParams['axes.prop_cycle'].by_key()['color'] 



def jacobi(a,tol = 1.0e-100): # Jacobi method

    def maxElem(a): # Find largest off-diag. element a[k,l]
        n = len(a)
        aMax = 0.0
        for i in range(n-1):
            for j in range(i+1,n):
                if abs(a[i,j]) >= aMax:
                    aMax = abs(a[i,j])
                    k = i; l = j
        return aMax,k,l

    def rotate(a,p,k,l): # Rotate to make a[k,l] = 0
        n = len(a)
        aDiff = a[l,l] - a[k,k]
        if abs(a[k,l]) < abs(aDiff)*1.0e-36: t = a[k,l]/aDiff
        else:
            phi = aDiff/(2.0*a[k,l])
            t = 1.0/(abs(phi) + sqrt(phi**2 + 1.0))
            if phi < 0.0: t = -t
        c = 1.0/sqrt(t**2 + 1.0); s = t*c
        tau = s/(1.0 + c)
        temp = a[k,l]
        a[k,l] = 0.0
        a[k,k] = a[k,k] - t*temp
        a[l,l] = a[l,l] + t*temp
        for i in range(k):      # Case of i < k
            temp = a[i,k]
            a[i,k] = temp - s*(a[i,l] + tau*temp)
            a[i,l] = a[i,l] + s*(temp - tau*a[i,l])
        for i in range(k+1,l):  # Case of k < i < l
            temp = a[k,i]
            a[k,i] = temp - s*(a[i,l] + tau*a[k,i])
            a[i,l] = a[i,l] + s*(temp - tau*a[i,l])
        for i in range(l+1,n):  # Case of i > l
            temp = a[k,i]
            a[k,i] = temp - s*(a[l,i] + tau*temp)
            a[l,i] = a[l,i] + s*(temp - tau*a[l,i])
        for i in range(n):      # Update transformation matrix
            temp = p[i,k]
            p[i,k] = temp - s*(p[i,l] + tau*p[i,k])
            p[i,l] = p[i,l] + s*(temp - tau*p[i,l])
        
    n = len(a)
    maxRot = 5*(n**2)       # Set limit on number of rotations
    p = identity(n)*1.0     # Initialize transformation matrix
    for i in range(maxRot): # Jacobi rotation loop 
        aMax,k,l = maxElem(a)
        if aMax < tol: return diagonal(a),p
        rotate(a,p,k,l)
    print('Jacobi method did not converge')




#%% Define the matrix

#A = np.random.choice(9, (3,3))
#B = np.random.choice(9, (3,3))
#A = np.array(([1,1],[1,1]))
#B = np.array(([2,2],[2,2]))

M,K = MK.make_M_K(beam_node_num = 5)

general_eigvals_python,eigvects = sp.linalg.eig(K,M)




M_inv = sp.linalg.inv(M)
M_inv_K = np.matmul(M_inv,K)
eigvals_BA,eigvects_BA = sp.linalg.eig(M_inv_K)

eigvals_Jacobi,p = jacobi(M_inv_K)



# Cholesky factorization
L = np.linalg.cholesky(M)
M_LU = np.matmul(L,L.T)

# build the reduction matrix A'
A1 = np.matmul(K,sp.linalg.inv(L.T))
C = np.matmul(sp.linalg.inv(L),A1)

C = (C+C.T)/2

general_eigvals_LU,eigvects = np.linalg.eig(C)

general_eigvals_LU = np.sort(general_eigvals_LU)

eigvals_LU,p = jacobi(C)



#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn_python = np.sort(np.real(np.squeeze(np.sqrt(general_eigvals_python)))) # Natural frequencies, rad/s
Frequencies_python = np.expand_dims(FEA_wn_python/(2*np.pi),axis=1) # Natural freq in Hz
print(Frequencies_python)


#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(eigvals_BA)))) # Natural frequencies, rad/s
Frequencies = np.expand_dims(FEA_wn/(2*np.pi),axis=1) # Natural freq in Hz
print(Frequencies)

#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(eigvals_Jacobi)))) # Natural frequencies, rad/s
Frequencies = np.expand_dims(FEA_wn/(2*np.pi),axis=1) # Natural freq in Hz
print(Frequencies)


#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(general_eigvals_LU)))) # Natural frequencies, rad/s
Frequencies = np.expand_dims(FEA_wn/(2*np.pi),axis=1) # Natural freq in Hz
print(Frequencies)

#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(eigvals_LU)))) # Natural frequencies, rad/s
Frequencies = np.expand_dims(FEA_wn/(2*np.pi),axis=1) # Natural freq in Hz
print(Frequencies)



