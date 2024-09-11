%% Parameters Script to generate gometrically FRP constrained 
% Used by GenerateFRP_Geometrically_Constrained.m 
% Available principal planes i = 0,1,2,3,4,5
% Available sizes for the hyperbolic star hatM =  3,6,9,12,15,18,21,24,27,30,45,60,70,90,
%                                105,120,135,150,165,180,195,210,225

% Default example is i=0 and hatM=15 (phase matching condition)

%% Fiber                                      % Physical properties of the fiber
P.Fibre.gamma = 1.2;                         % Nonlinear parameter  [W/km]

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
P.Model.i                   = 0;                    % Number of principal planes  
P.Model.hatM                = 15;                   % Hyperbolic star size    
P.Model.gamma               = P.Fibre.gamma*1e-3;   % nonlinear coeficient
P.Model.Rs                  = P.Sys.Rs*1e-9;        % Symbol rate
P.Model.Nsam                = 2^11;                 % Number of samples 
P.Model.Gp                  = (1/P.Sys.Npol)*1e-3*10^(P.Sys.Pch/10)/(P.Sys.Rs);

%% Load kernels 
FileName = strcat('MH',num2str(P.Model.i),'_M0',num2str(P.Model.hatM),'_'...
    ,'Kernels_',num2str(P.Sys.Nch),'CH_',num2str(P.Sys.Nspans),'S_',...
    num2str(P.Sys.L),'km_',num2str(P.Model.Rs),'GBd_N15.mat');
ModelKernels = load(FileName);
SPM_Kernels  = Cub2Vec(ModelKernels.SPM_Kernels,15);
