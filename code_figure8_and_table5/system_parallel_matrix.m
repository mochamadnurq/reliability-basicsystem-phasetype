% Matrix Method

clear all; addpath('..\lib');

initialize;

tic
% INPUT: PH Representation of Component Lifetime
T(1) = fcn_T_3Coxian_matrix(p1,q1,lamda1,lamda2,lamda3,1);
T(2) = fcn_T_3Coxian_matrix(p2,q2,lamda1,lamda2,lamda3,1);
T(3) = fcn_T_3Coxian_matrix(p3,q3,lamda1,lamda2,lamda3,1);
T(4) = fcn_T_3Coxian_matrix(p4,q4,lamda1,lamda2,lamda3,1);

% Generate Matrix (PH) Representation of System
Ts   = phmaxsys(T);
tMAT(1) = toc;

time_matrix;

save 'data_parallel_matrix.mat';