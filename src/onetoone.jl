# This files defines the struct OneToOne
# OneToOne represents the range `1:1` or `Base.OneTo(1)`.

struct OneToOne{T} <: AbstractUnitRange{T} end
OneToOne() = OneToOne{Int}()
Base.first(a::OneToOne) = one(eltype(a))
Base.last(a::OneToOne) = one(eltype(a))
