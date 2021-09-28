using QuantumGate
using Documenter

DocMeta.setdocmeta!(QuantumGate, :DocTestSetup, :(using QuantumGate); recursive=true)

makedocs(;
    modules=[QuantumGate],
    authors="Shoichiro Tsutsui",
    repo="https://github.com/Shoichiro-Tsutsui/QuantumGate.jl/blob/{commit}{path}#{line}",
    sitename="QuantumGate.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Shoichiro-Tsutsui.github.io/QuantumGate.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Shoichiro-Tsutsui/QuantumGate.jl",
)
