
% Plot Rs(t) Matrix
J = 1;
tic;
for j = 1:J
    rsph = fcn_Rt_matrix(Ts,t);    
end
tMAT(2) = toc/J+tMAT(1);

% Plot hs(t) Matrix
J = 1;
tic;
for j = 1:J
    hsph = fcn_ht_matrix(Ts,t);
end
tMAT(3) = toc/J+tMAT(1);

% Calculate MTTF Matrix
J = 1;
tic
for j = 1:J
    mttf = fcn_mttf_matrix(Ts);
end
tMAT(4) = toc/J+tMAT(1);

% Calculate VTTF Matrix
J = 1;
tic
for j = 1:J
    cvttf = fcn_cvttf_matrix(Ts);
end
tMAT(5) = toc/J+tMAT(1);

tMAT
mttf
cvttf
