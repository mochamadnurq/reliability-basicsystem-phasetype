function Rs = fcn_Rs_standby_symbolic(R)

syms x
N  = length(R);
Rs = R(1);
for i = 2:N
    Rs = fcn_R_convolution(Rs,R(i));
end

end

