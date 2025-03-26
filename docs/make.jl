using TensorProducts: TensorProducts
using Documenter: Documenter, DocMeta, deploydocs, makedocs

DocMeta.setdocmeta!(TensorProducts, :DocTestSetup, :(using TensorProducts); recursive=true)

include("make_index.jl")

makedocs(;
  modules=[TensorProducts],
  authors="ITensor developers <support@itensor.org> and contributors",
  sitename="TensorProducts.jl",
  format=Documenter.HTML(;
    canonical="https://ITensor.github.io/TensorProducts.jl",
    edit_link="main",
    assets=["assets/favicon.ico"],
  ),
  pages=["Home" => "index.md", "Reference" => "reference.md"],
)

deploydocs(;
  repo="github.com/ITensor/TensorProducts.jl", devbranch="main", push_preview=true
)
