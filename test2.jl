using JuMP, GLPK

m=Model(GLPK.Optimizer)

@variable(m,L1>=0)
@variable(m,L2>=0)

@objective(m,Max,2L1+3L2)

@constraint(m,M1,5L1+3L2<=90)
@constraint(m,M2,4L1+2L2<=120)
@constraint(m,M3,L1+L2<=80)

optimize!(m)

println("solution optimale : ",-dual(objective_value(m)))
println("Value L1 : ", value(L1))
println("Value L2 : ", value(L2))
println("Value M1 : ", value(M1))
println("Value M2 : ", value(M2))
println("Value M3 : ", value(M3))
println("Dual M1 : ", -dual(M1))
println("Dual M2 : ", -dual(M2))
println("Dual M3 : ", -dual(M3))