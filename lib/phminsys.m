function Ts = phminsys(T)

N  = length(T);
Ts = T(1);
for i = 2:N
    T1 = Ts;
    T2 = T(i);
    Ts = phmin(T1,T2);
end

end