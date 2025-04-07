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
  new_blocklengths = vec(
    map(splat(*), Iterators.product(blocklengths(a1), blocklengths(a2)))
  )
  return blockedrange(new_blocklengths)
end

end
