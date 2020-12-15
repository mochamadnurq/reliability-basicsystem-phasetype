function vttf = fcn_vttf_matrix(T)

u    = sparse(ones(T.n,1));
mttf = -T.a/T.A*u;
vttf = 2*T.a/(T.A^2)*u-mttf^2;

end

