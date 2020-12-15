function Ti = fcn_R_Weibull_PH(N)

lam1 = 0.5;
lam2 = 0.21;
lam3 = 0.1;
p = 0.8;
q = 0.9524;

for i = 1:N
    Ti(i).a = sparse(1,3);
    Ti(i).a(1) = 1;
    Ti(i).A = sparse(3,3);
    Ti(i).A(1,1) = -lam1;
    Ti(i).A(1,2) = p*lam1;
    Ti(i).A(2,2) = -lam2;
    Ti(i).A(2,3) = q*lam2;
    Ti(i).A(3,3) = -lam3;
    Ti(i).n = 3;
end

end

