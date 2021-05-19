% ch03_main
clear;
clc;

cd 'C:\Users\Regi Kusumaatmadja\Dropbox\TI Microeconometrics Julia, R and Matlab\Matlab - Microeconometrics AbiPrassl'

DataIn = dlmread('auto.csv');
y = DataIn(:,1);
X = DataIn(:,2:3);
X = [X, ones(length(X),1)];

%% 3.1 Maximum Likelihood
lb = [-1000, -1000, -1000, 0];
ub = [1000, 1000, 1000, 100];

theta0 = [0,0,0,1];

opt = optimset('TolFun',1E-10,'TolX',1E-10, ...
                'MaxFunEvals',1000,'Algorithm','sqp');

fmincon(@(theta)NormalML(theta, y, X), theta0, ...
    [],[],[],[],lb,ub,[],opt)

% Add options in the optimset to plot
opt = optimset('TolFun',1E-10,'TolX',1E-10, ...
                'MaxFunEvals',1000,'Algorithm','sqp', ...
                'PlotFcns','optimplotfval', ...
                'Display','iter');
            
fmincon(@(theta)NormalML(theta, y, X), theta0, ...
    [],[],[],[],lb,ub,[],opt)

%% 3.2 Generalized Method of Moments

X = [ones(length(X),1) DataIn(:,2:3)];
y = DataIn(:,1);
[Beta, Q] = fminsearch(@(B)GMMObjective(B,y,X),...
            [10,0,0]',optimset('TolX',1E-9))