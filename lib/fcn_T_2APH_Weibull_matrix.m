% Function to generate PH representation of lifetime with 
% 2-Acyclic PH distribution representing Weibull (beta,lambda)
% with beta = 1.5, lambda = 0.1

function T = fcn_T_2APH_Weibull_matrix()

T.n    = 2;
T.a    = sparse(1,T.n);
T.a(1) = 1;
T.A    = sparse(T.n,T.n);
T.A(1,1) = -0.216;
T.A(1,2) =  0.213;
T.A(2,2) = -0.216;

end