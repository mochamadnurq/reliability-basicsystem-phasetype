function R = fcn_R_convolution(RA,RB)

syms x y
RA(x) = RA;
dRB   = diff(RB);
R(y)  = 1+int((1-RA(y-x))*dRB,x,0,y);
R     = R(x);

end

