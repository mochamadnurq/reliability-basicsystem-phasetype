function T = fcn_T_2Coxian_matrix(c,mean,N)

n   = 2;
r   = 1/(c^2-sqrt(c^4-1));
p   = (1-c^4+c^2*sqrt(c^4-1))/(c^2+1);
mu2 = (1/r+p)/mean;
mu1 = r*mu2;

for i = 1:N
    T(i).a      = sparse(1,n);
    T(i).a(1)   = 1;
    T(i).A      = sparse(n,n);
    T(i).A(1,1) = -mu1;
    T(i).A(2,2) = -mu2;
    T(i).A(1,2) = p*mu1;
    T(i).n      = n;
end

end