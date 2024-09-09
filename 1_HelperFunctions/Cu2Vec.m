function AVector=Cub2Vec(ACube,M)
% Reshapes kernels 3D array from the cube to a vector
% Input: 
%   A cube: Kernels or triplets cube 
%   N: Memory
% Output:
%   A Vector: Kernels or triplets vector

AVector = [];
for m = 1:2*M+1
    for n = 1:2*M+1  
        SCtem = squeeze(ACube(m,n,:));  % arrange 
        AVector = [AVector;SCtem];
     end
end