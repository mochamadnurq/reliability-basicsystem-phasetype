clear all
load data_series_matrix.mat
load data_series_symbolic.mat


figure('Name','CVTTF');
plot(1,cvttf,'kx',1,cvttfs,'ko');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('Structure','FontSize',14);
ylabel('Systems CVTTF','FontSize',14);
text(1,cvttf,'\it Series','FontName','Times New Roman','FontAngle','italic','FontSize',14);
hold on;

%%
clear
load data_3outof4_matrix.mat
load data_3outof4_symbolic.mat

plot(2,cvttf,'kx',2,cvttfs,'ko');
text(2,cvttf,'\it 3-out-of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);


%%
clear
load data_2outof4_matrix.mat
load data_2outof4_symbolic.mat

plot(3,cvttf,'kx',3,cvttfs,'ko');
text(3,cvttf,'\it 2-out-of-4','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_parallel_matrix.mat
load data_parallel_symbolic.mat

plot(4,cvttf,'kx',4,cvttfs,'ko');
text(4,cvttf,'\it Parallel','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_imperfect_matrix.mat
load data_standby_imperfect_symbolic.mat

mttfs  = int(Rs,0,10000);
vttfs  = double(int(2*x*R,0,inf)-mttfs^2);
cvttfs = sqrt(vttfs)/mttf;
cvttfs = double(cvttf);

plot(5,cvttf,'kx',5,cvttfs,'ko');
text(5,cvttf,'\it Standby Imperfect (p = 0.9)','FontName','Times New Roman','FontAngle','italic','FontSize',14);

%%
clear
load data_standby_matrix.mat
load data_standby_symbolic.mat

mttfs  = int(Rs,0,10000);
vttfs  = double(int(2*x*R,0,inf)-mttfs^2);
cvttfs = sqrt(vttfs)/mttf;
cvttfs = double(cvttf);

plot(6,cvttf,'kx',6,cvttfs,'ko');
text(6,cvttf,'\it Standby','FontName','Times New Roman','FontAngle','italic','FontSize',14);

hold off;
axis([0 7 0 1]);
legend('Matrix','Symbolic','location','southeast');