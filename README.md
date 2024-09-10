# PhD_miscellaneous_repo
This repository generates the first order regular perturbation on gamma (FRP) approximate solution to the Manakov equation considering the following *scenarios*:
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
The FRP model is generated using the following expression 
$$
r_0 = a_0 + \frac{8}{9}\jmath \gamma G_p \sum_{k=-\infty}^\infty\sum_{l=-\infty}^\infty\sum_{m=-\infty}^\infty \boldsymbol{a}^\dagger_k\boldsymbol{a}_l \boldsymbol{a}_m S_{klm}
$$
where  
### Numerically computed (integral kernels)

### Geometrically constrained

### NBGD optimized kernels 


