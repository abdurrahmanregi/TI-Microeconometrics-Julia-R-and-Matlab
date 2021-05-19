function u = Utility(x1, x2)
% -----------------------------------------
% PURPOSE: calculate utilit: 2 good CD
%          specification
% -----------------------------------------
% USAGE: u: UtilitySimple(x1,x2)
% where: x1: quantity of q1
%        x2: quantity of q2
% -----------------------------------------
% OUTPUT: u: overall utility
% -----------------------------------------

u = (x1.^0.5) .* (x2.^0.5);

return