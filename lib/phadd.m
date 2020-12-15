function Ts = phadd(T1,T2,T3,p)

u2   = sparse(ones(T2.n,1));
z31  = sparse(T3.n,T1.n);
Ts.a = [T1.a, (1-sum(T1.a))*T3.a];

if (T1.n-T2.n) == 0
    a13 = -p*T2.A*u2*T3.a;
else
    a13 = [sparse(T1.n-T2.n,T3.n); -p*T2.A*u2*T3.a];
end

Ts.A = [T1.A         a13 ;
        z31        T3.A ];
Ts.n = length(Ts.a);

end