# LabVIEW code for matrix inversion
## Matrix Inverse v1.1
1. An implementation of the matrix inversion code using 1D arrays
1. The sum of error zero needs to be moved out 2 loops. 

## Matrix Inverse v1.2
1. Added a 2n wire to clean it up a bit. 
1. Added a for loop to test what the largest error I could get was. On a 3x3 matrix, I got 67% error after less than a minute of running. The FPGA computed inverse was bad, this has to do with the random numbers seeded in I think, and how SGL precision floating point deals with this. 
1. I let it run for a few minutes and and I never got a 163.27% error with the A matrix. 

| -0.118752 | 0.147569   | 0.172393 |
| 0.322827  | -0.401167  | 0.499674 |
| -0.338922 | -0.0698271 | 0.49506  |

While the inverse matrix did not look awful, the error was high. Python gave me a sum of the error 9.42758615894338e-10, this was 5 orders of magnitude larger than normal so I think it is just a numerical issue. 


## Matrix Inverse v1.3
1. Just a cleaned up version of 1.2 without the loop for error checking

## Matrix Inverse v1.4
1. Calls the sub VI "Matrix Inverse"
1. This has the detect divide by zero function, I don't think it needs it. With floating point (and FXP) the chances of this are small, and it may add a lot of complexity to the code. 
























