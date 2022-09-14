using OSQP
using SparseArrays
using LinearAlgebra

@testset "qp_test" begin
    for i in 1:10
        w = 3*randn(2)
        m = OSQP.Model()
        OSQP.setup!(m; P=sparse(I(2)), q=-w, A=sparse([-1. -1; 1 -1; 1 0; 0 1]), l=[-1.5, -1.0, 0, 0], verbose=false, polish=true)
        res = OSQP.solve!(m)
        (; x, λ) = solve_qp(w)
        @test isapprox(x, res.x; atol=1e-5)
        @test isapprox(λ, -res.y[1:2]; atol=1e-5)
    end
end
