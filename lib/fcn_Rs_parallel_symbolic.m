function Rs = fcn_Rs_parallel_symbolic(R)

syms x
N  = length(R);
Rp = 1;
for i = 1:N
    Rp = Rp*(1-R(i));
end
Rs = 1-Rp;

end

