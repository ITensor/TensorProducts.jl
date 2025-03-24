# This files defines an interface for the tensor product of two axes
# https://en.wikipedia.org/wiki/Tensor_product

⊗(args...) = tensor_product(args...)

tensor_product() = OneToOne()

tensor_product(a1::AbstractUnitRange) = a1

function tensor_product(a1::AbstractUnitRange, a2::AbstractUnitRange)
  return Base.OneTo(prod(length.((a1, a2))))
end  # default

tensor_product(a1, a2, as...) = tensor_product(a1, tensor_product(a2, as...))   # no type constraint to accept AbstractSector later
