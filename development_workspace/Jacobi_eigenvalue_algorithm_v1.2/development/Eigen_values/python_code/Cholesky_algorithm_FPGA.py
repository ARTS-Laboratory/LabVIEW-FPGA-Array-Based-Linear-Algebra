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

## Cholesky factorization
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
                 

L_python = np.linalg.cholesky(M)

print(L_python ==L)
# Cholesky factorization




#L = np.zeros(M.shape)
#for i in range(M.shape[0]):
#    for j in range(i+1):


#L = np.zeros(M.shape)
#
#
#
#i=1
#for j in range(i+1):
#    s=0
#    for k in range(j):
#        s = (L[i][k] * L[j][k])+s
#    if (i == j):
#        L[i][j] = np.sqrt(M[i][i] - s)
#    else:
#        L[i][j] = (1.0 / L[j][j] * (M[i][j] - s))
print(L)
