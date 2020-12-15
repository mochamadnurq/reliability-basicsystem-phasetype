function Ri = fcn_R_Faddy()

syms x y
lam1 = 0.5;
lam2 = 0.21;
lam3 = 0.1;
p = 0.8;
q = 0.9524;
R  =  [exp(-lam1*x);
     exp(-lam2*x);
     exp(-lam3*x)];
Ri(x)  =  R(1);
R1 = R(1);
for i = 2:3
    RA(x)  =  R(i); 
    RB  =  Ri(x);
    dRB  =  diff(RB,x);
    Ri(y)  =  1+int((1-RA(y-x))*dRB,x,0,y);
    if i =  = 2
        R2 = Ri(x);
    elseif i =  = 3
        R3 = Ri(x);
    end
end
Ri = p*q*R3+p*(1-q)*R2+(1-p)*R1;
end