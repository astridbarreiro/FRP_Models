%% Parameters Script to generate FRP model 
% Used by GenerateFRP.m 

%% Fiber (Physical properties of the fiber)
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

%% FRP  model parameters                           
P.Model.MemLength           = 5;                    % Memory test 
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