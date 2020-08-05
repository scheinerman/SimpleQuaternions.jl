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
