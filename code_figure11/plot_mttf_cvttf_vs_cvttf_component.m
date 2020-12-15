% Calculate and plot MTTF and CVTTF of General System 
% using PH (Matrix) approach with mix components
% Component Distribution: N-ERLANG, 2-COXIAN. CYCLIC PH

clear all; addpath('..\lib');

N    = 11;  % The number of components
ttf  = 100; % MTTF Components

% cv   = [0.4472,0.5,0.5774,0.7071,1,1.25,1.5,1.75,2];
cv   = [0.7071,1,1.25,1.5,1.75,2];

for k = 1:length(cv)
    k
    if cv(k)<=1
        m     = 1/cv(k)^2;
        m     = round(m);
        lamda = m/ttf;
        T     = fcn_T_nErlang_matrix(m,lamda,N); % PH representation of n-component lifetime with m-Erlang
    else
        T     = fcn_T_2Coxian_matrix(cv(k),ttf,N);  % PH representation of n-component lifetime with 2-Coxian
    end
    
    mean(k) = fcn_mttf_matrix(T(1)); % MTTF of component

    p   = 0.9;
    S1  = phaddsys(T(1:3),p*ones(3,1));
    V21 = phminsys(T(4:6));
    V22 = phminsys(T(7:8));
    S2  = phmaxsys([V21,V22]);
    S3  = phkofnsys(T(9:11),2);
    Ts  = phminsys([S1,S2,S3]);
    ns(k)    = Ts.n;
    mttf(k)  = fcn_mttf_matrix(Ts);  % MTTF of system
    cvttf(k) = fcn_cvttf_matrix(Ts); % CVTTF of system
end

%% Smoothing
mttf  = [ttf,mttf];
cv    = [0,cv];
cvttf = [0,cvttf];
mttf  = full(mttf);
cvttf = full(cvttf);

xx = linspace(0,cv(end),20*length(cv));
z1 = interp1(cv',mttf,xx,'pchip');
z2 = interp1(cv',cvttf,xx,'pchip');

%% Calculate MTTF CVTTF with components Cazorla (Cyclic PH)
T   = fcn_T_cyclicph_matrix(N);
p   = 0.9;
S1  = phaddsys(T(1:3),p*ones(3,1));
V21 = phminsys(T(4:6));
V22 = phminsys(T(7:8));
S2  = phmaxsys([V21,V22]);
S3  = phkofnsys(T(9:11),2);
Ts  = phminsys([S1,S2,S3]);

cvx    = fcn_cvttf_matrix(T(1));
mttfx  = fcn_mttf_matrix(Ts);
cvttfx = fcn_cvttf_matrix(Ts);

save 'data_fig_general_mttf_cvttf.mat';
%%
figure('Name','MTTF');
plot(xx,z1,'k'); hold on;
plot(cvx,mttfx,'kx','MarkerSize',10); hold off;
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('Components CVTTF','FontSize',14);
ylabel('Systems MTTF','FontSize',14);
axis([0 cv(end) 0 ttf]);
text(cvx,mttfx,'\it Cyclic PH, CVTTF = 0.7976','FontName','Times New Roman','FontAngle','italic','FontSize',14);

figure('Name','CVTTF');
plot(xx,z2,'k'); hold on;
plot(cvx,cvttfx,'kx','MarkerSize',10); hold off;
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('Components CVTTF','FontSize',14);
ylabel('Systems CVTTF','FontSize',14);
axis([0 cv(end) 0 1]);
text(cvx,cvttfx,'\it Cyclic PH, CVTTF = 0.7976','FontName','Times New Roman','FontAngle','italic','FontSize',14);