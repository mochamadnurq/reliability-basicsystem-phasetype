function R = fcn_R_nErlang_symbolic(n,lamda)

syms x
R = 0;
for i = 0:n-1
    R = R+(lamda*x)^i/factorial(i)*exp(-lamda*x);
end

end

