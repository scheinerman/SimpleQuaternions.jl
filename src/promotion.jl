import Base:promote_rule

function promote_rule(::Type{SimpleQuaternion{T}},::Type{SimpleQuaternion{S}}) where {S<:Real, T<:Real}
    SimpleQuaternion{promote_type(S,T)}
end




# promote_rule(::Type{Rational{T}}, ::Type{S}) where {T<:Integer,S<:Integer} = Rational{promote_type(T,S)}
# promote_rule(::Type{Rational{T}}, ::Type{Rational{S}}) where {T<:Integer,S<:Integer} = Rational{promote_type(T,S)}
# promote_rule(::Type{Rational{T}}, ::Type{S}) where {T<:Integer,S<:AbstractFloat} = promote_type(T,S)
