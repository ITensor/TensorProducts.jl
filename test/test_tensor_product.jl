using Test: @test, @test_throws, @testset

using TensorProducts: ⊗, OneToOne, tensor_product

using BlockArrays: blockedrange, blockisequal

r0 = OneToOne()
b0 = blockedrange(Int[])
b1 = blockedrange([1])
b2 = blockedrange([1, 2])

@testset "tensor_product" begin
  @test tensor_product() isa OneToOne
  @test tensor_product(1:2) == 1:2
  @test tensor_product(1:2, 1:3) == 1:6
  @test tensor_product(1:2, 1:3, 1:4) == 1:24

  @test_throws ArgumentError tensor_product(2:3, 1:2)
  @test_throws ArgumentError tensor_product(1:3, 2:2)
  @test_throws ArgumentError tensor_product(2:3, 2:2)

  @test tensor_product(r0, r0) isa OneToOne
  @test blockisequal(tensor_product(b1, r0), b1)
  @test blockisequal(tensor_product(r0, b1), b1)

  @test blockisequal(tensor_product(b0, b0), b0)
  @test blockisequal(tensor_product(b0, b1), b0)
  @test blockisequal(tensor_product(b1, b0), b0)
  @test blockisequal(tensor_product(b1, b1), b1)
  @test blockisequal(tensor_product(b1, b2), b2)
  @test blockisequal(tensor_product(b2, b1), b2)
  @test blockisequal(tensor_product(b2, b2), blockedrange([1, 2, 2, 4]))

  @test ⊗(r0, r0) isa OneToOne
end
