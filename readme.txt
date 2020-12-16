This Folder contains MATLAB Scripts associated with manuscript entitled
'Modeling and Analysis of System Reliability Using Phase-Type Distribution Closure Properties'
by: Abdullah Alkaff (abealkaff@gmail.com)
    Mochamad Nur Qomarudin (mochamadnurq@gmail.com)
submitted to Applied Stochastic Models in Business and Industry (2019)
These scripts are developed using MATLAB 2016a.

MINIMUM REQUIREMENT:
PC Intel Core i3, Memory 4 GB
MATLAB 2013b

CONTENTS:
\lib        : collection of functions
\code_xxx   : scripts associated with Figure xxx and Table xxx in Manuscript
\additional : additional example of modeling and analysis of general system

HOW TO USE:
Most script in these folders are written in, at least, three section: 
INPUT, MAIN PROGRAM, and OUTPUT.
Scripts in \code_xxx are closely related with Manuscript.
In order to get some simple understanding, please open this script:
\additional_example_for_general_system\general_system_reliability_analysis.m

Section INPUT:
A Variable T refers to lifetime of components
Choose one of these distribution: 
    nErlang   : fcn_T_nErlang_matrix
    2-Coxian  : fcn_T_2Coxian_matrix
    mixErlang : fcn_T_2mixErlang_matrix
    2APH      : fcn_T_2APH_Weibull_matrix
    3APH      : fcn_T_3APH_Weibull_matrix
    4APH      : fcn_T_4APH_Weibull_matrix
or you can define PH representation of arbitrary PH distribution.

Here an example to define arbitrary PH distribution as input:
Before defining arbitrary PH, please comment (give % or Ctrl+R) the line associated
with the given PH distribution (Line 10).
Then, write these codes:
% Define lifetime distribution of Component 1
T(1).a = [0.5,0.5];     % Initial probability vector
T(1).A = [-2,1;0,-1];   % State transition matrix
T(1).n = 2;             % PH or matrix order
% Define lifetime distribution of Component 2 (Same with component 1)
T(2).a = [0.5,0.5];     % Initial probability vector
T(2).A = [-2,1;0,-1];   % State transition matrix
T(2).n = 2;             % PH or matrix order
% Define lifetime distribution of Component 3 (Another distribution)
T(3).a = [0.5,0.5,0];              % Initial probability vector
T(3).A = [-2,1,1;0,-1,1;0,0,-3];   % State transition matrix
T(3).n = 3;                        % PH or matrix order
... please add the next component as needed.

Section MAIN PROGRAM: Define General System
Based on the structure of the system, define an algorithm to generate Matrix (PH)
representation of the system using these basic structures:
    Series            : phminsys
    Parallel          : phmaxsys
    K-out-of-N        : phkofnsys
    Standby Perfect   : phaddsys (p = 1)
    Standby Imperfect : phaddsys
The explanation to write the algorithm from the system structure can be read
in Section 5.1.

Section OUTPUT
The script presents two kind of outputs:
    Table of reliability and hazard values, MTTF, and CVTTF of the system
    Figures of reliability and hazard function of the system
Both of them are automatically displayed when the program execution is finished.

If there is any difficulty to use these scripts, 
please feel free to contact: mochamadnurq@gmail.com.
Thank you.