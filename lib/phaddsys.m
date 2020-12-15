function Ts = phaddsys(T,P)

N  = length(T);
Ts = T(1);

for i = 2:N
    T1 = Ts;
    T2 = T(i-1);
    T3 = T(i);
    Ts = phadd(T1,T2,T3,P(i-1));
end

end