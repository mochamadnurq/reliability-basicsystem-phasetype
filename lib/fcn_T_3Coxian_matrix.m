% Function to generate PH representation of lifetime with 
% 3-Coxian distribution with specific lamda

function T = fcn_T_3Coxian_matrix(p,q,lamda1,lamda2,lamda3,N)

n = 3;
for i = 1:N
    T(i).a    = sparse(1,n);
    T(i).a(1) = 1;
    T(i).A    = sparse(n,n);
    T(i).A(1,1) = -lamda1;
    T(i).A(1,2) =  p*lamda1;
    T(i).A(2,2) = -lamda2;
    T(i).A(2,3) =  q*lamda2;
    T(i).A(3,3) = -lamda3;
    T(i).n      =  n;
end

end

