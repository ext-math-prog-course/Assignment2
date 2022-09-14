# Assignment2

# Instructions

1. Read sections 2.1 and 2.2 of "Linear Complementarity, Linear and Nonlinear
   Programming" by Katta Murty (book linked on Brightspace and below).
2. Implement Lemke's method in `solve_lcp.jl`.
3. Solve the quadratic program specified in `solve_qp.jl` by setting it up as
   an LCP and either using your implementation of Lemke's method or the [Path
   Solver](https://github.com/chkwon/PATHSolver.jl)
4. Upload a pdf to this repository containing your solution to the following:

a) If M is positive semidefinite (x'Mx >= 0 for all x), prove that (M+M')x = 0
b) If z is a solution to LCP(M,q), with M positive semidefinite, prove that z+d
is also a solution if 
    - z + d >= 0
    - M(z+d) + q >= 0
    - q'd = 0
    - (M + M')d = 0

Make sure tests pass for problems (2-3). 

# Murty book
[Linear Complementarity, Linear and Nonlinear
Programming](http://www-personal.umich.edu/~murty/books/linear_complementarity_webbook/lcp-complete.pdf)

# Julia resources

- [Julia Manual](https://docs.julialang.org/en/v1/manual/getting-started/)
- [Julia Package/Environment Guide](https://pkgdocs.julialang.org/v1/)
- [JuMP (JuliaMathematicalProgramming) Documentation](https://jump.dev/JuMP.jl/stable/)
- [Julia workflow tips](https://m3g.github.io/JuliaNotes.jl/stable/workflow/)
- [Julia Academy](https://juliaacademy.com/courses)
- [Algorithms for Optimization book with Julia Examples](https://algorithmsbook.com/optimization/)
