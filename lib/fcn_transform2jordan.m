function TME = fcn_transform2jordan(TPH)

[V,J] = jordan(TPH.A);
V     = sparse(V);
TME.a = TPH.a*V;
TME.A = V\TPH.A*V;
TME.v = V\TPH.v;
TME.n = TPH.n;

for i = 1:TME.n
    for j = 1:TME.n
        e = abs(TME.A(i,j));
        if e < 1e-5
            TME.A(i,j) = 0;
        end
    end
end

end

