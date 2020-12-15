function Rs = fcn_Rs_series_symbolic(R)

syms x
N  = length(R);
Rs = 1;
for i = 1:N
    Rs = Rs*R(i);
end

end

