% Function to generate PH representation of lifetime with n-Erlang
% distribution with specific lamda

function T = fcn_nErlang_PH(n,lamda)

un=sparse(ones(n,1));
T.a=sparse(1,n);
T.a(1)=1;
T.A=sparse(n,n);
T.n=n;
for j=1:n
    T.A(j,j)=-lamda;
    if j+1<=n
        T.A(j,j+1)=lamda;
    end
end

end

