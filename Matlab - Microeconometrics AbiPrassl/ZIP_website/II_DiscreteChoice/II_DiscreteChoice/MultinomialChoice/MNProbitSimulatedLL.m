function LL = MNProbitSimulatedLL(parameters, y, x, R)

betavec         = parameters(1:end-1);
rho             = parameters(end);

omega           = [1, rho; rho, 1];

rng(1);

N               = size(y, 1);
J               = max(y);

Simulated_y     = NaN(N, R);
SimulatedProb   = NaN(N, J);

for count = 1:R
    Simulated_y(:, count)       = SimulateMNProbit(x, betavec, omega);
end

for count = 1:J
    SimulatedProb(:, count)     = mean(Simulated_y == count, 2);
    MyIndex(:, count)     = (y == count);
end

ll_i            = sum(MyIndex .* log(SimulatedProb), 2);
LL              = -sum(ll_i);

return