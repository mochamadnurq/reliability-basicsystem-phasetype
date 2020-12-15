% MTTF and SDTTF of General System
% Component Distribution: 
% Exponential, k-Erlang, 2-Coxian, Cyclic PH

clear all;addpath('..\lib');

%% INPUT: PH Representation of Component Lifetime
N    = 11;  % The number of components
ttf  = 100; % MTTF Components
m    = 4;
cv   = 2;
% T    = fcn_T_nErlang_matrix(m,m/ttf,N); % PH representation of n-component lifetime with m-Erlang
T   = fcn_T_2Coxian_matrix(cv,ttf,N);  % PH representation of n-component lifetime with 2-Coxian
% T    = fcn_T_cyclicph_matrix(N); % PH representation of n-component lifetime with Cyclic PH
    
mttfc  = fcn_mttf_matrix(T(1))  % MTTF component
cvttfc = fcn_cvttf_matrix(T(1)) % CVTTF component

%% MAIN PROGRAM
% Generate PH (Matrix) representation of general system
p   = 0.9;
S1  = phaddsys(T(1:3),p*ones(3,1));
V21 = phminsys(T(4:6));
V22 = phminsys(T(7:8));
S2  = phmaxsys([V21,V22]);
S3  = phkofnsys(T(9:11),2);
Ts  = phminsys([S1,S2,S3]);

mttfs  = fcn_mttf_matrix(Ts)  % MTTF system
vttfs  = fcn_vttf_matrix(Ts);
sdttfs = sqrt(vttfs)          % SDTTF system