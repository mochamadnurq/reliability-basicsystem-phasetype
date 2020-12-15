% Time Elapsed of Symbolic Method
% Series System with 4 Mix Components
% Rs(t) hs(t) MTTF VTTF

clear all; addpath('..\lib');

tSYM = zeros(1,5);

initialize;

J = 10;
tic
for j = 1:J
    syms x
    % INPUT: Reliability Function of Components
    R = [fcn_R_3Coxian_symbolic(p1,q1,lamda1,lamda2,lamda3);
         fcn_R_3Coxian_symbolic(p2,q2,lamda1,lamda2,lamda3);
         fcn_R_3Coxian_symbolic(p3,q3,lamda1,lamda2,lamda3);
         fcn_R_3Coxian_symbolic(p4,q4,lamda1,lamda2,lamda3)];

    % Calculate System Reliability Function
    Rs(x) = fcn_Rs_series_symbolic(R);
end
tSYM(1) = toc/J;

time_symbolic;

save 'data_series_symbolic.mat';