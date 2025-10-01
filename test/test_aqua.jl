using TensorProducts: TensorProducts
using Aqua: Aqua
using Test: @testset

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(TensorProducts)
end
