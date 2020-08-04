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