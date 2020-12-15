% Function to generate PH representation of lifetime with 
% 2-mixture Erlang Exponential distribution with specific lamda

function T = fcn_T_2mixErlang_matrix(lamda,N)

n = 2;
for i = 1:N
    T(i).a = sparse(1,n);
    T(i).a(1) = 0.5;
    T(i).a(2) = 0.5;
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

