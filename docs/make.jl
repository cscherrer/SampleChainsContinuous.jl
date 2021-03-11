using SampleChainsPDMP
using Documenter

DocMeta.setdocmeta!(SampleChainsPDMP, :DocTestSetup, :(using SampleChainsPDMP); recursive=true)

makedocs(;
    modules=[SampleChainsPDMP],
    authors="Chad Scherrer <chad.scherrer@gmail.com> and contributors",
    repo="https://github.com/cscherrer/SampleChainsPDMP.jl/blob/{commit}{path}#{line}",
    sitename="SampleChainsPDMP.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://cscherrer.github.io/SampleChainsPDMP.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/cscherrer/SampleChainsPDMP.jl",
)
