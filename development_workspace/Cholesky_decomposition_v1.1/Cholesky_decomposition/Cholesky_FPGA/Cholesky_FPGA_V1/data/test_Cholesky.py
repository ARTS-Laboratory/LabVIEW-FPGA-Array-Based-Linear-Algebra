# -*- coding: utf-8 -*-
"""
Created on Fri Jun 14 19:23:52 2019

@author: PXIe-8880
"""

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
import json as json

#from math import sqrt

plt.close('all')

cc = plt.rcParams['axes.prop_cycle'].by_key()['color'] 

#%% Cholesky decomposition

M,K = MK.make_M_K(beam_node_num = 11) # this gets a M and K matrix

data = {'M':np.ndarray.tolist(M),'K':np.ndarray.tolist(K)}


with open('data.txt', 'w') as outfile:  
    json.dump(data, outfile)

## Cholesky factorization
#L = np.zeros(M.shape)
#for i_row in range(M.shape[0]):
#    for j in range(i_row+1):
#        s=0
#        for k in range(j):
#            s = (L[i_row,k] * L[j,k])+s
#        if i_row == j:
#            L[i_row,j] = np.sqrt(M[i_row,i_row] - s)
#        else:
#            L[i_row,j] = (1.0 / L[j,j] * (M[i_row,j] - s))
#L_python = np.linalg.cholesky(M)       
#check = L==L_python
#diff = np.abs(L-L_python)


#Cholesky factorization
    
# i becomes how many rows are added to the index
# j is added on top of the rows
    
L_python = np.linalg.cholesky(M)    
    
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
 
check = L==np.reshape(L_python,n*n)
diff = np.abs(np.reshape(L_python,n*n)-L)

