using Test: @test, @testset

using TensorProducts: ⊗, OneToOne, tensor_product

using BlockArrays: blockedrange, blockisequal

@testset "tensor_product" begin
  g0 = OneToOne()

  @test tensor_product() isa OneToOne{Bool}
  @test ⊗() isa OneToOne{Bool}

  @test tensor_product(1:2) == 1:2

  @test tensor_product(g0, g0) == g0
  @test tensor_product(1:3, 1:2) == 1:6

  b1 = blockedrange([1, 2])
  @test blockisequal(tensor_product(b1, b1), blockedrange([1, 2, 2, 4]))

  @test tensor_product(1:3, 1:2, 1:2) == 1:12
end
