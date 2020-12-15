clear all
load data_series_matrix.mat
load data_series_symbolic.mat

rsph = full(rsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',rsph,xx,'pchip');

figure('Name','Reliability Function');
plot(xx,z,'k',t,rssym,'ko');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('t','FontSize',14);
ylabel('R(t)','FontSize',14);
text(t(2),rsph(2),'\it Series','FontName','Times New Roman','FontAngle','italic','FontSize',14);
hold on;

%%
clear
load data_parallel_matrix.mat
load data_parallel_symbolic.mat

rsph = full(rsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',rsph,xx,'pchip');

plot(xx,z,'k',t,rssym,'ko');
text(t(5),rsph(5),'\it Parallel','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_2outof4_matrix.mat
load data_2outof4_symbolic.mat

rsph = full(rsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',rsph,xx,'pchip');

plot(xx,z,'k',t,rssym,'ko');
text(t(5),rsph(5),'\it 2-out of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_3outof4_matrix.mat
load data_3outof4_symbolic.mat

rsph = full(rsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',rsph,xx,'pchip');

plot(xx,z,'k',t,rssym,'ko');
text(t(5),rsph(5),'\it 3-out of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_matrix.mat
load data_standby_symbolic.mat

rsph = full(rsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',rsph,xx,'pchip');

plot(xx,z,'k',t,rssym,'ko');
text(t(5),rsph(5),'\it Standby','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_imperfect_matrix.mat
load data_standby_imperfect_symbolic.mat

rsph = full(rsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',rsph,xx,'pchip');

plot(xx,z,'k',t,rssym,'ko');
text(t(5),rsph(5),'\it Standby Imperfect (p = 0.9)','FontName','Times New Roman','FontAngle','italic','FontSize',14);
hold off;
legend('Matrix','Symbolic');