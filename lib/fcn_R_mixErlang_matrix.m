function Ti = fcn_R_mixErlang_PH(N)

ttf = 100;
lam = 1/ttf;
for j = 1:N
    Ti(j).a = sparse([0.5 0.5]);
    Ti(j).A = sparse([-lam lam;0 -lam]);
    Ti(j).n = length(Ti(j).a);
end

end

