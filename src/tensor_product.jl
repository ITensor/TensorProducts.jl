# This files defines an interface for the tensor product of two axes
# https://en.wikipedia.org/wiki/Tensor_product

⊗() = tensor_product()
⊗(a) = tensor_product(a)
⊗(a1, a2) = tensor_product(a1, a2)  # default
⊗(a1, a2, as...) = ⊗(⊗(a1, a2), as...)   # allow to specialize ⊗(a1, a2) to fusion_product

tensor_product() = OneToOne()
tensor_product(a) = a
tensor_product(a1, a2, as...) = tensor_product(tensor_product(a1, a2), as...)

function tensor_product(a1::AbstractUnitRange, a2::AbstractUnitRange)  # default
  return Base.OneTo(prod(length.((a1, a2))))
end

tensor_product(::OneToOne, ::OneToOne) = OneToOne()
