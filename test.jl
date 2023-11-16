using JuMP, GLPK

m=Model(GLPK.Optimizer)

@variable(m,x[1:8],Bin)

@objective(m,Min,sum(x[i] for i=1:8))

@constraint(m,zone1,x[1]+x[7]>=1)
@constraint(m,zone2,x[2]+x[6]+x[7]>=1)
@constraint(m,zone3,x[3]+x[8]>=1)
@constraint(m,zone4,x[4]+x[5]+x[8]>=1)
@constraint(m,zone5,x[4]+x[5]+x[7]>=1)
@constraint(m,zone6,x[2]+x[6]+x[8]>=1)
@constraint(m,zone7,x[1]+x[2]+x[5]+x[7]>=1)
@constraint(m,zone8,x[3]+x[4]+x[6]+x[8]>=1)

optimize!(m)

println(objective_value(m))
println(value(x[1]))
println(value(x[2]))
println(value(x[3]))
println(value(x[4]))
println(value(x[5]))
println(value(x[6]))
println(value(x[7]))
println(value(x[8]))
println(value(zone1))
println(value(zone2))
println(value(zone3))
println(value(zone4))
println(value(zone5))
println(value(zone6))
println(value(zone7))
println(value(zone8))