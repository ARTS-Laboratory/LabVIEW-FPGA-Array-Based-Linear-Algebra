#! /usr/bin/env python
#
def r8mat_identity ( n ):

#*****************************************************************************80
#
## R8MAT_IDENTITY sets up an NxN identity matrix.
#
#  Licensing:
#
#    This code is distributed under the GNU LGPL license.
#
#  Modified:
#
#    16 January 2016
#
#  Author:
#
#    John Burkardt
#
#  Parameters:
#
#    Input, integer N, the number of rows and columns.
#
#    Output, real A(N,N), the matrix.
#
  import numpy as np

  a = np.zeros ( ( n, n ), dtype = np.float64 )

  for i in range ( 0, n ):
    a[i,i] = 1.0

  return a

def r8mat_identity_test ( ):

#*****************************************************************************80
#
## R8MAT_IDENTITY_TEST tests R8MAT_IDENTITY.
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
  import platform
  from r8mat_print import r8mat_print

  print ( '' )
  print ( 'R8MAT_IDENTITY_TEST' )
  print ( '  Python version: %s' % ( platform.python_version ( ) ) )
  print ( '  R8MAT_IDENTITY creates an identity matrix.' )

  m = 5
  n = m
  a = r8mat_identity ( n )
  r8mat_print ( m, n, a, '  The identity matrix:' )
#
#  Terminate.
#
  print ( '' )
  print ( 'R8MAT_IDENTITY_TEST' )
  print ( '  Normal end of execution.' )
  return

if ( __name__ == '__main__' ):
  from timestamp import timestamp
  timestamp ( )
  r8mat_identity_test ( )
  timestamp ( )

