function [mean,power] = fcn_calculatemeanpower(S)
u=ones(S.n,1);
mean = -(S.a/S.A)*u;
power = 2*(S.a/S.A^2)*u;