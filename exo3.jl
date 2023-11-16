using JuMP, GLPK

m = Model(GLPK.Optimizer)

@variable(m, m1 >= 70)
@variable(m, m2 <= 500)
@variable(m, m3 <= 300)
@variable(m, s >= 0)

@objective(m, Max, 4m1 + 5m2 + 6m3)

@constraint(m, stockage, 9m1 + 10m2 + 11m3 <= 9000 + s)
@constraint(m, nettoyage, m1 + m2 + m3 <= 80 * 90 * 100 * 10)

optimize!(m)

println("Solution optimale : ", objective_value(m))
println("valeur de m1 : ", value(m1))
println("valeur de m2 : ", value(m2))
println("valeur de m3 : ", value(m3))
println("valeur de c1 : ", value(stockage))
println("valeur de c2 : ", value(nettoyage))
println("Dual contrainte 1 : ", -dual(stockage))
println("Dual contrainte 2 : ", -dual(nettoyage))
