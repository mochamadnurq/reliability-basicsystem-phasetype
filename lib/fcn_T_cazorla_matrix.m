function T = fcn_T_cazorla_matrix(N)

n  = 2;
k  = 0.2052104;
for i = 1:N
    T(i).a = sparse(1,n);
    T(i).a(1) = 1;
    T(i).A = sparse(n,n);
    T(i).A(1,1) = -0.3306;
    T(i).A(1,2) =  0.2975;
    T(i).A(2,1) =  0.2645;
    T(i).A(2,2) = -0.3306;
    T(i).A      =  T(i).A*k;
    T(i).n      = n;
end

end

