% Symbolic Method
% Standby System with 4 Mix Components
% Rs(t) hs(t) MTTF VTTF

clear all; addpath('..\lib');

initialize;

% Generate Rs(t) Symbolic
tic
syms x
% INPUT: Reliability Function of Components
R = [fcn_R_3Coxian_symbolic(p1,q1,lamda1,lamda2,lamda3);
     fcn_R_3Coxian_symbolic(p2,q2,lamda1,lamda2,lamda3);
     fcn_R_3Coxian_symbolic(p3,q3,lamda1,lamda2,lamda3);
     fcn_R_3Coxian_symbolic(p4,q4,lamda1,lamda2,lamda3)];

% Calculate System Reliability Function
Rs(x) = fcn_Rs_standby_symbolic(R);
tSYM(1) = toc;

time_symbolic;

save 'data_standby_symbolic.mat';