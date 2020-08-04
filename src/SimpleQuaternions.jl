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

SimpleQuaternion(x::Real) = SimpleQuaternion(x,0,0,0)
SimpleQuaternion(z::Complex) = SimpleQuaternion(real(z),imag(z),0,0)

jm = SimpleQuaternion(0,0,1,0)
km = SimpleQuaternion(0,0,0,1)

function (==)(x::SimpleQuaternion,y::SimpleQuaternion)
    x.a==y.a && x.b==y.b && x.c==y.c && x.d==y.d
end

include("promotion.jl")

end # module
