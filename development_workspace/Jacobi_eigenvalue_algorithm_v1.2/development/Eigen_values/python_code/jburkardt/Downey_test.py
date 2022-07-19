#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun 12 13:38:55 2019

@author: austin
"""

#*****************************************************************************80
#
## JACOBI_EIGENVALUE_TEST02 uses a 4x4 test matrix.
#
#  Licensing:
#
#    This code is distributed under the GNU LGPL license. 
#
#  Modified:
#
#    25 September 2015
#
#  Author:
#
#    John Burkardt
#

import IPython as IP
IP.get_ipython().magic('reset -sf')
import scipy as sp
import numpy as np
import platform
from r8mat_is_eigen_right import r8mat_is_eigen_right
from r8mat_print import r8mat_print
from r8vec_print import r8vec_print
from jacobi_eigenvalue import jacobi_eigenvalue
import make_M_K as MK



M,K = MK.make_M_K()

a = np.array ( [ \
[ 4.0, 0.0, 0.0, 0.0 ], \
[ 0.0, 1.0, 0.0, 0.0 ], \
[ 0.0, 0.0, 3.0, 0.0 ], \
[ 0.0, 0.0, 0.0, 2.0 ] ] )

M_inv = sp.linalg.inv(M)
M_inv_K = np.matmul(M_inv,K)
eigvals_BA,eigvects_BA = sp.linalg.eig(M_inv_K)

a = np.copy(M_inv_K)
n = a.shape[0] # the number of row and columns in the matrix (A)
d_python,crap = sp.linalg.eig(a)


print ( '' )
print ( 'JACOBI_EIGENVALUE_TEST02' )
print ( '  Python version: %s' % ( platform.python_version ( ) ) )
print ( '  JACOBI_EIGENVALUE computes the eigenvalues D' )
print ( '  and eigenvectors V of a symmetric matrix so that A * V = D * V.' )
print ( '' )
print ( '  As a sanity check, input a diagonal matrix.' )

r8mat_print ( n, n, a, '  Input matrix A:' )

it_max = 10000 # integer IT_MAX, the maximum number of iterations.

[ v, d, it_num, rot_num ,thresh] = jacobi_eigenvalue ( n, a, it_max );

print ( '' )
print ( '  Number of iterations = %d' % ( it_num ) )
print ( '  Number of rotations  = %d' % ( rot_num ) )

r8vec_print ( n, d, '  Eigenvalues D:' )

r8mat_print ( n, n, v, '  Eigenvector matrix V:' )
#
#  Compute eigentest.
#
error_frobenius = r8mat_is_eigen_right ( n, n, a, v, d );
print ( '' )
print ( '  Frobenius norm error in eigensystem A*V-D*V = %g' % ( error_frobenius ) )
#
#  Terminate.
#
print ( '' )
print ( 'JACOBI_EIGENVALUE_TEST02' )
print ( '  Normal end of execution.' )


#d_python,crap = sp.linalg.eig(a)
eigvals_BA,eigvects_BA = sp.linalg.eig(M_inv_K)
#d_python = np.real(np.sort(d_python))
print(d)
print(np.sort(d_python))



##eigvals=np.expand_dims(np.real(eigvals), axis=0)
#FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(d)))) # Natural frequencies, rad/s
#Frequencies = np.expand_dims(FEA_wn/(2*np.pi),axis=1) # Natural freq in Hz
#print(Frequencies)
#
#eigvals_Jacobi = np.copy(d)
##eigvals=np.expand_dims(np.real(eigvals), axis=0)
#FEA_wn = np.sort(np.real(np.squeeze(np.sqrt(d_python)))) # Natural frequencies, rad/s
#Frequencies = np.expand_dims(FEA_wn/(2*np.pi),axis=1) # Natural freq in Hz
#print(Frequencies)















