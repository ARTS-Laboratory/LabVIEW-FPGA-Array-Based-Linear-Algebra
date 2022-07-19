#! /usr/bin/env python3
#
def jacobi_eigenvalue_test ( ):

#*****************************************************************************80
#
## JACOBI_EIGENVALUE_TEST tests the JACOBI_EIGENVALUE library.
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
  from jacobi_eigenvalue import jacobi_eigenvalue_test01
  from jacobi_eigenvalue import jacobi_eigenvalue_test02
  from jacobi_eigenvalue import jacobi_eigenvalue_test03

  print ( '' )
  print ( 'JACOBI_EIGENVALUE_TEST' )
  print ( '  Python version: %s' % ( platform.python_version ( ) ) )
  print ( '  Test the JACOBI_EIGENVALUE library.' )

  jacobi_eigenvalue_test01 ( )
  jacobi_eigenvalue_test02 ( )
  jacobi_eigenvalue_test03 ( )
#
#  Terminate.
#
  print ( '' )
  print ( 'JACOBI_EIGENVALUE_TEST:' )
  print ( '  Normal end of execution.' )
  return

if ( __name__ == '__main__' ):
  from timestamp import timestamp
  timestamp ( )
  jacobi_eigenvalue_test ( )
  timestamp ( )
