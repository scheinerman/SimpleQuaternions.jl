module SimpleQuaternions

using LinearAlgebra

export SimpleQuaternion, jm, km, get_parts

import Base: (+), (-), (*), (/), (//), (==), inv, string, show, adjoint, conj
import Base: real, isreal, zero, one
import LinearAlgebra: norm
export norm


struct SimpleQuaternion{T} <: Number
    a::T 
    b::T
    c::T 
    d::T 
    function SimpleQuaternion(x::Real=0, y::Real=0, z::Real=0, w::Real=0)
        (aa,bb,cc,dd) = promote(x,y,z,w)
        T = typeof(aa)
        new{T}(aa,bb,cc,dd)
    end 
end

"""
`get_parts(x::SimpleQuaternion)` returns the tuple `(a,b,c,d)` that are 
real and various imaginary get_parts of `x`. Specifically, 
`x == a + b*im + c*jm + d*km`.
"""
get_parts(x::SimpleQuaternion) = (x.a,x.b,x.c,x.d)

"""
`SimpleQuaternion` creates a quaternion number. The basic constructor 
is `SimpleQuaternion(a,b,c,d)` which is equivalent to 
`a + b*im + c*jm + d*km`.

`SimpleQuaternion(x::Real)` yields `x + 0*im + 0*jm + 0*km`.

If `z` is the `Complex` number `a+b*im` then `SimpleQuaternion(z)`
yields `a + b*im + 0*jm + 0*km`.
"""
SimpleQuaternion(z::Complex) = SimpleQuaternion(real(z),imag(z),0,0)


function SimpleQuaternion{T}(a::Real=0,b::Real=0,c::Real=0,d::Real=0) where T<:Real
    (x,aa,bb,cc,dd) = promote(one(T),a,b,c,d)
    SimpleQuaternion(aa,bb,cc,dd)
end 

"""
`jm` is the quaternion unit *j*.
"""
jm = SimpleQuaternion(false,false,true,false)

"""
`km` is the quaternion unit *k*.
"""
km = SimpleQuaternion(false,false,false,true)

function (==)(x::SimpleQuaternion,y::SimpleQuaternion)
    get_parts(x) == get_parts(y)
end

"""
`real(x::SimpleQuaternion)` returns the real part of `x`.
"""
real(x::SimpleQuaternion) = x.a

"""
`isreal(x::SimpleQuaternion)` returns `true` exactly when `x` is a real 
number (all complex get_parts are zero).
"""
isreal(x::SimpleQuaternion) = x == x.a 

(==)(x::SimpleQuaternion, y::Number) = x == SimpleQuaternion(y)
(==)(x::Number, y::SimpleQuaternion) = SimpleQuaternion(x) == y

one(a::SimpleQuaternion{T}) where T = SimpleQuaternion(one(T))
zero(a::SimpleQuaternion{T}) where T = SimpleQuaternion(zero(T))

one(::Type{SimpleQuaternion{T}}) where T = SimpleQuaternion(one(T))
zero(::Type{SimpleQuaternion{T}}) where T = SimpleQuaternion(zero(T))

include("arithmetic.jl")
include("show.jl")
include("matrices.jl")
include("random.jl")

end # module
