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

    T = [I(n) -M -ones(n) q]
    basis = collect(1:n)
    t = argmin(q)

    basis[t] = 2n+1

    pivot = T[t, :] ./ T[t, 2n + 1]
    T -= T[:, 2n + 1] * pivot'
    T[t, :] = pivot

    entering_ind = t+n
    iters = 0
    ret = 1
    while 2*n+1 in basis && iters < max_iters
        iters += 1
        d = T[:, entering_ind]
        wrong_dir = d .≤ tol
        ratios = map(d, T[:, end]) do di, ri
            di ≤ tol ? Inf : ri / di
        end
        t = argmin(ratios)
        if !all(wrong_dir)
            pivot = T[t, :] ./ T[t, entering_ind]
            T -= T[:, entering_ind] * pivot'
            T[t, :] = pivot
            exiting_ind = basis[t]
            basis[t] = entering_ind
            entering_ind = mod(exiting_ind + n, 2n)
            if entering_ind == 0
                entering_ind = 2n
            end
        else
            ret = 0
            break
        end
    end
    vars = zeros(Float64, 2n+1)
    vars[basis] = T[:, end]
    w = vars[1:n]
    z = vars[n+1:2n]
    return (; w, z, ret)
end
