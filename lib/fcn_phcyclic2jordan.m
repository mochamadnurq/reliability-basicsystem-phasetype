function S = fcn_phcyclic2jordan(T)

[V,D] = eigs(T.A)

S.a = T.a*V;
S.A = V\T.A*V;
S.v = V\T.v;
S.n = T.n;

end