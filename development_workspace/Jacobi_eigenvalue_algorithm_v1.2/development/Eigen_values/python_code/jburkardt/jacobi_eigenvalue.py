#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun 12 13:26:56 2019

@author: austin
"""

#! /usr/bin/env python
#
def jacobi_eigenvalue ( n, a, it_max ):

#*****************************************************************************80
#
## JACOBI_EIGENVALUE carries out the Jacobi eigenvalue iteration.
#
#  Discussion:
#
#    This function computes the eigenvalues and eigenvectors of a
#    real symmetric matrix, using Rutishauser's modfications of the classical
#    Jacobi rotation method with threshold pivoting. 
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
#  Parameters:
#
#    Input, integer N, the order of the matrix.
#
#    Input, real A(N,N), the matrix, which must be square, real,
#    and symmetric.
#
#    Input, integer IT_MAX, the maximum number of iterations.
#
#    Output, real V(N,N), the matrix of eigenvectors.
#
#    Output, real D(N), the eigenvalues, in descending order.
#
#    Output, integer IT_NUM, the total number of iterations.
#
#    Output, integer ROT_NUM, the total number of rotations.
#
  import numpy as np

  v = np.zeros ( [ n, n ] )
  d = np.zeros ( n )
  
  for j in range ( 0, n ):
    for i in range ( 0, n ):
      v[i,j] = 0.0
    v[j,j] = 1.0

  for i in range ( 0, n ):
    d[i] = a[i,i]

  bw = np.zeros ( n )
  zw = np.zeros ( n )
  w = np.zeros ( n )

  for i in range ( 0, n ):
    bw[i] = d[i]

  it_num = 0
  rot_num = 0

  while ( it_num < it_max ):

    it_num = it_num + 1
#
#  The convergence threshold is based on the size of the elements in
#  the strict upper triangle of the matrix.
#
    thresh = 0.0
    for j in range ( 0, n ):
      for i in range ( 0, j ):
        thresh = thresh + a[i,j] ** 2

    thresh = np.sqrt ( thresh ) / float ( 4 * n )

    #if ( thresh == 0.0 ):
      #break

    for p in range ( 0, n ):
      for q in range ( p + 1, n ):

        gapq = 10.0 * abs ( a[p,q] )
        termp = gapq + abs ( d[p] )
        termq = gapq + abs ( d[q] )
#
#  Annihilate tiny offdiagonal elements.
#
        if ( 4 < it_num and termp == abs ( d[p] ) and termq == abs ( d[q] ) ):

          a[p,q] = 0.0
#
#  Otherwise, apply a rotation.
#
        elif ( thresh <= abs ( a[p,q] ) ):

          h = d[q] - d[p]
          term = abs ( h ) + gapq

          if ( term == abs ( h ) ):
            t = a[p,q] / h
          else:
            theta = 0.5 * h / a[p,q]
            t = 1.0 / ( abs ( theta ) + np.sqrt ( 1.0 + theta * theta ) )
            if ( theta < 0.0 ):
              t = - t

          c = 1.0 / np.sqrt ( 1.0 + t * t )
          s = t * c
          tau = s / ( 1.0 + c )
          h = t * a[p,q]
#
#  Accumulate corrections to diagonal elements.
#
          zw[p] = zw[p] - h                  
          zw[q] = zw[q] + h
          d[p] = d[p] - h
          d[q] = d[q] + h

          a[p,q] = 0.0
#
#  Rotate, using information from the upper triangle of A only.
#
          for j in range ( 0, p ):
            g = a[j,p]
            h = a[j,q]
            a[j,p] = g - s * ( h + g * tau )
            a[j,q] = h + s * ( g - h * tau )

          for j in range ( p + 1, q ):
            g = a[p,j]
            h = a[j,q]
            a[p,j] = g - s * ( h + g * tau )
            a[j,q] = h + s * ( g - h * tau )

          for j in range ( q + 1, n ):
            g = a[p,j]
            h = a[q,j]
            a[p,j] = g - s * ( h + g * tau )
            a[q,j] = h + s * ( g - h * tau )
#
#  Accumulate information in the eigenvector matrix.
#
          for j in range ( 0, n ):
            g = v[j,p]
            h = v[j,q]
            v[j,p] = g - s * ( h + g * tau )
            v[j,q] = h + s * ( g - h * tau )

          rot_num = rot_num + 1

    for i in range ( 0, n ):
      bw[i] = bw[i] + zw[i]
      d[i] = bw[i]
      zw[i] = 0.0
#
#  Restore upper triangle of input matrix.
#
  for j in range ( 0, n ):
    for i in range ( 0, j ):
      a[i,j] = a[j,i]
#
#  Ascending sort the eigenvalues and eigenvectors.
#
  for k in range ( 0, n - 1 ):

    m = k
    for l in range ( k + 1, n ):
      if ( d[l] < d[m] ):
        m = l

    if ( k != m ):

      t    = d[m]
      d[m] = d[k]
      d[k] = t

      for i in range ( 0, n ):
        w[i]   = v[i,m]
        v[i,m] = v[i,k]
        v[i,k] = w[i]

  return v, d, it_num, rot_num,thresh

def jacobi_eigenvalue_test01 ( ):

#*****************************************************************************80
#
## JACOBI_EIGENVALUE_TEST01 uses a 4x4 test matrix.
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
  import numpy as np
  import platform
  from r8mat_is_eigen_right import r8mat_is_eigen_right
  from r8mat_print import r8mat_print
  from r8vec_print import r8vec_print

  n = 4

  a = np.array ( [ \
    [   4.0,  -30.0,    60.0,   -35.0, ], \
    [ -30.0,  300.0,  -675.0,   420.0, ], \
    [  60.0, -675.0,  1620.0, -1050.0, ], \
    [ -35.0,  420.0, -1050.0,   700.0  ] ] )

  print ( '' )
  print ( 'JACOBI_EIGENVALUE_TEST01' )
  print ( '  Python version: %s' % ( platform.python_version ( ) ) )
  print ( '  JACOBI_EIGENVALUE computes the eigenvalues D' )
  print ( '  and eigenvectors V of a symmetric matrix A so that A * V = D * V.' )

  r8mat_print ( n, n, a, '  Input matrix A:' )

  it_max = 100

  v, d, it_num, rot_num = jacobi_eigenvalue ( n, a, it_max )

  print ( '' )
  print ( '  Number of iterations = %d' % ( it_num ) )
  print ( '  Number of rotations  = %d' % ( rot_num ) )

  r8vec_print ( n, d, '  Eigenvalues D:' )

  r8mat_print ( n, n, v, '  Eigenvector matrix V:' )
#
#  Compute eigentest.
#
  error_frobenius = r8mat_is_eigen_right ( n, n, a, v, d )
  print ( '' )
  print ( '  Frobenius norm error in eigensystem A*V-D*V = %g' % ( error_frobenius ) )
#
#  Terminate.
#
  print ( '' )
  print ( 'JACOBI_EIGENVALUE_TEST01' )
  print ( '  Normal end of execution.' )
  return

def jacobi_eigenvalue_test02 ( ):

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
  import numpy as np
  import platform
  from r8mat_is_eigen_right import r8mat_is_eigen_right
  from r8mat_print import r8mat_print
  from r8vec_print import r8vec_print

  n = 4

  a = np.array ( [ \
    [ 4.0, 0.0, 0.0, 0.0 ], \
    [ 0.0, 1.0, 0.0, 0.0 ], \
    [ 0.0, 0.0, 3.0, 0.0 ], \
    [ 0.0, 0.0, 0.0, 2.0 ] ] )

  print ( '' )
  print ( 'JACOBI_EIGENVALUE_TEST02' )
  print ( '  Python version: %s' % ( platform.python_version ( ) ) )
  print ( '  JACOBI_EIGENVALUE computes the eigenvalues D' )
  print ( '  and eigenvectors V of a symmetric matrix so that A * V = D * V.' )
  print ( '' )
  print ( '  As a sanity check, input a diagonal matrix.' )

  r8mat_print ( n, n, a, '  Input matrix A:' )

  it_max = 100

  [ v, d, it_num, rot_num ] = jacobi_eigenvalue ( n, a, it_max );

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
  return

def jacobi_eigenvalue_test03 ( ):

#*****************************************************************************80
#
## JACOBI_EIGENVALUE_TEST03 uses a 5x5 test matrix.
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
  import numpy as np
  import platform
  from r8mat_is_eigen_right import r8mat_is_eigen_right
  from r8mat_print import r8mat_print
  from r8vec_print import r8vec_print

  n = 5

  print ( '' )
  print ( 'JACOBI_EIGENVALUE_TEST03' )
  print ( '  Python version: %s' % ( platform.python_version ( ) ) )
  print ( '  JACOBI_EIGENVALUE computes the eigenvalues D' )
  print ( '  and eigenvectors V of a symmetric matrix so that A * V = D * V.' )
  print ( '' )
  print ( '  Use the discretized second derivative matrix.' )

  a = np.zeros ( [ n, n ] )

  for j in range ( 0, n ):
    for i in range ( 0, n ):
      if ( i == j ):
        a[i,j] = -2.0
      elif ( i == j + 1 or i == j - 1 ):
        a[i,j] = 1.0

  r8mat_print ( n, n, a, '  Input matrix A:' )

  it_max = 100

  [ v, d, it_num, rot_num ] = jacobi_eigenvalue ( n, a, it_max );

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
  print ( 'JACOBI_EIGENVALUE_TEST03' )
  print ( '  Normal end of execution.' )
  return

if ( __name__ == '__main__' ):
  from timestamp import timestamp
  timestamp ( )
  jacobi_eigenvalue_test01 ( )
  jacobi_eigenvalue_test02 ( )
  jacobi_eigenvalue_test03 ( )
  timestamp ( )
