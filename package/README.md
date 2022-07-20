# Package

## v0.0.0
1. I followed the directions here https://support.vipm.io/hc/en-us/articles/214135863
1. I changed the "Palette Location to "Functions (FPGA)>>Array-based Linear Algebra"

## v0.1.0
1. Added Cholesky Decomposition and Transpose functions
1. A single precision floating point implementation

## v0.2.0
1. Added matrix inverse
1. Added custom icons
1. A single-precision floating-point implementation

## v0.3.0
1. Added eigenvalues
1. A single-precision floating-point implementation

## Items to look at for the next version
1. Polymorphic VIs
1. Malleable VIs
1. Using block memory instead of LUTs
1. Can some code be optimized? We need a better understanding of resources. 
1. Build the "solve a system of linear equations" function. 

## v0.3.1
1. Matrix Multiply is polymorphic, the rest are still SGL. 
1. This is working, but next versions will need unique folder names for all the sub-VIs in the polymorphic VI. 

## v0.3.2
1. All functions are polymorphic except eigenvalues.
1. I chose not to make eigenvalues polymorphic, as its benefits are limited as all the math inside needs to be FLT point. If you use this function, you should just understand that you have to convert the input array to FLT. I think doing it inside the function is a little "dishonest".

## v0.3.3
1. Copied v0.3.2, but updated the numbering. It was v1.3.3.











