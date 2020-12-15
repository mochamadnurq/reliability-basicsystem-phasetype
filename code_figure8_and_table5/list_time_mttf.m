clear all
load data_series_matrix.mat

Table(1,1:4) = tMAT(1:4);
Table(1,5) = mttf;

load data_series_symbolic.mat
Table(2,1:4) = tSYM(1:4);
Table(2,5) = mttfs;

%%
% clear
load data_3outof4_matrix.mat
Table(3,1:4) = tMAT(1:4);
Table(3,5) = mttf;

load data_3outof4_symbolic.mat
Table(4,1:4) = tSYM(1:4);
Table(4,5) = mttfs;

%%
% clear
load data_2outof4_matrix.mat
Table(5,1:4) = tMAT(1:4);
Table(5,5) = mttf;

load data_2outof4_symbolic.mat
Table(6,1:4) = tSYM(1:4);
Table(6,5) = mttfs;

%%
% clear
load data_parallel_matrix.mat
Table(7,1:4) = tMAT(1:4);
Table(7,5) = mttf;

load data_parallel_symbolic.mat
Table(8,1:4) = tSYM(1:4);
Table(8,5) = mttfs;

%%
% clear
load data_standby_matrix.mat
Table(9,1:4) = tMAT(1:4);
Table(9,5) = mttf;

load data_standby_symbolic.mat
Table(10,1:4) = tSYM(1:4);
Table(10,5) = mttfs;

%%
% clear
load data_standby_imperfect_matrix.mat
Table(11,1:4) = tMAT(1:4);
Table(11,5) = mttf;

load data_standby_imperfect_symbolic.mat
Table(12,1:4) = tSYM(1:4);
Table(12,5) = mttfs;

System(1) = {'Series (Matrix)'};
System(2) = {'Series (Symbolic)'};
System(3) = {'3-out-of-4 (Matrix)'};
System(4) = {'3-out-of-4 (Symbolic)'};
System(5) = {'2-out-of-4 (Matrix)'};
System(6) = {'2-out-of-4 (Symbolic)'};
System(7) = {'Parallel (Matrix)'};
System(8) = {'Parallel (Symbolic)'};
System(9) = {'Standby Perfect (Matrix)'};
System(10) = {'Standby Perfect (Symbolic)'};
System(11) = {'Standby Imperfect (p = 0.9) (Matrix)'};
System(12) = {'Standby Imperfect (p = 0.9) (Symbolic)'};

disp('Computing time comparison between the matrix-analytic and symbolic processing methods');
disp('t1 : time to generate R(t) expression of the system');
disp('t2 : time to calculate 20 points of the system R(t)');
disp('t3 : time to calculate 20 points of the system h(t)');
disp('t4 : time to calculate the system MTTF');
t1 = Table(:,1);
t2 = Table(:,2);
t3 = Table(:,3);
t4 = Table(:,4);
MTTF = Table(:,5);
Table5 = table(t1,t2,t3,t4,MTTF,'RowNames',System)