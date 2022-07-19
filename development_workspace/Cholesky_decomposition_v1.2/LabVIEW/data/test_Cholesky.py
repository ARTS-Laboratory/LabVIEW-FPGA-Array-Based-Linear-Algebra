# -*- coding: utf-8 -*-
"""
Austin Downey

Builds a Hermitian, positive-definite matrix (need to check this), saves it to 
a file and performs a Cholesky decomposition. 

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
import make_A_matrix as MA
import json as json

#from math import sqrt

plt.close('all')

cc = plt.rcParams['axes.prop_cycle'].by_key()['color'] 

#%% Build matrix and save to json file

# this gets a A, this is built on an old modal analysis code, so it muilds a 
# M matrix for cantilever beam, this is renamed A
#A = MA.make_A(beam_node_num = 5) 

matrixSize = 5 
B = np.random.rand(matrixSize, matrixSize)
A = np.dot(B, B.transpose())
print('random positive semi-define matrix for today is', A)


data = {'A':np.ndarray.tolist(A)}

with open('data.txt', 'w') as outfile:  
    json.dump(data, outfile)


#%% Cholesky factorization
    
L_python = np.linalg.cholesky(A)    
    
n= A.shape[0]

A = np.reshape(A,n*n)
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
            L[index_i_j] = np.sqrt(A[index_i_j] - s)
        else:
            L[index_i_j] = (1.0 / L[index_j_j] * (A[index_i_j] - s))
 
check = L==np.reshape(L_python,n*n)
diff = np.abs(np.reshape(L_python,n*n)-L)

