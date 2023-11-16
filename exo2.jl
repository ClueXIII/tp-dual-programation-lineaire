using JuMP, GLPK

# Create a new model
model = Model(GLPK.Optimizer)

# Define the variables
@variable(model, x1 >= 0)
@variable(model, x2 >= 0)
@variable(model, y1 >= 0) # nombre d'heure de location de machine de pressage GLUNT


# Define the objective function
@objective(model, Max, 1000x1 + 1200x2 + 320y1)

# Define the constraints
@constraint(model,cadium, 2000x1 <= 1000000) #C
@constraint(model,nickel, 4000x1 + 3000x2 <= 3000000) #N
@constraint(model,press, 2x1 + 3x2 <= (2400-y1))#P

# Solve the model
optimize!(model)

# Print the optimal solution and objective value
println("Optimal Solution:")
println("x1 = ", value(x1), " mille EVERLAST")
println("x2 = ", value(x2), " mille XEROS")
println("y = ", value(y1), " nbr d'heure de location de machine de pressage GLUNT")
println("Objective Value: ", objective_value(model))

println("Values") # Valeurs des contraintes
println("C = ", value(cadium))
println("N = ", value(nickel))
println("P = ", value(press)) 

println("Duals") # les duals sont les prix marginaux
println("C = ", -dual(cadium))
println("N = ", -dual(nickel))
println("P = ", -dual(press))

# Voir correction pour situation 2