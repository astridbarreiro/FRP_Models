function [KC]=Vec2Cub(KernelsVec,N2s)
% VEC2CUB maps a vector of kernels to a cube of size N2sxN2sxN2s
Ind = zeros(N2s,N2s,N2s);
for p=1:N2s
    int = p:N2s:N2s^3;
    Ind(:,:,p) = (reshape(int,N2s,N2s))';  
end
KC = KernelsVec(Ind);