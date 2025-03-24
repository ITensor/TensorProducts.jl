using Test: @test, @testset

using BlockArrays: Block, BlockedOneTo, BlockRange, blockaxes, blockedrange, blockisequal

using TensorProducts: dag, dual, flip, isdual, OneToOne

@testset "OneToOne" begin
  a0 = OneToOne()
  @test a0 isa OneToOne{Bool}
  @test a0 isa AbstractUnitRange{Bool}
  @test eltype(a0) == Bool
  @test length(a0) == 1

  @test blockaxes(OneToOne()) == (BlockRange(OneToOne()),)
end

@testset "dual" begin
  a0 = OneToOne()
  @test !isdual(a0)
  @test dual(a0) isa OneToOne

  a = 1:3
  ad = dual(a)
  af = flip(a)
  @test !isdual(a)
  @test !isdual(ad)
  @test !isdual(dag(a))
  @test !isdual(af)
  @test ad isa UnitRange
  @test af isa UnitRange
  @test blockisequal(ad, a)
  @test blockisequal(af, a)

  a = blockedrange([2, 3])
  ad = dual(a)
  af = flip(a)
  @test !isdual(a)
  @test !isdual(ad)
  @test ad isa BlockedOneTo
  @test af isa BlockedOneTo
  @test blockisequal(ad, a)
  @test blockisequal(af, a)
end

@testset "dag" begin
  elt = ComplexF64
  r = blockedrange([2, 3])
  a = zeros(elt, r, dual(r))
  a[Block(1, 1)] = randn(elt, 2, 2)
  a[Block(2, 2)] = randn(elt, 3, 3)
  @test isdual.(axes(a)) == (false, false)
  ad = dag(a)
  @test Array(ad) == conj(Array(a))
  @test isdual.(axes(ad)) == (false, false)
end
