% Reliability Analysis of General System using PH Distribution (Matrix) Approach

clear all; addpath('..\lib');

%% INPUT: PH Representation of Components Lifetime
N     = 10;   % The number of components
ttf   = 100;  % MTTF Components
n     = 2;    % n-stage Erlang
lamda = n/ttf;
T     = fcn_T_nErlang_matrix(n,lamda,N); % PH representation of N-component lifetime with m-Erlang

mttf_comp  = fcn_mttf_matrix(T(1));
cvttf_comp = fcn_cvttf_matrix(T(1));

%% DEFINE GENERAL SYSTEM (As in Figure)
p   = 0.9;
V11 = phaddsys(T(3:5),p*ones(3,1));
S1  = phminsys([T(1),T(2),V11]);
V21 = phkofnsys(T(7:9),2); 
S2  = phminsys([T(6),V21]);
S3  = T(10); 
Ts  = phmaxsys([S1,S2,S3]);

%% Plot Reliability and Hazard Functions
tmax = 500;
s    = 21;
t    = linspace(0,tmax,s);
u    = sparse(ones(Ts.n,1));
for i = 1:length(t)
    i
    tic
    eu    = expmq(Ts.A*t(i))*u;
    rs(i) =  Ts.a*eu;
    hs(i) = -Ts.a*Ts.A*eu/rs(i);
    toc
end

% Smoothing
rs = full(rs);
hs = full(hs);
xx = linspace(0,tmax,5*s);
z1 = interp1(t',rs,xx,'pchip');
z2 = interp1(t',hs,xx,'pchip');

%% OUTPUT: MTTF and CVTTF System
mttf_sys  = fcn_mttf_matrix(Ts)
cvttf_sys = fcn_cvttf_matrix(Ts)

%% OUTPUT: Table of Values R(t) and h(t)
disp('Table of Values R(t) and h(t)')
disp('t  : time')
disp('rs : reliability value at time t')
disp('hs : hazard value at time t')
t = t';
rs = rs';
hs = hs';
Table = table(t,rs,hs)

%% OUTPUT: Plot Reliability Function
figure('Name','Reliability Function');
plot(xx,z1,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);

%% OUTPUT: Plot Hazard Function
figure('Name','Hazard Function');
plot(xx,z2,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
