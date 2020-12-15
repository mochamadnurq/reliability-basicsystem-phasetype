function vttf = fcn_vttf_symbolic(R)

syms x
vttf = double(int(2*x*R,0,inf)-int(R,0,inf)^2);

end

