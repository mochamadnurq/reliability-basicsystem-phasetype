function Rs = fcn_Rs_standby_imperfect_symbolic(p,R)

N = length(R);
syms x
Rc = R(1);
Rs = (1-p)*Rc;
for i = 2:N
    Rc = fcn_R_convolution(Rc,R(i));
    if i == N
        Rs = Rs + p^(i-1)*Rc;
    else
        Rs = Rs + p^(i-1)*(1-p)*Rc;
    end
end

end

