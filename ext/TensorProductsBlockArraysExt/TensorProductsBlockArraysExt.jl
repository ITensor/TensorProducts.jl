module TensorProductsBlockArraysExt

using BlockArrays:
  AbstractBlockedUnitRange,
  Block,
  BlockArrays,
  blockaxes,
  blockedrange,
  blocklengths,
  blocks

using TensorProducts: OneToOne, TensorProducts

function TensorProducts.tensor_product(
  a1::AbstractBlockedUnitRange, a2::AbstractBlockedUnitRange
)
  v = Vector{Base.promote_op(*, eltype(a1), eltype(a2))}()
  new_blocklengths =
    mapreduce(vcat, Iterators.product(blocks(a1), blocks(a2)); init=v) do (x, y)
      return length(x) * length(y)
    end
  return blockedrange(new_blocklengths)
end

end
