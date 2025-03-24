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

# BlockArrays default crashes for OneToOne{Bool}
BlockArrays.blockaxes(a::OneToOne) = (Block.(a),)

function fuse_blocklengths(x::Integer, y::Integer)
  # return blocked unit range to keep non-abelian interface
  return blockedrange([x * y])
end

function TensorProducts.tensor_product(
  a1::AbstractBlockedUnitRange, a2::AbstractBlockedUnitRange
)
  nested = map(Iterators.flatten((Iterators.product(blocks(a1), blocks(a2)),))) do it
    return mapreduce(length, fuse_blocklengths, it)
  end
  new_blocklengths = mapreduce(blocklengths, vcat, nested)
  return blockedrange(new_blocklengths)
end

end
