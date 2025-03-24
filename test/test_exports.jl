using Test: @test, @testset

using TensorProducts: TensorProducts

@testset "Test exports" begin
  exports = [:⊗, :TensorProducts, :OneToOne, :tensor_product]
  @test issetequal(names(TensorProducts), exports)
end
