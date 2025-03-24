module TensorProducts

export ⊗, OneToOne, dag, dual, flip, isdual, tensor_product

include("onetoone.jl")
include("dual.jl")
include("tensor_product.jl")

end
