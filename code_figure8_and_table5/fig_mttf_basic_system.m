clear all
load data_series_matrix.mat
load data_series_symbolic.mat


figure('Name','MTTF');
plot(1,mttf,'kx',1,mttfs,'ko');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('Structure','FontSize',14);
ylabel('Systems MTTF','FontSize',14);
text(1,mttf,'\it Series','FontName','Times New Roman','FontAngle','italic','FontSize',14);
hold on;

%%
clear
load data_3outof4_matrix.mat
load data_3outof4_symbolic.mat

plot(2,mttf,'kx',2,mttfs,'ko');
text(2,mttf,'\it 3-out-of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);


%%
clear
load data_2outof4_matrix.mat
load data_2outof4_symbolic.mat

plot(3,mttf,'kx',3,mttfs,'ko');
text(3,mttf,'\it 2-out-of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_parallel_matrix.mat
load data_parallel_symbolic.mat

plot(4,mttf,'kx',4,mttfs,'ko');
text(4,mttf,'\it Parallel','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_imperfect_matrix.mat
load data_standby_imperfect_symbolic.mat

mttfs = int(Rs,0,10000);

plot(5,mttf,'kx',5,mttfs,'ko');
text(5,mttf,'\it Standby Imperfect (p = 0.9)','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_matrix.mat
load data_standby_symbolic.mat

mttfs = int(Rs,0,10000);

plot(6,mttf,'kx',6,mttfs,'ko');
text(6,mttf,'\it Standby','FontName','Times New Roman','FontAngle','italic','FontSize',14);

hold off;
axis([0 7 0 500]);
legend('Matrix','Symbolic','location','northwest');