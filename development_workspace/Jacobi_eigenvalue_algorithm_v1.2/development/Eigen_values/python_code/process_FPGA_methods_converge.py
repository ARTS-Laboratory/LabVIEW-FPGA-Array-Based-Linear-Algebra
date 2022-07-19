# -*- coding: utf-8 -*-
"""
Austin Downey - Oct 1, 2021:
I think this is the Jacobi eigenvalue algorithm, not to be confused with the 
Jacobi method which is a iterative algorithm for determining the solutions of 
a strictly diagonally dominant system of linear equations.
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

# Cholesky factorization
L = np.linalg.cholesky(M)

# build the reduction matrix A'
A1 = np.matmul(K,sp.linalg.inv(L.T))
C = np.matmul(sp.linalg.inv(L),A1)

# some small errors exist in the matrix so its not perfectly symmetrical, this takes the average so it symmetric
C = (C+C.T)/2

# compute the eigne values using the function as a check
eigvals_LU,p = jacobi(np.copy(C))

F=[]

C_Jacobi = np.copy(C)
n = len(C_Jacobi)
maxRot = 2000  # Set limit on number of rotations, 5*(n**2) is a default number
p = identity(n)*1.0     # Initialize transformation matrix
for i in range(maxRot): # Jacobi rotation loop 

    n = len(C_Jacobi)
    aMax = 0.0
    for i in range(n-1):
        for j in range(i+1,n):
            if abs(C_Jacobi[i,j]) >= aMax:
                aMax = abs(C_Jacobi[i,j])
                k = i; l = j      
    
    aDiff = C_Jacobi[l,l] - C_Jacobi[k,k]
    if abs(C_Jacobi[k,l]) < abs(aDiff)*1.0e-36:
        t = C_Jacobi[k,l]/aDiff
    else:
        phi = aDiff/(2.0*C_Jacobi[k,l])
        t = 1.0/(abs(phi) + sqrt(phi**2 + 1.0))
        if phi < 0.0: t = -t
    c = 1.0/sqrt(t**2 + 1.0); s = t*c
    tau = s/(1.0 + c)
    temp = C_Jacobi[k,l]
    C_Jacobi[k,l] = 0.0
    C_Jacobi[k,k] = C_Jacobi[k,k] - t*temp
    C_Jacobi[l,l] = C_Jacobi[l,l] + t*temp
    for i in range(k):      # Case of i < k
        temp = C_Jacobi[i,k]
        C_Jacobi[i,k] = temp - s*(C_Jacobi[i,l] + tau*temp)
        C_Jacobi[i,l] = C_Jacobi[i,l] + s*(temp - tau*C_Jacobi[i,l])
    for i in range(k+1,l):  # Case of k < i < l
        temp = C_Jacobi[k,i]
        C_Jacobi[k,i] = temp - s*(C_Jacobi[i,l] + tau*C_Jacobi[k,i])
        C_Jacobi[i,l] = C_Jacobi[i,l] + s*(temp - tau*C_Jacobi[i,l])
    for i in range(l+1,n):  # Case of i > l
        temp = C_Jacobi[k,i]
        C_Jacobi[k,i] = temp - s*(C_Jacobi[l,i] + tau*temp)
        C_Jacobi[l,i] = C_Jacobi[l,i] + s*(temp - tau*C_Jacobi[l,i])
    for i in range(n):      # Update transformation matrix
        temp = p[i,k]
        p[i,k] = temp - s*(p[i,l] + tau*p[i,k])
        p[i,l] = p[i,l] + s*(temp - tau*p[i,l])
    
    #eigvals=np.expand_dims(np.real(eigvals), axis=0)
    FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(diagonal(C_Jacobi))))) # Natural frequencies, rad/s
    Frequencies = FEA_wn/(2*np.pi) # Natural freq in Hz
    F.append(Frequencies)


F = np.asarray(F)

general_eigvals_python,eigvects = sp.linalg.eig(K,M)
FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(general_eigvals_python)))) # Natural frequencies, rad/s
Frequencies_python = FEA_wn/(2*np.pi) # Natural freq in Hz

    
    
plt.figure()
for i in range(4):
    plt.subplot(4,1,i+1)
    plt.semilogy(F[:,i])
    plt.hlines(Frequencies_python[i],0,maxRot+10,'r',linestyle='--')
    plt.xlim([0,maxRot])
plt.tight_layout()


