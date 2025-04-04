# This files defines the struct OneToOne
# OneToOne represents the range `1:1` or `Base.OneTo(1)`.

struct OneToOne{T} <: AbstractUnitRange{T} end
OneToOne() = OneToOne{Int}()
Base.first(a::OneToOne) = one(eltype(a))
Base.last(a::OneToOne) = one(eltype(a))

# impose Int64 to keep Base.to_shape(::Base.OneTo) convention
Base.to_shape(::OneToOne) = 1
