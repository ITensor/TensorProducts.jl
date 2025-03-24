# This files defines an interface for the tensor product of two axes
# https://en.wikipedia.org/wiki/Tensor_product

⊗() = tensor_product()
⊗(a) = tensor_product(a)

# default. No type restriction to allow sectors as input
⊗(a1, a2) = tensor_product(a1, a2)

# allow to specialize ⊗(a1, a2) to fusion_product
⊗(a1, a2, as...) = ⊗(⊗(a1, a2), as...)

tensor_product() = OneToOne()
tensor_product(a::AbstractUnitRange) = a
tensor_product(a1, a2, as...) = tensor_product(tensor_product(a1, a2), as...)

# default
function tensor_product(a1::AbstractUnitRange, a2::AbstractUnitRange)
  !(isone(first(a1)) && isone(first(a2))) &&
    throw(ArgumentError("Ranges must be one-based"))
  return Base.OneTo(prod(length.((a1, a2))))
end

tensor_product(::OneToOne, ::OneToOne) = OneToOne()
