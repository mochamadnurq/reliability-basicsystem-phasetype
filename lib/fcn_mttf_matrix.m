function mttf = fcn_mttf_matrix(T)
%FCN_MTTF_PH Summary of this function goes here
%   Detailed explanation goes here

u    = sparse(ones(T.n,1));
mttf = -T.a/T.A*u;

end

