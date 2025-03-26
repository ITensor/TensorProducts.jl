# This files defines an interface for the tensor product of two axes
# https://en.wikipedia.org/wiki/Tensor_product

# ==================================  misc  ================================================
is_offset_axis(a::AbstractUnitRange) = !isone(first(a))

function require_one_based_axis(a::AbstractUnitRange)
  return is_offset_axis(a) && throw(ArgumentError("Range must be one-based"))
end

# ==============================  tensor product  ==========================================
⊗() = tensor_product()
⊗(a) = tensor_product(a)

# default. No type restriction to allow sectors as input
⊗(a1, a2) = tensor_product(a1, a2)

# allow to specialize ⊗(a1, a2) to fusion_product
⊗(a1, a2, as...) = ⊗(⊗(a1, a2), as...)

tensor_product() = OneToOne()
tensor_product(a) = a
tensor_product(a1, a2, as...) = tensor_product(tensor_product(a1, a2), as...)

# default
function tensor_product(a1::AbstractUnitRange, a2::AbstractUnitRange)
  require_one_based_axis(a1) || require_one_based_axis(a2)
  return Base.OneTo(length(a1) * length(a2))
end

tensor_product(::OneToOne, ::OneToOne) = OneToOne()
