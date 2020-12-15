%% R = fcn_R_Weibull_symbolic(n,lamda)
% Description: Generate R(x) using Weibull distribution
% R(x) = exp(-x/lamda)^k;
% Input:
%   x       : time
%   lamda   : scale parameter
%   k       : shape parameter

function R = fcn_R_Weibull_symbolic(lamda,k)
syms x

R(x) = exp(-(lamda*x)^k);

end

