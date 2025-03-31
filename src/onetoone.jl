# This files defines the struct OneToOne
# OneToOne represents the range `1:1` or `Base.OneTo(1)`.

struct OneToOne{T} <: AbstractUnitRange{T} end
OneToOne() = OneToOne{Int}()
Base.first(a::OneToOne) = one(eltype(a))
Base.last(a::OneToOne) = one(eltype(a))

Base.to_shape(::OneToOne) = 1

# extend Base.OneTo behavior to OneToOne
function Base.reshape(
  parent::AbstractArray,
  shp::Tuple{Union{Integer,Base.OneTo,OneToOne},Vararg{Union{Integer,Base.OneTo,OneToOne}}},
)
  return reshape(parent, Base.to_shape(shp))
end
