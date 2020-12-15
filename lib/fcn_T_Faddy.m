% Generate life time distribution using faddy1999

function T = fcn_T_Faddy(N)

lam1 = 0.5;
lam2 = 0.21;
lam3 = 0.1;
p    = 0.8;
q    = 0.9524;

for i = 1:N
    T(i).a    = sparse(1,3);
    T(i).a(1) = 1;
    T(i).A    = sparse(3,3);
    T(i).A(1,1) = -lam1;
    T(i).A(1,2) =  p*lam1;
    T(i).A(2,2) = -lam2;
    T(i).A(2,3) =  q*lam2;
    T(i).A(3,3) = -lam3;
    T(i).n      =  3;
end

end