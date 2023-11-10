using JuMP
using GLPK

m = Model(GLPK.Optimizer)

@variable(m, x1 >= 0)
@variable(m, x2 >= 0)

@constraint(m,cons1, (15/2)x1 + 4x2 <= 20)
@constraint(m,cons2, 3x1 + 10x2 >= 15)

@objective(m, Max, 15x1 - 20x2)

optimize!(m)

println("Solution optimale : ", -objective_value(m))
println("Dual contrainte 1 : ", -dual(cons1))
println("Dual contrainte 2 : ", -dual(cons2))
