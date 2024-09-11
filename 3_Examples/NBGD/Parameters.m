%% Parameters Script for NBGD validatin with SSFM pre-saved data 
% Used by GenerateFRP_NBGDoptimized.m 
% Disclaimer: the only adjustable parameter in this example is P.Sys.Pch 

%% Fiber                                      %Physical properties of the fiber
P.Fibre.gamma = 1.2;                         %Nonlinear parameter  [W/km]

%% System-transmition parameters
P.Sys.Pch      = 7;                          % Launch power
P.Sys.Rs       = 60e9;                       % Symbol rate
P.Sys.Npol     = 2;                          % Number of polariztions
P.Sys.Nch      = 1;                          % Number of channels
P.Sys.Nspans   = 1;                          % Number of spans
P.Sys.Noise    = 'Off';                      % ASE Noise off  
P.Sys.M        = '16QAM';                    % Modulation format
P.Sys.CLength  = 16;                         % Set cardinatily
P.Sys.L        = 120;                        % Link length   

%% Kernels model parameters
P.Model.gamma               = P.Fibre.gamma*1e-3;   % nonlinear coeficient
P.Model.Rs                  = P.Sys.Rs*1e-9;        % Symbol rate
P.Model.Nsam                = 2^13;                 % Number of samples 
P.Model.Gp                  = (1/2)*1e-3*10^(P.Sys.Pch/10)/(P.Sys.Rs);

%% Load kernels 
FileName = strcat('5Batch_NBGD_NFOff_'...
    ,num2str(P.Sys.Nch),'CH-',num2str(P.Sys.Nspans),'S_', ...
    num2str(P.Sys.M),'_',num2str(P.Sys.L),'km_',num2str(P.Model.Rs ),'GBd_',...
    num2str(P.Sys.Pch),'dBm_Kernels_N9.mat');
ModelKernels = load(FileName);
SPM_Kernels  = ModelKernels.SPM_Kernels;