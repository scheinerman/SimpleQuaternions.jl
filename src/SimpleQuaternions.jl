module SimpleQuaternions

export SimpleQuaternion, jm, km, coeffs

import Base: (+), (-), (*), (/), (==)

struct SimpleQuaternion{T}  <: Number
    a::T 
    b::T
    c::T 
    d::T 
    function SimpleQuaternion(x::Real, y::Real, z::Real, w::Real)
        (aa,bb,cc,dd) = promote(x,y,z,w)
        T = typeof(aa)
        new{T}(aa,bb,cc,dd)
    end 
end

_coeffs(x::SimpleQuaternion) = (x.a,x.b,x.c,x.d)

SimpleQuaternion(x::Real) = SimpleQuaternion(x,0,0,0)
SimpleQuaternion(z::Complex) = SimpleQuaternion(real(z),imag(z),0,0)

jm = SimpleQuaternion(false,false,true,false)
km = SimpleQuaternion(false,false,false,true)

function (==)(x::SimpleQuaternion,y::SimpleQuaternion)
    _coeffs(x) == _coeffs(y)
end

include("promotion.jl")
include("arithmetic.jl")

end # module
