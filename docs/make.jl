using SampleChainsContinuous
using Documenter

DocMeta.setdocmeta!(SampleChainsContinuous, :DocTestSetup, :(using SampleChainsContinuous); recursive=true)

makedocs(;
    modules=[SampleChainsContinuous],
    authors="Chad Scherrer <chad.scherrer@gmail.com> and contributors",
    repo="https://github.com/cscherrer/SampleChainsContinuous.jl/blob/{commit}{path}#{line}",
    sitename="SampleChainsContinuous.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://cscherrer.github.io/SampleChainsContinuous.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/cscherrer/SampleChainsContinuous.jl",
)
