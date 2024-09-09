function [Sout,Pout] = SimpleSeqGen(Pin)
%SIMPLESEQGEN Genertes a Tx sequences of M-QAM
%   Input:
%       Pin.Tx.Nsym -> Sequence length
%   Output:
%       Pout -> Parameters
%       Sout -> Signal with Tx sequece
Pout = Pin;
NSym = Pin.Model.Nsam;

%% Generate constellation of interest 8QAM
M    = Pin.Sys.CLength;
ModX = qammod((0:M-1)',M);
I = real(ModX);
Q = imag(ModX);
X(1,:) = I;
X(2,:) = Q;
Pout.PrX = ones(M,1)/M;
Sout.X   = normalize_Es(X,Pout.PrX);
Sout.C   = (Sout.X(1,:) + 1i*Sout.X(2,:));

%% Genate random integers array and Tx sequence
Sout.TxIdx  = randi([1 numel(Sout.C)],1,NSym);
Sout.TxIdy  = randi([1 numel(Sout.C)],1,NSym);
Sout.SymSeq(1,:) = Sout.C(Sout.TxIdx);
Sout.SymSeq(2,:) = Sout.C(Sout.TxIdy);

    function X = normalize_Es(X,PX)
        Es = sum(X.^2,1)*PX;
        X  = X./sqrt(Es);
    end
end

