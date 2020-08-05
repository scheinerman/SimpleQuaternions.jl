import Base: rand, randn
function rand(::Type{SimpleQuaternion{T}}) where T <: Real
    args = (rand(T) for j=1:4)
    return SimpleQuaternion(args...)
end 

"""
`rand(SimpleQuaternion)` returns a quaternion whose four entries 
are uniform [0,1] random values.
"""
rand(::Type{SimpleQuaternion}) = rand(SimpleQuaternion{Float64})

"""
`randn(SimpleQuaternion)` returns a quaternion whose four entries are 
standard normal random values. 
"""
function randn(::Type{SimpleQuaternion{T}}) where T
    args = (randn(T) for j=1:4)
    return SimpleQuaternion(args...)
end

randn(::Type{SimpleQuaternion}) = randn(SimpleQuaternion{Float64})