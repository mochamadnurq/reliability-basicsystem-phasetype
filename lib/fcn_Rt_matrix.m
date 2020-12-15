function Rt = fcn_Rt_matrix(T,t)

u = sparse(ones(T.n,1));
for i = 1:length(t)
    eu    = expmq(T.A*t(i))*u;
    Rt(i) = T.a*eu;
end

end

