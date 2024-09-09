%% Generate discrete FRP with integral kernels
% This script generates the FRP model geometrically constraied for a 
% sequence of input symbols

clear variables
close all

%% Parameters
Parameters

%% Generate imput sequence
[S,P] = SimpleSeqGen(P);
S.C   = unique(S.SymSeq); 

%% Generate Tx sequence and its triplest
InSequences = GenerateTransmitSequence(S.SymSeq,15,P.Sys.Npol);
TxSeqs      = InSequences.SymSeq.'; 

%% Generate FRP model output 
RxSeqs = zeros(size(InSequences.SymSeq,2),2);
for pc = 1:2
    RxSeqs(:,pc) = TxSeqs(:,pc) + ...
        (8/9)*1j*P.Model.gamma*P.Model.Gp...
        *(InSequences.Triplets(:,:,pc)*SPM_Kernels);
end

%% Plot the result for x pol
fignum_1 = randi(100);
figure(fignum_1)
set(gcf,'Position',[200 200 800 700])
plot(real(RxSeqs(:,1)),imag(RxSeqs(:,1)),'.'); hold on
plot(real(S.C),imag(S.C),'ro',MarkerSize=4,MarkerFaceColor='red'); 
xlim([-1.5 1.5])
ylim([-1.5 1.5])
grid on
title_name = strcat('X-pol Rx for FRP model with $H_i(\hat{M})$ with $i=$' ...
    ,num2str(P.Model.i),' and $\hat{M}=$',num2str(P.Model.hatM));
title(title_name,Interpreter='latex')
xlabel('In-phase',Interpreter='latex')
ylabel('Quadrature',Interpreter='latex')
set(gca,'fontsize',20,'TickLabelInterpreter','latex')