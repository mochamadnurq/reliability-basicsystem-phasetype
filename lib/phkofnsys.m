function Ts = phkofnsys(T,K)

N  = length(T);
Ts = phmaxsys(T);

Q  = 1;
Q  = sparse(Q);
L  = T(1).n;
L  = sparse(L);

% Term estimations
for i = 2:N
    Q = [Q+1 Q 1];
end

% Length estimations
for i = 2:N
    L = [L*T(i).n L T(i).n];
end

% Calculating K out of N system
M = length(Q);
for j = 1:K-1
    i = 1;
    while i <= M
        if Q(i) == j
           P(1) = 1;
           for ii = 2:length(L)+1
               P(ii) = P(ii-1)+L(ii-1);
           end
           Ts.A(:,P(i):P(i+1)-1) = [];
           Ts.A(P(i):P(i+1)-1,:) = [];
           Ts.a(P(i):P(i+1)-1)   = [];
           Q(i) = [];
           L(i) = [];
           M    = M-1;
           i    = i-1;
           clear P
        end
        i = i+1;
    end
end

Ts.n = length(Ts.a);

end