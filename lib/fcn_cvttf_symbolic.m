function cvttf = fcn_cvttf_symbolic(R)

syms x
mttf  = int(R,0,1e6);
vttf  = double(int(2*x*R,0,1e6)-mttf^2);
cvttf = sqrt(vttf)/mttf;
cvttf = double(cvttf);

end

