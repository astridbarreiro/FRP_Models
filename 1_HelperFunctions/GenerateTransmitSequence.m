function Sequences = GenerateTransmitSequence(InSeq,N,Np)
%GENERATETRANSMITSEQUENC Takes a long random sequence and creates an
%array of sequences of length 2N+1. It also generates a labels vector with
%the instants of time to be considered at the outputs
%  Inputs:
%    InSeq: Input random sequence
%    N: Memory size

Seql = 2*N+1; % Sequences length
med  = N+1;   % Middle symbol
L    = length(InSeq);

if Np == 1 % Single pol case
    if L-2*N >= 1                 %resrtrictions over the length
        AofS = zeros(L-2*N,Seql); % To be filled with sequences
        Am   = zeros(L-2*N,1);    % To be filled with midpoins of the sequences
        T_vec= zeros(L-2*N,1);    % To be filled with time instances to select the output sequence
        for ii=1:L-2*N
            AofS(ii,:) = InSeq(ii:Seql+ii-1);
            Am(ii,1)   = InSeq(med+ii-1);
            T_vec(ii,1)= med+ii-1;
        end
    else
        error('The input sequence is too short for the memory required')
    end
    Sequences.SeqTx = AofS;
    Sequences.amK   = Am.';
else    % dual pol case
    if L-2*N >= 1                 %resrtrictions over the length
        AofSx = zeros(L-2*N,Seql); % Sequences x
        Amx   = zeros(L-2*N,1);    % Midpoins x
        AofSy = zeros(L-2*N,Seql); % Sequences y
        Amy   = zeros(L-2*N,1);    % Midpoins y
        T_vec= zeros(L-2*N,1);     % Time instances
        for ii=1:L-2*N
            AofSx(ii,:) = InSeq(1,ii:Seql+ii-1);
            Amx(ii,1)   = InSeq(1,med+ii-1);
            AofSy(ii,:) = InSeq(2,ii:Seql+ii-1);
            Amy(ii,1)   = InSeq(2,med+ii-1);
            T_vec(ii,1) = med+ii-1;
        end
    else
        error('The input sequence is too short for the required memory')
    end
    amK(1,:) = Amx.';
    amK(2,:) = Amy.';
    % Generate triplets
    Tripx = zeros(length(AofSx),Seql^3);
    Tripy = zeros(length(AofSx),Seql^3);
    parfor iIter=1:length(AofSx)  % Changed to a par for by A. Alvarado on 16.05.2023
        Data_mx    = AofSx(iIter,:);
        Data_my    = AofSy(iIter,:);
        Data_mnxy  = Data_mx'*Data_mx + Data_my'*Data_my;
        Data_mnpx  = reshape(Data_mnxy(:)*Data_mx,Seql,Seql,Seql);
        Data_mnpy  = reshape(Data_mnxy(:)*Data_my,Seql,Seql,Seql);
        Trip_tempx = (Cu2Vec(Data_mnpx,N)).';   
        Trip_tempy = (Cu2Vec(Data_mnpy,N)).';   
        Tripx(iIter,:) = Trip_tempx;
        Tripy(iIter,:) = Trip_tempy;
    end
    Trip(:,:,1) = Tripx;
    Trip(:,:,2) = Tripy;
end
Sequences.SymSeq   = amK;                     % Tx Sequence
Sequences.T_vec    = T_vec;                   % Time instances with respect to the SSFM sequence
Sequences.Triplets = Trip;                    % Triplets
end
