function R = fcn_R_2mixErlang_symbolic(lamda)

syms x
e = exp(-lamda*x);
R = e + 0.5*lamda*x*e;

end

