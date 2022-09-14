"""
Solve

    LCP(M, q): 
        find w ∈ ℝⁿ, z ∈ ℝⁿ
        s.t.    w - Mz = q
                w ≥ 0
                z ≥ 0
                wᵢ⋅zᵢ = 0, i ∈ {1,...,n}

using Lemke's method.

Returns named tuple (; w, z, ret)
where ret = 
    {   -1  :   failure
        0   :   ray termination
        1   :   success  }
    
It is assumed that the vector q is nondegenerate.
"""
function solve_lcp(M, q; max_iters=50, tol=1e-6)
    n = length(q)
    if size(M) != (n,n)
        w = q
        z = zeros(Float64, n)
        ret = -1
        return (; w, z, ret)
    end
    if all(q .> -tol)
        z = zeros(Float64, n)
        w = q
        ret = 1
        return (; w, z, ret)
    end

    # TODO:
    # Replace the following with actual solution
    z = -ones(n)
    w = -ones(n) 
    ret = 0

    return (; w, z, ret)
end
