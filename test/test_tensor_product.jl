using Test: @test, @test_throws, @testset

using TensorProducts: ⊗, OneToOne, tensor_product

using BlockArrays: blockedrange, blockisequal

r0 = OneToOne()
b1 = blockedrange([1, 2])

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

  @test blockisequal(tensor_product(b1, b1), blockedrange([1, 2, 2, 4]))
  @test blockisequal(tensor_product(b1, b1), blockedrange([1, 2, 2, 4]))

  @test ⊗(r0, r0) isa OneToOne
end
