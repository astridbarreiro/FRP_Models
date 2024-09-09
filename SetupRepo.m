% This script will recursively generate path variables for all folders inside 
% the functions, Kernels database, and other resources
% This way you always have access to all toolbox functions.
% Matlab uses a similar method for registering its toolboxes.

% Generate full functions folder path by getting full current script path,
% removing script name and adding folder name
scriptPath = mfilename('fullpath');
toolboxPath = scriptPath(1:end-length(mfilename));
kernelsPath = strcat(toolboxPath,'2_Kernels');
functionsPath = strcat(toolboxPath,'1_HelperFunctions');
% kernelsPath = strcat(toolboxPath,'--');
%Add path
addpath(genpath(functionsPath));
% addpath(genpath(dataPath));
addpath(genpath(kernelsPath));

fprintf('Done!\n');
