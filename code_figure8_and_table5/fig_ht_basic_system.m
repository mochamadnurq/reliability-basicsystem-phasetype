clear all
load data_series_matrix.mat
load data_series_symbolic.mat

hsph = full(hsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',hsph,xx,'pchip');

figure('Name','Hazard Function');
plot(xx,z,'k',t,hssym,'ko');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('t','FontSize',14);
ylabel('h(t)','FontSize',14);
text(t(5),hsph(5),'\it Series','FontName','Times New Roman','FontAngle','italic','FontSize',14);
hold on;

%%
clear
load data_parallel_matrix.mat
load data_parallel_symbolic.mat

hsph = full(hsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',hsph,xx,'pchip');

plot(xx,z,'k',t,hssym,'ko');
text(t(5),hsph(5),'\it Parallel','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_2outof4_matrix.mat
load data_2outof4_symbolic.mat

hsph = full(hsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',hsph,xx,'pchip');

plot(xx,z,'k',t,hssym,'ko');
text(t(5),hsph(5),'\it 2-out of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_3outof4_matrix.mat
load data_3outof4_symbolic.mat

hsph = full(hsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',hsph,xx,'pchip');

plot(xx,z,'k',t,hssym,'ko');
text(t(5),hsph(5),'\it 3-out of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_matrix.mat
load data_standby_symbolic.mat

hsph = full(hsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',hsph,xx,'pchip');

plot(xx,z,'k',t,hssym,'ko');
text(t(5),hsph(5),'\it Standby','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_imperfect_matrix.mat
load data_standby_imperfect_symbolic.mat

hsph = full(hsph);
xx = linspace(0,tmax,5*s);
z  = interp1(t',hsph,xx,'pchip');

plot(xx,z,'k',t,hssym,'ko');
text(t(5),hsph(5),'\it Standby Imperfect (p = 0.9)','FontName','Times New Roman','FontAngle','italic','FontSize',14);
hold off;
legend('Matrix','Symbolic');
axis([0 1000 0 0.06]);