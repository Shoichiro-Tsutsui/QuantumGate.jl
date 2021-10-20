"""
    ⊗(A, B)

Compute the kronecker product, ``A\\otimes B``.

# Examples
```julia-repl
julia> [1 0; 0 1]⊗[1 0; 0 -1]
4×4 Array{Int64,2}:
 1   0  0   0
 0  -1  0   0
 0   0  1   0
 0   0  0  -1
```
"""
⊗(A, B) = kron(A, B)


"""
    ⊗(A, B, C...)

Compute the kronecker product, ``A\\otimes B\\otimes C \\cdots``.
"""
function ⊗(A, B, C...)
    A = kron(A, B)
    for Ci in C
        A = kron(A, Ci)
    end
    return A
end
