# Uncomment these lines if using the PATHSolver, and be sure to follow the
# instructions on the PATHSolver.jl github to correctly set the PATH 
# license string.

#using PATHSolver
#PATHSolver.c_api_License_SetString("<LICENSE STRING>")

""" 
Solve following QP by converting to an LCP and solving using your lcp solver OR the Path Solver 
(https://github.com/chkwon/PATHSolver.jl)

min     0.5 * (x - w)'*(x-w)
x ∈ ℝ²
s.t.    x₁ ≥ 0
        x₂ ≥ 0
        x₁ + x₂ ≤ 1.5
        x₂ ≤ x₁ + 1

return the LCP corresponding to this QP

where x is the optimal solution, and λ is the vector of lagrange multipliers 
associated with the solution x.
"""
function solve_qp(w)
    x = -ones(2) # todo: replace this with your solution
    λ = -ones(2) # same here
    return (; x, λ)
end
