% Function to generate PH representation of lifetime with n-Erlang
% distribution with specific lamda

function T = fcn_T_nErlang_matrix(n,lamda,N)

for i = 1:N
    T(i).a    = sparse(1,n);
    T(i).a(1) = 1;
    T(i).A    = sparse(n,n);
    T(i).n    = n;
    for j = 1:n
        T(i).A(j,j) = -lamda;
        if j+1 <= n
            T(i).A(j,j+1) = lamda;
        end
    end
end

end

