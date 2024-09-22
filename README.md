# FRP_Models Open Repository 
Using this repository, you can generate the first-order regular perturbation on gamma (FRP) approximate solution to the Manakov equation considering the following *scenarios*:
1. Numerically computed or integral kernels
2. Geometrically constrained integral kernels
3. Optimized kernels using Normalized Batch Gradient Descent (NBGD)

## Quick start
- Download or clone the PhD_miscellaneous_repo 
- Run "Setup_Repo.m"
- The repository is now ready to start simulating either of the three FRP scenarios enlisted above

## Summary 
The repository contains the following folders:
- **1_HelperFunctions:** containing basic functions
- **2_Kernels:** containing the FRP kernels of the scenarios enlisted above
- **3_Examples:** containing the scripts to generate the FRP scenarios 


The FRP model is generated using the following input/output expression

![FRP_equation](https://github.com/user-attachments/assets/ef7f5c0f-0919-4145-a951-ecb8a78f5190)

The coefficients multiplying the input symbols in the argument of the triple sum are the so-called _kernels_ or nonlinear coefficients. In this repository, you can evaluate the FRP model considering three sets of kernels: (1) numerically computed using their integral form, (2) geometrically constrained using the scheme presented in [3], and (3) NBGD optimized using the scheme in [2]. **Disclaimer:** Kernels depend on the transmission parameters used for your optical transmission. Thus, be aware that the cases generated using this repository are valid for the transmission parameters specified in section _transmission parameters_.  

### Numerically computed (integral kernels)
This is the conventional approach to compute the FRP kernels numerically. The integral form is reported in multiple references, but you can check, for example, Eq. (4) in reference [1]. To perform the numerical integration, we used Riemman sums, but you could also use Gaussian quadrature for a more elegant approach. **Disclaimer:** In principle, the FRP model requires an infinite number of kernels to be computed (see the model expression above). Nevertheless, the FRP model is typically evaluated for a finite set of kernels defined by a parameter known as the memory length of the model -> $M$. The available memory sizes in this repository are $M = [0,30]$. By changing this parameter, you can modify the accuracy of your FRP model.  

### Geometrically constrained
In [2], we propose a methodology to constrain the set of kernels based on their geometrical properties. This approach allows you to reduce the number of kernels of the subset defined by the memory size. This approach has two extra parameters to determine the kernel set: the number of principal planes $i$ and the size of the hyperbolic star $\hat M$. The available cases for these parameters are $i=[0,5]$ with $\hat M = [3,6,9,12,15,18,21,24,27,30,45,60,70,90,105,120,135,150,165,180,195,210,225]$.

### NBGD-optimized kernels 
In [3], we introduced a data-driven approach to determining the FRP kernels. An NBGD optimizer can optimize the kernels using simulated or experimental data. This approach is relatively simple and allows you to reduce the size of the kernels set while increasing the model's accuracy. Similar to the case of the numerically computed kernel, the set of kernels is defined by the memory size. Which, in this case, specifies the size of the set fed to the NBGD optimizer. There is only one available memory size for this case, $M=9$, which was found in [3] to be the best trade-off between complexity and accuracy. The numerically computed kernels are power-independent, meaning you can use the abovementioned cases for any power you wish. This, nevertheless, is not the case for the  NBGD-optimized kernels since the data feeding the optimizer is for a fixed power. These are powers available for you to test $P=[0,20]$.

## Transmission parameters
As explained in [2] and [3], we consider a single-channel, single-span fiber-optic transmission system using a polarisation-multiplexed signal. Check Fig. 1 in either of these two papers. To numerically compute the kernels and generate the simulated data to optimize them, the following transmission parameters were considered: 

|Parameter|Value|
|---------|-----|
|Nonlinear parameter $\gamma$|$1.2 \textrm{W}^{-1} \textrm{km}^{-1}$|
|Fiber attenuation $\alpha$ |$0.2 \textrm{dB/km}$|
|Group velocity dispersion $\beta_2$|$-21.7  \textrm{ps}^{2}/\textrm{km}$|
|Fiber length $L$|$120$ km|
|Symbol rate $R_s$|$60$ Gbaud|
| Pulse shape $h(t)$|Root-raised-cosine (RRC)|
|RRC roll-off factor |0.01|

## Parameters script 
Each example in the repository includes a parameter script that you can use to evaluate the available cases. Beware that only the cases summarized above are accessible for simulation.

**Disclaimer:** The parameter _P.Model.Nsam_ must be chosen carefully, or your compilation will crash because you run out of memory. Beware that the expression of the FRP model requires the computation of many triplets, which must be done for every symbol in your transmitted sequence. In its implementation, we generated all the triplets simultaneously!! Which generates an array of triplets of size $N_{\text{sam}}\times(2M+1)^3$, with $N_{\text{sam}}$ being the number of symbols in the transmitted sequence. 

## Compilation Output 
Once the FRP model is generated for an example, you will get a proof that looks like this:

![image](https://github.com/user-attachments/assets/5bc55ee9-ec0d-42f2-b56b-121d71844c9c)

The figure shows the transmitted symbols in red and the output generated with the FRP model in blue. 

# References 
- [1] R. Dar, M. Feder, A. Mecozzi and M. Shtaif, "Inter-Channel Nonlinear Interference Noise in WDM Systems: Modeling and Mitigation," in Journal of Lightwave Technology, vol. 33, no. 5, pp. 1044-1053, 1 March 1, 2015, doi: 10.1109/JLT.2014.2384998. [[https://ieeexplore.ieee.org/document/6994804]]
- [2] A. Barreiro, G. Liga and A. Alvarado, "Data-Driven Enhancement of the Time-Domain First-Order Regular Perturbation Model," in Journal of Lightwave Technology, vol. 41, no. 9, pp. 2691-2706, 1 May 1, 2023, doi: 10.1109/JLT.2023.3237041[[https://ieeexplore.ieee.org/document/10017349]]. 
- [3] A. Barreiro, G. Liga and A. Alvarado, "Geometrical Pruning of the First Order Regular Perturbation Kernels of the Manakov Equation," in Journal of Lightwave Technology, doi: 10.1109/JLT.2024.3454297 [[https://ieeexplore.ieee.org/document/10664054]]. 
