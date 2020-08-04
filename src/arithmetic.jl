
function (+)(x::SimpleQuaternion, y::SimpleQuaternion)
    cz = _coeffs(x) .+ _coeffs(y)
    return SimpleQuaternion(cz...)
end 

(+)(x::SimpleQuaternion, y::Number) = x + SimpleQuaternion(y)
(+)(x::Number, y::SimpleQuaternion) = SimpleQuaternion(x) + y


function (-)(x::SimpleQuaternion)
    cz = (-)._coeffs(x)
    return SimpleQuaternion(cz...)
end 

function (-)(x::SimpleQuaternion,y::SimpleQuaternion)
    cz = _coeffs(x) .- _coeffs(y)
    return SimpleQuaternion(cz...)
end 

(-)(x::SimpleQuaternion,y::Number) = x - SimpleQuaternion(y)
(-)(x::Number, y::SimpleQuaternion) = SimpleQuaternion(x) - y 

function (*)(x::SimpleQuaternion, y::SimpleQuaternion)
    a,b,c,d = _coeffs(x)
    aa,bb,cc,dd, = _coeffs(y)

    w = a*aa - b*bb - c*cc - d*dd
    x = a*bb + b*aa + c*dd - d*cc
    y = a*cc - b*dd + c*aa + d*bb 
    z = a*dd + b*cc - c*bb + d*aa
    
    return SimpleQuaternion(w,x,y,z)
end 

(*)(x::SimpleQuaternion, y::Number) = x * SimpleQuaternion(y)
(*)(x::Number, y::SimpleQuaternion) = SimpleQuaternion(x) * y


function norm(x::SimpleQuaternion)
    a,b,c,d = _coeffs(x)
    return sqrt(a*a + b*b + c*c + d*d)
end

function (inv)(x::SimpleQuaternion)
    a,b,c,d = _coeffs(x)
    n = a*a + b*b + c*c + d*d
    return SimpleQuaternion(a/n, -b/n, -c/n, -d/n)
end

(/)(x::SimpleQuaternion, y::SimpleQuaternion) =  x * inv(y)
(/)(x::SimpleQuaternion,y::Number) =  x * inv(y)
(/)(x::Number,y::SimpleQuaternion) =  x * inv(y)
