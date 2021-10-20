module QuantumGate

    export σ⁰, σˣ, σʸ, σᶻ, P₀, P₁, Had, Smat, Tmat, Rˣmat, Rʸmat, Rᶻmat
    include("pauli_matrices.jl")

    export ⊗
    include("kronecker_product.jl")

    export Xgate, Ygate, Zgate, Hadamardgate, Sgate, Tgate, Rˣgate, Rʸgate, Rᶻgate
    export CNOTgate
    include("gates.jl")

end
