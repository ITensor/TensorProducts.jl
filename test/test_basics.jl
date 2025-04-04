using Test: @test, @testset

using BlockArrays: BlockRange, blockaxes

using TensorProducts: OneToOne

@testset "OneToOne" begin
  a0 = OneToOne()
  @test a0 isa OneToOne{Int}
  @test a0 isa AbstractUnitRange{Int}
  @test eltype(a0) == Int
  @test length(a0) == 1

  @test blockaxes(OneToOne()) == (BlockRange(OneToOne()),)
  @test Base.to_shape(OneToOne()) isa Int64
  @test Base.to_shape(OneToOne()) == 1
end
