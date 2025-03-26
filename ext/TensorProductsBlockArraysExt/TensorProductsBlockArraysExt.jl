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
  new_blocklengths = mapreduce(vcat, Iterators.product(blocks(a1), blocks(a2))) do (x, y)
    return length(x) * length(y)
  end
  return blockedrange(new_blocklengths)
end

end
