clc;
clear;

%% 2.1 Profit Maximization

f = [-143; -60];

A = [1, 1; 110, 30; 120, 210];

b = [75; 4000; 15000];

lb = zeros(2,1);

[crops, obj, exitflag] = linprog(f, A, b, [], ...
    [], lb)

%% 2.2 Utility Maximization

I = 100;
P = [4,7];
G = [15,5];
lb= [0,0];

[consumption, u, exitflag] = ...
    fmincon(@CobbDouglas, ...
    G, P, I, [], [], lb)

opts = optimset('algorithm', 'sqp');
[consumption, u, exitflag] = ...
    fmincon(@CobbDouglas, ...
    G, P, I, [], [], lb, [], [], opts)


%% 2.3 Simulating Economic Models

