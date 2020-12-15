% Function to estimate 95% Confidence Interfal of R(t)
% Input:
%   t   : time vector
%   R   : R value of t, R(t)
% Output:
%   t1  : time at R(t) = 0.975
%   t2  : time at R(t) = 0.025
%   e1  : error at t(2.5%)
%   e2  : error at t(97.5%)

function [t1,t2,e1,e2] = fcn_95confidence_interval(t,R)

c1   = 0.975;
c2   = 0.025;
e1   = 1;
e2   = 1;
t1   = 0;
t2   = 0;

for i = 1:length(t)
    er1 = abs(R(i)-c1);
    er2 = abs(R(i)-c2);
    if er1 < e1
        e1 = er1;
        t1 = t(i);
        y1 = R(i);
    end
    if er2 < e2
        e2 = er2;
        t2 = t(i);
        y2 = R(i);
    end
end

end