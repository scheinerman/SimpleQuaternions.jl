function promote_rule(::Type{SimpleQuaternion{T}},::Type{SimpleQuaternion{S}}) where {S<:Real, T<:Real}
    SimpleQuaternion{promote_type(S,T)}
end
