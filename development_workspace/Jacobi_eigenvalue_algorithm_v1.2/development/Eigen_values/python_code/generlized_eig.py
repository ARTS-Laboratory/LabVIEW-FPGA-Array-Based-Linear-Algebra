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




#%% Define the matrix

# load the M and M matrix from the function

M,K = MK.make_M_K()
A=K
B=M

test_1a = A==A.T
test_1b = B==B.T


# obtain the real (python calculated) answer for the eigenvalues and eigenvectors 
general_eigvals_python,eigvects = sp.linalg.eig(K,M)

#%% step 1, Solve the eigenvalue problem of B
eigvals_B,eigvects_B = sp.linalg.eig(B) #sp.linalg.eig(B)
eigvals_A,eigvects_A = sp.linalg.eig(A) #sp.linalg.eig(B)

# create the diagonal eigenvalue matrix Lambda_B
Lambda_B = np.real(np.identity(B.shape[0])*eigvals_B)

#test 3, answer should be all true
test_3 = eigvects_B==sp.linalg.inv(eigvects_B.T)
test_3a = np.matmul(eigvects_B,eigvects_B.T)
test_3b = np.matmul(sp.linalg.inv(eigvects_B),B,eigvects_B)



#%% step 2 Multiplying both sides of the second equation above by  $\Lambda^{-1/2}$

Lambda_B_neg_half = sp.linalg.inv(Lambda_B**(1/2))

eigvects_B_prime = np.matmul(eigvects_B,Lambda_B_neg_half)    



#%% step 3 Apply the same transform to ${\bf A}$


A_prime = np.matmul(eigvects_B_prime.T,A,eigvects_B_prime)

#%% step 4 Diagonalize ${\bf A}'$

Lambda = np.matmul(eigvects_A.T,A_prime,eigvects_A)

general_eigvals = np.sort(np.diag(Lambda))



#eigvals=np.expand_dims(np.real(eigvals), axis=0)
FEA_wn_python = np.sort(np.real(np.squeeze(np.sqrt(general_eigvals_python)))) # Natural frequencies, rad/s
Frequencies_python = np.expand_dims(FEA_wn_python/(2*np.pi),axis=1) # Natural freq in Hz
print(Frequencies_python)









