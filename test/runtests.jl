using QuantumGate
using Test
using SparseArrays

@testset "Pauli matrices" begin
    @test σˣ^2 == σ⁰
    @test σʸ^2 == σ⁰
    @test σᶻ^2 == σ⁰
    @test σˣ*σʸ - σʸ*σˣ == 2im*σᶻ
    @test σʸ*σᶻ - σᶻ*σʸ == 2im*σˣ
    @test σᶻ*σˣ - σˣ*σᶻ == 2im*σʸ
    @test σ⁰ == P⁰ + P¹
    @test σᶻ == P⁰ - P¹
end

@testset "Kronecker product" begin
    A = [1 0; 0 1]
    B = [1 0; 0 -1]
    C = [1 0 0 0; 0 -1 0 0; 0 0 1 0; 0 0 0 -1]
    @test A⊗B == C
    @test ⊗(A,A,B,B) == A⊗A⊗B⊗B

    A, B, C, D = rand(2, 2), rand(2, 2), rand(2, 2), rand(2, 2)
    @test A⊗(B+C) ≈ A⊗B + A⊗C
    @test (B+C)⊗A ≈ B⊗A + C⊗A
    @test (A⊗B)⊗C ≈ A⊗(B⊗C)
    @test (A⊗B)*(C⊗D) ≈ (A*C)⊗(B*D)
end

@testset "Circuit identities" begin
    @test Had * σˣ * Had ≈ σᶻ
    @test Had * σʸ * Had ≈ -σʸ
    @test Had * σᶻ * Had ≈ σˣ
end

@testset "Zgate" begin
    @test σᶻ ⊗ σ⁰ == Zgate(1, 2)
    @test σ⁰ ⊗ σᶻ == Zgate(2, 2)
    @test σᶻ ⊗ σ⁰ ⊗ σ⁰ == Zgate(1, 3)
    @test σ⁰ ⊗ σᶻ ⊗ σ⁰ ⊗ σ⁰ == Zgate(2, 4)
end

@testset "CNOTgate" begin
    @test CNOTgate(1, 2, 2) == sparse([
                                    1.0+0.0im 0.0 0.0 0.0;
                                    0.0 1.0 0.0 0.0;
                                    0.0 0.0 0.0 1.0;
                                    0.0 0.0 1.0 0.0
                                ])
    @test CNOTgate(1, 2, 2) == P⁰ ⊗ σ⁰ + P¹ ⊗ σˣ
    @test CNOTgate(1, 2, 3) == P⁰ ⊗ σ⁰ ⊗ σ⁰ + P¹ ⊗ σˣ ⊗ σ⁰
    @test CNOTgate(1, 3, 3) == P⁰ ⊗ σ⁰ ⊗ σ⁰ + P¹ ⊗ σ⁰ ⊗ σˣ
    @test CNOTgate(3, 1, 3) == σ⁰ ⊗ σ⁰ ⊗ P⁰ + σˣ ⊗ σ⁰ ⊗ P¹
end

@testset "SWAP gate" begin
    @test SWAPgate(1, 2, 2) == sparse([
                                    1.0+0.0im 0.0 0.0 0.0;
                                    0.0 0.0 1.0 0.0;
                                    0.0 1.0 0.0 0.0;
                                    0.0 0.0 0.0 1.0
                                ])

    @test SWAPgate(1, 2, 2) == SWAPgate(2, 1, 2)
    @test SWAPgate(1, 3, 3) == SWAPgate(3, 1, 3)
end
