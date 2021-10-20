using LinearAlgebra
using QuantumGate

function single_qubit_gate(cite::Int, N::Int, Operator)
    A = σ⁰

    if cite == 1
        A = Operator
    end

    for i in 2:N
        if cite == i
            A = A ⊗ Operator
        else
            A = A ⊗ σ⁰
        end
    end

    return A
end


function Xgate(cite::Int, N::Int)
    single_qubit_gate(cite, N, σˣ)
end

function Ygate(cite::Int, N::Int)
    single_qubit_gate(cite, N, σʸ)
end

function Zgate(cite::Int, N::Int)
    single_qubit_gate(cite, N, σᶻ)
end

function Hadamardgate(cite::Int, N::Int)
    single_qubit_gate(cite, N, Had)
end

function Sgate(cite::Int, N::Int)
    single_qubit_gate(cite, N, Smat)
end

function Tgate(cite::Int, N::Int)
    single_qubit_gate(cite, N, Tmat)
end

function Rˣgate(cite::Int, N::Int, θ::Float64)
    single_qubit_gate(cite, N, Rˣmat(θ))
end

function Rʸgate(cite::Int, N::Int, θ::Float64)
    single_qubit_gate(cite, N, Rʸmat(θ))
end

function Rᶻgate(cite::Int, N::Int, θ::Float64)
    single_qubit_gate(cite, N, Rᶻmat(θ))
end


function CNOTgate(control, target, N)
    A = single_qubit_gate(control, N, P₀)

    if control == 1
        B = P₁
    elseif target == 1
        B = σˣ
    else
        B = σ⁰
    end

    for i in 2:N
        if control == i
            B = B ⊗ P₁
        elseif target == i
            B = B ⊗ σˣ
        else
            B = B ⊗ σ⁰
        end
    end
    return A + B
end
