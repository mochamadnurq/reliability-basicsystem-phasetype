tMAT = zeros(1,5);
tSYM = zeros(1,5);

% Time Sampling
tmax = 1000;
s    = 20;
t    = linspace(0,tmax,s);

% Parameter of 3-Coxian
lamda1 = 0.0125;
lamda2 = 0.05;
lamda3 = 0.025;

%% Parameter 1
p1 = 0.5;
q1 = 0.5;

%% Parameter 2
p2 = 0.8;
q2 = 0.125;

%% Parameter 3
p3 = 0.4;
q3 = 0.75;

%% Parameter 4
p4 = 0.6;
q4 = 1/3;