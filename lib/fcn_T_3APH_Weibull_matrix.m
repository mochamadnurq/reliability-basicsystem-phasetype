% Function to generate PH representation of lifetime with 
% 3-Acyclic PH distribution representing Weibull (beta,lambda)
% with beta = 1.5, lambda = 0.1

function T = fcn_T_3APH_Weibull_matrix()

T.n    = 3;
T.a    = sparse(1,T.n);
T.a(1) = 1;
T.A    = sparse(T.n,T.n);
T.A(1,1) = -0.270;
T.A(1,2) = 0.147;
T.A(1,3) = 0.099;
T.A(2,2) = -0.270;
T.A(2,3) = 0.270;
T.A(3,3) = -0.270;

end