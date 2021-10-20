using SparseArrays

"""
    σ⁰

The 2×2 unit matrix.

# Examples
```julia-repl
julia> σ⁰
2×2 SparseMatrixCSC{Complex{Float64},Int64} with 2 stored entries:
 [1, 1]  =  1.0+0.0im
 [2, 2]  =  1.0+0.0im
```
"""
const σ⁰ = sparse([1.0+0.0im 0.0; 0.0 1.0+0.0im])

"""
    σˣ

``x``-component of the Pauli matrix, ``\\sigma^x``.

# Examples
```julia-repl
julia> σˣ
2×2 SparseMatrixCSC{Complex{Float64},Int64} with 2 stored entries:
  [2, 1]  =  1.0+0.0im
  [1, 2]  =  1.0+0.0im
```
"""
const σˣ = sparse([0.0 1.0+0.0im; 1.0+0.0im 0.0])

"""
    σʸ

``y``-component of the Pauli matrix, ``\\sigma^y``.

# Examples
```julia-repl
julia> σʸ
2×2 SparseMatrixCSC{Complex{Float64},Int64} with 2 stored entries:
  [2, 1]  =  0.0+1.0im
  [1, 2]  =  -0.0-1.0im
```
"""
const σʸ = sparse([0.0 -1.0im; 1.0im 0.0])

"""
    σᶻ

``z``-component of the Pauli matrix, ``\\sigma^z``.

# Examples
```julia-repl
julia> σᶻ
2×2 SparseMatrixCSC{Complex{Float64},Int64} with 2 stored entries:
  [1, 1]  =  1.0+0.0im
  [2, 2]  =  -1.0+0.0im
```
"""
const σᶻ = sparse([1.0+0.0im 0.0; 0.0 -1.0+0.0im])

const P⁰ = sparse([1.0+0.0im 0.0; 0.0 0.0])

const P¹ = sparse([0.0 0.0; 0.0 1.0+0.0im])

const Had = sparse([1.0+0.0im 1.0; 1.0 -1.0])/sqrt(2)

const Smat = sparse([1.0+0.0im 0.0; 0.0 1.0im])

const Tmat = sparse([1.0+0.0im 0.0; 0.0 exp(1.0im*π/4)])

function Rˣmat(θ)
    sparse([cos(θ/2) -1.0im*sin(θ/2); -1.0im*sin(θ/2) cos(θ/2)])
end

function Rʸmat(θ)
    sparse([cos(θ/2)+0.0im -sin(θ/2); sin(θ/2) cos(θ/2)])
end

function Rᶻmat(θ)
    sparse([exp(-1.0im*θ/2) 0.0; 0.0 exp(1.0im*θ/2)])
end
