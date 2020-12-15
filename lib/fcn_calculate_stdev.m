function std = fcn_calculate_stdev(S)

u    = ones(S.n,1);
mean = -S.a/(S.A)*u;
pwr  = 2*S.a/(S.A^2)*u;

std  = sqrt(pwr-mean^2);