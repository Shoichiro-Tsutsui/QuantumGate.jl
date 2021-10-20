using QuantumGate
using LinearAlgebra

# 初期状態
# Notation: |0> = [1, 0], |1> = [0, 1]
#
firstbit = [1; 0]
ψ = [1; 0]
ket = firstbit ⊗ ψ


# アダマールテストでHadを測定する回路
res = Hadamardgate(1, 2)*controlled_Ugate(1, 2, 2, Had)*Hadamardgate(1, 2)*ket


# 1つ目のqubitが0である確率は
# p = (1 + Re<ψ|H|ψ>)/2
# if |ψ> = |0>, p = (1 + 1/√2)/2
measured = (P⁰ ⊗ σ⁰) * res

dot(measured, measured)
(1 + 1/sqrt(2))/2

# 測定後の状態はHの固有状態である。
Had * measured[1:2] ≈ measured[1:2]



# 1つ目のqubitが1である確率は
# p = (1 - Re<ψ|H|ψ>)/2
# if |ψ> = |0>, p = (1 - 1/√2)/2
measured = (P¹ ⊗ σ⁰) * res

dot(measured, measured)
(1 - 1/sqrt(2))/2

# 測定後の状態はHの固有状態である。
Had * measured[3:4] ≈ -measured[3:4]
