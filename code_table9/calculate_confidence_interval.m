% MTTF and Confidence Interval 95% of General System
% Component Distribution: 
% Exponential, m-Erlang

clear all; addpath('..\lib');

%% INPUT: PH Representation of Components Lifetime
N    = 11;  % The number of components
M    = 10;  % The number of measurements
ttf  = 100; % MTTF Components

m    = 1;   % m = 1 for exponential
T    = fcn_T_nErlang_matrix(m,m/ttf,N); % PH representation of n-component lifetime with m-Erlang
    
mttf  = fcn_mttf_matrix(T(1)) % MTTF component

%% MAIN PROGRAM
% Generate PH (Matrix) representation of general system
p   = 0.9;
S1  = phaddsys(T(1:3),p*ones(3,1));
V21 = phminsys(T(4:6));
V22 = phminsys(T(7:8));
S2  = phmaxsys([V21,V22]);
S3  = phkofnsys(T(9:11),2);
Ts  = phminsys([S1,S2,S3]);

for m = 1:M
    MTs(m) = Ts;
end

MTS   = phaddsys(MTs,ones(M,1));
mttfs = fcn_mttf_matrix(MTS)/M

%% Calculate R(tmax)
tmax = 1000;
u    = sparse(ones(MTS.n,1));
eu   = expmq(MTS.A*tmax)*u;
R    = MTS.a*eu;

%% Calculate R(t)
s    = 21;
t    = linspace(0,tmax,s);
for i = 1:s
    tloop = tic;
    eu   = expmq(MTS.A*t(i))*u;
    R(i) = MTS.a*eu;
    toc(tloop)
end

% Smoothing data
R  = full(R);
xx = linspace(0,tmax,5*s);
yy = interp1(t',R,xx,'pchip');

[t1,t2,e1,e2] = fcn_95confidence_interval(xx,yy);

t1 = t1/M
t2 = t2/M

figure('Name','CDF');
plot(xx,yy,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it F(t)','FontSize',14);