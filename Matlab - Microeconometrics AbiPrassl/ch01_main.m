% ch 01
clc;
clear;

cd 'C:\Users\Regi Kusumaatmadja\Dropbox\TI Microeconometrics Julia, R and Matlab\Matlab - Microeconometrics AbiPrassl'

DataIn = dlmread('auto.csv');
y = DataIn(:,1);
X = DataIn(:,2:3);
size(X)
% X = [X, ones(74,1)];
X = [X, ones(length(X),1)];

XX = X'*X;
Xy = X'*y;
BetaHat = inv(XX)*Xy;
BetaHat;

[OLS_Beta, OLS_se] = OLS(y,X);
[OLS_Beta, OLS_se];

% 1.3. A Simple Utility Function

x1 = [1:10]';
x2 = 5;
Utility(x1,x2);

[x1, x2] = meshgrid([0:.1:3], [0:.1:3]);
u = Utility(x1,x2);
surfc(x1,x2,u)
