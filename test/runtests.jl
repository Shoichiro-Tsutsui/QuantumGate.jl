using QuantumGate
using Test


@testset "Pauli matrices" begin
    @test σˣ^2 == σ⁰
    @test σʸ^2 == σ⁰
    @test σᶻ^2 == σ⁰
    @test σˣ*σʸ - σʸ*σˣ == 2im*σᶻ
    @test σʸ*σᶻ - σᶻ*σʸ == 2im*σˣ
    @test σᶻ*σˣ - σˣ*σᶻ == 2im*σʸ
end
