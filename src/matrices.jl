export real_matrix, complex_matrix

"""
`real_matrix(x::SimpleQuaternion)` returns a 4-by-4 real matrix that represents
`x`. 
"""
function real_matrix(x::SimpleQuaternion)
    a, b, c, d = get_parts(x)
    M = [
        a -b -c -d
        b a -d c
        c d a -b
        d -c b a
    ]
    return M
end

"""
`complex_matrix(x::SimpleQuaternion)` returns a 2-by-2 complex matrix 
that represents `x`.
"""
function complex_matrix(x::SimpleQuaternion)
    a, b, c, d = get_parts(x)
    M = [
         a+b*im     c+d*im
        -c+d*im     a-b*im
    ]
    return M
end


function SimpleQuaternion(A::Matrix{T}) where T
    r,c = size(A)
    if r!=c || !in(r,[2,4])
        error("Matrix must be 2-by-2 or 4-by-4; got $r-by-$c.")
    end

    if r==4  
        v = A[:,1]
        x = SimpleQuaternion(v...)
        if real_matrix(x) != A 
            error("Matrix not derived from a quaternion")
        end 
        return x
    end 

    a,b = reim(A[1,1])
    c,d = reim(A[1,2])
    x = SimpleQuaternion(a,b,c,d)
    if complex_matrix(x) != A 
        error("Matrix not derived from a quaternion")
    end
    return x 
end 







