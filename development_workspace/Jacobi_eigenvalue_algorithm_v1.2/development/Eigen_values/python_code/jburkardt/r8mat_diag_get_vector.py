#! /usr/bin/env python
#
def r8mat_diag_get_vector ( n, a ):

#*****************************************************************************80
#
## R8MAT_DIAG_GET_VECTOR returns the diagonal of an R8MAT in a vector.
#
#  Discussion:
#
#    An R8MAT is an MxN array of R8's, stored by (I,J) -> [I+J*M].
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
#    Input, integer N, the number of rows and columns of
#    the matrix.
#
#    Input, real A(N,N), the N by N matrix.
#
#    Output, real V(N), the diagonal entries
#    of the matrix.
#
  import numpy as np

  v = np.zeros ( n )

  for i in range ( 0, n ):
    v[i] = a[i,i]
 
  return v

def r8mat_diag_get_vector_test ( ):

#*****************************************************************************80
#
## R8MAT_DIAG_GET_VECTOR_TEST tests R8MAT_DIAG_GET_VECTOR.
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
  from r8mat_uniform_01 import r8mat_uniform_01
  from r8vec_print import r8vec_print

  m = 5
  n = m
  seed = 123456789

  print ( '' )
  print ( 'R8MAT_DIAG_GET_VECTOR_TEST' )
  print ( '  Python version: %s' % ( platform.python_version ( ) ) )
  print ( '  R8MAT_DIAG_GET_VECTOR retrieves the diagonal from an R8MAT.' )

  a, seed = r8mat_uniform_01 ( m, n, seed )

  r8mat_print ( m, n, a, '  Random R8MAT:' )

  v = r8mat_diag_get_vector ( n, a )
  r8vec_print ( n, v, '  Diagonal vector:' )
#
#  Terminate.
#
  print ( '' )
  print ( 'R8MAT_DIAG_GET_VECTOR_TEST:' )
  print ( '  Normal end of execution.' )
  return

if ( __name__ == '__main__' ):
  from timestamp import timestamp
  timestamp ( )
  r8mat_diag_get_vector_test ( )
  timestamp ( )

