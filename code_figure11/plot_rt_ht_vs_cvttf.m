% Reliability and Hazard Function of General System using Matrix approach
% with mix components
% Component Distribution: N-ERLANG, 2-COXIAN. CYCLIC PH

clear all; addpath('..\lib');

tmax = 200;
s    = 20;
t    = linspace(0,tmax,s);

N    = 11;  % The number of components
ttf  = 100; % MTTF Components

cv   = [0.7071,0.7976,1,1.5];

for k = 1:length(cv)
    k
    if cv(k)<=1
        if cv(k) == 0.7976
            T     = fcn_T_cyclicph_matrix(N); % PH representation of N-components using Cyclic PH
        else
            m     = 1/cv(k)^2;
            m     = round(m);
            lamda = m/ttf;
            T     = fcn_T_nErlang_matrix(m,lamda,N); % PH representation of N-component lifetime with m-Erlang
        end
    else
        T = fcn_T_2Coxian_matrix(cv(k),ttf,N);  % PH representation of N-component lifetime with 2-Coxian
    end
    
    mean(k)  = fcn_mttf_matrix(T(1));
    cvttf(k) = fcn_cvttf_matrix(T(1));

    p   = 0.9;
    S1  = phaddsys(T(1:3),p*ones(3,1));
    V21 = phminsys(T(4:6));
    V22 = phminsys(T(7:8));
    S2  = phmaxsys([V21,V22]);
    S3  = phkofnsys(T(9:11),2);
    Ts  = phminsys([S1,S2,S3]);

    u = sparse(ones(Ts.n,1));
    for i = 1:length(t)
        i
        tic
        eu      = expmq(Ts.A*t(i))*u;
        rs(i,k) =  Ts.a*eu;
        hs(i,k) = -Ts.a*Ts.A*eu/rs(i,k);
        ts(i,k) = toc;
    end
end

%% Smoothing
rs = full(rs);
hs = full(hs);
xx = linspace(0,tmax,5*s);
for i = 1:length(cv)
    z1(:,i) = interp1(t',rs(:,i),xx,'pchip');
    z3(:,i) = interp1(t',hs(:,i),xx,'pchip');
end

save 'data_fig_general_Rs_Hs.mat';

%%
figure('Name','Reliability Function');
plot(xx,z1,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('t','FontSize',14);
ylabel('R(t)','FontSize',14);
text(t(6)+2,rs(6,1),'\it CVTTF = 0.7071','FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(6)+2,rs(6,2),'\it CVTTF = 0.7976','FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(6)+2,rs(6,3),'\it CVTTF = 1','FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(6)+2,rs(6,4),'\it CVTTF = 1.5','FontName','Times New Roman','FontAngle','italic','FontSize',14);

figure('Name','Hazard Function');
plot(xx,z3,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('t','FontSize',14);
ylabel('h(t)','FontSize',14);
axis([0 tmax 0 0.08]);
text(t(12),hs(12,1)-0.002,'\it CVTTF = 0.7071','FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(12),hs(12,2)-0.002,'\it CVTTF = 0.7976','FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(12),hs(12,3)-0.002,'\it CVTTF = 1','FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(12),hs(12,4)-0.002,'\it CVTTF = 1.5','FontName','Times New Roman','FontAngle','italic','FontSize',14);