function string(x::SimpleQuaternion)
    a,b,c,d = parts(x)
    (a,b,c,d,xx) = promote(a,b,c,d,0)
    result = string(a)

    if b<0
        result *= " - "
    else 
        result *= " + "
    end

    result *= string(abs(b)) * "im"

    if c<0
        result *= " - "
    else 
        result *= " + "
    end

    result *= string(abs(c)) * "jm"


    if d<0
        result *= " - "
    else 
        result *= " + "
    end

    result *= string(abs(d)) * "km"
end

function show(io::IO, x::SimpleQuaternion)
    print(io, string(x))
end 