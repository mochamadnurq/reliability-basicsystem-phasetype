clear all

% Calculate Matrix Approach
system_series_matrix;
system_3outof4_matrix;
system_2outof4_matrix;
system_parallel_matrix;
system_standby_matrix;
system_standby_imperfect_matrix;

% Calculate Scalar Symbolic Approach
system_series_symbolic;
system_3outof4_symbolic;
system_2outof4_symbolic;
system_parallel_symbolic;
system_standby_symbolic;
system_standby_imperfect_symbolic;

% Plot R(t) and h(t) of the systems
fig_rt_basic_system;
fig_ht_basic_system;

% Table of Computing Time
list_time_mttf;