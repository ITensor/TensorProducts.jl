using Test: @test, @testset

using TensorProducts: OneToOne

@testset "OneToOne" begin
  a0 = OneToOne()
  @test a0 isa OneToOne{Bool}
  @test a0 isa AbstractUnitRange{Bool}
  @test eltype(a0) == Bool
  @test length(a0) == 1
end

using BlockArrays: BlockRange, blockaxes

@testset "BlockArray interface OneToOne" begin
  @test blockaxes(OneToOne()) == (BlockRange(OneToOne()),)
end
