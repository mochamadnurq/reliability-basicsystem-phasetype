function R = fcn_R_nErlang(n,t)

lamda = 0.01;

R = 0;
for i = 0:n-1
    R = R+(lamda*t)^i/factorial(i)*exp(-lamda*t);
end