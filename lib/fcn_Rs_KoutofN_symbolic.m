function Rs = fcn_Rs_KoutofN_symbolic(R,K)

syms x y
N = length(R);
for i = 1:N
    C(i) = i;
end

Rs = 0;
for i = K:N
    nC = combnk(C,i);
    [m,n] = size(nC);
    Rd = 0;
    for j = 1:m
        Rc = 1;
        x  = 1;
        for k = 1:N
            if x <= i
                if k == nC(j,x)
                    Rc = Rc*R(k);
                    x  = x+1;
                else
                    Rc = Rc*(1-R(k));
                end
            else
                Rc = Rc*(1-R(k));
            end
        end    
        
        Rd = Rd+Rc;
    end
    Rs = Rs+Rd;
end

end