function ht = fcn_ht_matrix(T,t)

u=sparse(ones(T.n,1));
for i=1:length(t)
    eu = expmq(T.A*t(i))*u;
    ht(i) = -T.a*T.A*eu/(T.a*eu);
end

end

