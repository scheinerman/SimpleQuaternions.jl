function (+)(x::SimpleQuaternion, y::SimpleQuaternion)
    cz = get_parts(x) .+ get_parts(y)
    return SimpleQuaternion(cz...)
end 

(+)(x::SimpleQuaternion, y::Number) = x + SimpleQuaternion(y)
(+)(x::Number, y::SimpleQuaternion) = SimpleQuaternion(x) + y


function (-)(x::SimpleQuaternion)
    a,b,c,d = get_parts(x)
    return SimpleQuaternion(-a,-b,-c,-d)
end 

function (-)(x::SimpleQuaternion,y::SimpleQuaternion)
    cz = get_parts(x) .- get_parts(y)
    return SimpleQuaternion(cz...)
end 

(-)(x::SimpleQuaternion,y::Number) = x - SimpleQuaternion(y)
(-)(x::Number, y::SimpleQuaternion) = SimpleQuaternion(x) - y 

function (*)(x::SimpleQuaternion, y::SimpleQuaternion)
    a,b,c,d = get_parts(x)
    aa,bb,cc,dd, = get_parts(y)

    w = a*aa - b*bb - c*cc - d*dd
    x = a*bb + b*aa + c*dd - d*cc
    y = a*cc - b*dd + c*aa + d*bb 
    z = a*dd + b*cc - c*bb + d*aa
    
    return SimpleQuaternion(w,x,y,z)
end 

(*)(x::SimpleQuaternion, y::Number) = x * SimpleQuaternion(y)
(*)(x::Number, y::SimpleQuaternion) = SimpleQuaternion(x) * y


function norm(x::SimpleQuaternion)
    a,b,c,d = get_parts(x)
    return sqrt(a*a + b*b + c*c + d*d)
end

function (inv)(x::SimpleQuaternion)
    a,b,c,d = get_parts(x)
    n = a*a + b*b + c*c + d*d
    return SimpleQuaternion(a/n, -b/n, -c/n, -d/n)
end

function (_inv)(x::SimpleQuaternion)
    a,b,c,d = get_parts(x)
    n = a*a + b*b + c*c + d*d
    return SimpleQuaternion(a//n, -b//n, -c//n, -d//n)
end

(/)(x::SimpleQuaternion, y::SimpleQuaternion) =  x * inv(y)
(/)(x::SimpleQuaternion,y::Number) =  x * inv(y)
(/)(x::Number,y::SimpleQuaternion) =  x * inv(y)

(//)(x::SimpleQuaternion, y::SimpleQuaternion) = x * _inv(y)
(//)(x::SimpleQuaternion, y::Number) = x * (1//y)
(//)(x::Number,y::SimpleQuaternion) = SimpleQuaternion(x) // y

"""
`adjoint(x::SimpleQuaternion)` or `x'` returns the adjoint of `x`.

If `x` is `a + b*im + c*jm + d*km` then `x'` is `a - b*im - c*im - d*im`.
"""
adjoint(x::SimpleQuaternion) = conj(x)
   

"""
`conj(x::SimpleQuaternion)` returns the conjugate of `x`.

If `x` is `a + b*im + c*jm + d*km` then `conj(x)` is `a - b*im - c*im - d*im`.
"""
function conj(x::SimpleQuaternion)
    a,b,c,d = get_parts(x)
    return SimpleQuaternion(a,-b,-c,-d)
end 
