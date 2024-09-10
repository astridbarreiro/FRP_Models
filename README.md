# PhD_miscellaneous_repo
This repository generates the first-order regular perturbation on gamma (FRP) approximate solution to the Manakov equation considering the following *scenarios*:
1. Numerically computed or integral kernels
2. Geometrically constrained integral kernels
3. Optimized kernels using Normalized Batch Gradient Descent (NBGD)

## Quick start
- Download or clone the PhD_miscellaneous_repo 
- Run "Setup_Repo.m"
- The repository is now ready to start simulating either of the three FRP scenarios enlisted above

## Summary 
The repository contains the following folders:
- **1_HelperFunctions:** containing with basic functions
- **2_Kernels:** containing the FRP kernels of the scenarios enlisted above
- **3_Examples:** containing the scripts to generate the FRP scenarios 
The FRP model is generated using the following input/output expression

![FRP_equation](https://github.com/user-attachments/assets/ef7f5c0f-0919-4145-a951-ecb8a78f5190)

The coefficients multiplying the symbols in the triple sum are the so-called kernels or nonlinear coefficients. This repository evaluates the FRP model considering three sets of kernels: (1) numerically computed using their integral form, (2) geometrically constrained using the scheme presented in, and (3) NBGD optimized using the scheme in 

### Numerically computed (integral kernels)

### Geometrically constrained

### NBGD-optimized kernels 


