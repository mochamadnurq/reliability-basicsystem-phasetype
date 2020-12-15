% Plot Rs(t) Symbolic
tic
rssym = double(Rs(t));
tSYM(2) = toc+tSYM(1);

% Plot hs(t) Symbolic
tic
Hs(x) = -diff(Rs)/Rs;
hssym = double(Hs(t));
tSYM(3) = toc+tSYM(1);

% Calculate MTTF Symbolic
tic
mttfs = fcn_mttf_symbolic(Rs);
tSYM(4) = toc+tSYM(1);

% Calculate VTTF Symbolic
tic
cvttfs = fcn_cvttf_symbolic(Rs);
tSYM(5) =  toc+tSYM(1);

tSYM
mttfs
cvttfs
