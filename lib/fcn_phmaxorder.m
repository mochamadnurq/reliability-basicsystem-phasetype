function ns = fcn_phmaxorder(N,n)

ns=n^2+n+n;
for i=3:N
    ns=ns*n+ns+n;
end