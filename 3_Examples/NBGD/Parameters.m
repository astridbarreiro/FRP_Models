%% Parameters Script for NBGD validatin with SSFM pre-saved data 
% Used by GenerateFRP.m 

%% Fiber                                      %Physical properties of the fiber
P.Fibre.gamma = 1.2;                          %Nonlinear parameter  [W/km]

%% System                                           %System-transmition parameters
P.Sys.Pch      = 7;                       
P.Sys.Rs       = 60e9;
P.Sys.Npol     = 2;
P.Sys.Nch      = 1;
P.Sys.Nspans   = 1;
P.Sys.Noise    = 'Off';    
P.Sys.M        = '16QAM';  
P.Sys.CLength  = 16;
P.Sys.L        = 120;                  

%% Kernels model parameters
P.Model.MemLength           = 5;                    % Memory test
P.Model.MemLengthTwoSided   = 2*P.Model.MemLength +1;
P.Model.MemLengthFileToLoad = P.Model.MemLength;    
P.Model.gamma               = P.Fibre.gamma*1e-3;   % nonlinear coeficient
P.Model.Rs                  = P.Sys.Rs*1e-9;        % Symbol rate
P.Model.Nsam                = 2^14;                 % Number of samples 
P.Model.Gp                  = (1/2)*1e-3*10^(P.Sys.Pch/10)/(P.Sys.Rs);

%% Load kernels 
FileName = strcat('Integral_Kernels_'...
    ,num2str(P.Sys.Nch),'CH_',num2str(P.Sys.Nspans),'S_',...
    num2str(P.Sys.L),'km_',num2str(P.Model.Rs ),'GBd_N',...
    num2str(P.Model.MemLength),'.mat');
ModelKernels = load(FileName);
SPM_Kernels  = Cub2Vec(ModelKernels.SPM_Kernels,P.Model.MemLength);
