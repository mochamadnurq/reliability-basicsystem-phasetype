%% function mttf = fcn_mttf_symbolic(R)
%
% Description : Function to calculate Mean Time to Failure (MTTF) of
%               R(x) in symbolic representation
% Input       : R(x), reliability function
% Output      : MTTF

function mttf = fcn_mttf_symbolic(R)

syms x
mttf = double(int(R,0,1e6));

end