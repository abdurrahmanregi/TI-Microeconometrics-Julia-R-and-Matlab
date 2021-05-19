# declare packages that you will use (pretty similar to LaTeX preamble)

# import Pkg

# Pkg.add("JuMP")

# Pkg.add("Ipopt")

using JuMP, Ipopt

# compile functions you will be using later

include("datagen.jl")

include("jumpMLE.jl")

# evaluate the functions referenced above in the -include- statements.
# -@time- is equivalent to tic/toc in Matlab
@time X,Y,bAns,sigAns,n = datagen()
@time bOpt,sOpt = jumpMLE(Y,X,[bAns,sigAns])
