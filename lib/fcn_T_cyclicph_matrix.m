function T = fcn_T_cyclicph_matrix(N)

n  = 2;
k  = 79.6703/100;
for i = 1:N
    T(i).a    = sparse(1,n);
    T(i).a(1) = 1;
    T(i).A    = sparse(n,n);
    T(i).A(1,1) = -0.02;
    T(i).A(1,2) =  0.018;
    T(i).A(2,1) =  0.004;
    T(i).A(2,2) = -0.04;
    T(i).A      = T(i).A*k;
    T(i).n      = n;
end

end