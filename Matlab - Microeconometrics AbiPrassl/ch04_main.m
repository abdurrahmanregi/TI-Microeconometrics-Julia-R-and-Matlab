% ch04
clc;
clear;

%% 4.1 Binary Logit

% 4.1.1 Simulating the model
rng(1)
N       = 10000;
Beta    = [0.5, 0.5]';
income  = randn(N,1);
x       = [ones(N,1) income];

[y, utility]    = SimulateBinaryLogit(x, Beta);

% 4.1.2 Estimating the model
options = optimset('Algorithm', 'sqp', ...
    'Display','iter');

Beta_init = rand(2,1);
lb = [-10;-10];
ub = [10;10];
[EstBetaML, LL, exitflag] = fmincon(@(parameters)...
    BinaryLogitLL(parameters,y,x),...
    Beta_init,...
    [],[],[],[],lb,ub,[],options)

% 4.1.3 Estimating by simulation (take a bit of times)
R = 1000;
opts2 = optimset('Algorithm','sqp',...
    'DiffMinChange',1e-2);
[EstBetaML, LL, exitflag] = ...
    fmincon(@(parameters)BinaryLogitSimulatedLL...
    (parameters,y,x,R), Beta_init, [],[],[],...
    [],lb,ub,[],opts2)

%% 4.2 Multinomial Logit


%% 4.3 Multinomial Probit