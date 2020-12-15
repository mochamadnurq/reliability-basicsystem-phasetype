function dR = fcn_dR_nErlang(n,t)

lamda=0.01;

dR=-lamda*exp(-lamda*t);
for i=1:n-1
    dR=dR+(i*lamda*(lamda*t)^(i-1)/factorial(i)-lamda*(lamda*t)^(i)/factorial(i))*exp(-lamda*t);
end