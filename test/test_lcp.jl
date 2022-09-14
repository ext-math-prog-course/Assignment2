using LinearAlgebra

function test_solve(M, q, w, z, ret)
    @test ret == 1
    @test norm(q - (w - M*z)) <= 1e-4
    @test all(w .> -1e-6)
    @test all(z .> -1e-6)
    @test all((w .* z) .< 1e-6)
end

@testset "lcp_test" begin
    n = 25
    for i in 1:10
        M = randn(n,n)
        M = M'*M
        q = randn(n)
        (; w, z, ret) = solve_lcp(M,q)
        test_solve(M, q, w, z, ret)
    end
end
