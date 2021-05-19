function jumpMLE(Y,X,startval)
myMLE = Model(solver=IpoptSolver(tol=1e-8))
@variable(myMLE, b[i=1:size(X,2)], start = startval[i])
@variable(myMLE, s >=0.0, start = startval[end])
# Write your objective function
@NLobjective(myMLE, Max, (n/2)*log(1/(2*pi*s^2))-
sum((Y[i]-sum(X[i,k]*b[k], k=1:size(X,2)))^2, i=1:size(X,1))/(2s^2))
# Solve the objective function
status = solve(myMLE)
# Save estimates
bOpt = getValue(b[:])
sOpt = getValue(s)
return bOpt,sOpt
end
