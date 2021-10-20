module QuantumGate

    export σ⁰, σˣ, σʸ, σᶻ, P⁰, P¹, Had, Smat, Tmat, Rˣmat, Rʸmat, Rᶻmat
    include("pauli_matrices.jl")

    export ⊗
    include("kronecker_product.jl")

    export Xgate, Ygate, Zgate, Hadamardgate, Sgate, Tgate, Rˣgate, Rʸgate, Rᶻgate
    export controlled_Ugate, CNOTgate, SWAPgate
    include("gates.jl")

end
