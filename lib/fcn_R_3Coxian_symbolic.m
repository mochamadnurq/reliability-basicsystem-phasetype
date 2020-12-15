function Ri = fcn_R_3Coxian_symbolic(p,q,lamda1,lamda2,lamda3)

syms x y 
R = [exp(-lamda1*x);
     exp(-lamda2*x);
     exp(-lamda3*x)];
Ri(x) = R(1);
R1=R(1);
for i=2:3
    RA(x) = R(i); 
    RB = Ri(x);
    dRB = diff(RB,x);
    Ri(y) = 1+int((1-RA(y-x))*dRB,x,0,y);
    if i==2
        R2=Ri(x);
    elseif i==3
        R3=Ri(x);
    end
end
Ri=p*q*R3+p*(1-q)*R2+(1-p)*R1;
end


