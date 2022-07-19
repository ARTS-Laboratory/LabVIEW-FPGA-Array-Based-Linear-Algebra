# -*- coding: utf-8 -*-
"""

Cholesky decomposition code that computes ALL^T for all real matrixes 
both with and without a square root. These are done using 1D arrays to allow
them to be implemented on FPGAs.

references:
https://www.netlib.org/lapack/lug/node54.html
https://www.stat.uchicago.edu/~lekheng/courses/302/notes8.pdf
http://euler.nmt.edu/~brian/ldlt.html
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

plt.close('all')
cc = plt.rcParams['axes.prop_cycle'].by_key()['color'] 


#%% Load the M and K matrix

with open('data/data_19_nodes.txt') as json_file:  
    D = json.load(json_file)

M = np.asarray(D['M'])
K = np.asarray(D['K'])

# for reference, calculate the cholesky decomposition using python
L_python = np.linalg.cholesky(M)   

#%% Cholesky decomposition with square root
    
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

# check the solutions against the python solution 
check = L==np.reshape(L_python,n*n)
diff = np.abs(np.reshape(L_python,n*n)-L)


#%% Cholesky decomposition without square root using 2D arrays 

# Austin Downey gave up on this code as it requires the solving of eigen values to get 
# back to the lower Choleskey that is needed.


#A = np.copy(M)
##A = np.array([[0.80086,	0.31247,	0.75112,	0.67789,	0.63088],[0.31247,	0.288,	0.43034,	0.38047,	0.10465],[0.75112,	0.43034,	1.4746,	0.896,	0.55019],[0.67789,	0.38047,	0.896,	0.7847,	0.50332],[0.63088,	0.10465,	0.55019,	0.50332,	0.97125]])
#
##  Figure out the size of A.
#
#n=A.shape[0]
#
## The main loop.  See Golub and Van Loan for details.  
#
#L=np.zeros((n,n))
#v = np.zeros(n)
#d = np.zeros(n)
#
#
#for j in range(n):
#  if j > 0:
#    v[0:j]=L[j,0:j]*d[0:j]
#    v[j]=A[j,j]-np.matmul(L[j,0:j],v[0:j].T)
#    d[j]=v[j]
#    if j < n:
#      L[j+1:n,j]=(A[j+1:n,j]-np.matmul(L[j+1:n,0:j],v[0:j].T))/v[j]
#  else:
#    v[0]=A[0,0]
#    d[0]=v[0]
#    L[1:n,0]=A[1:n,0]/v[0]   
#
#D=np.diag(d)
#L=L+np.eye(n)
##L = np.matmul(L,D**(1/2))
#L_python = np.linalg.cholesky(A)   
#
## check the solutions against the python solution 
#check = L==L_python
#diff = np.abs(L_python-L)
#
#
#F = np.matmul(L,D**(1/2))
#DL_T = np.matmul(D,np.linalg.inv(L.T))
#combined_MK_L = np.matmul(np.matmul(np.linalg.inv(L),K),np.linalg.inv(L.T))
#combined_MK_DL = np.matmul(np.matmul(np.linalg.inv(L),K),DL_T)
#combined_MK_F = np.matmul(np.matmul(np.linalg.inv(F),K),np.linalg.inv(F.T))
#combined_MK_python = np.matmul(np.matmul(np.linalg.inv(L_python),K),np.linalg.inv(L_python.T))







































