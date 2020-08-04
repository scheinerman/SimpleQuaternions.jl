# `SimpleQuaternions`



[![Build Status](https://travis-ci.org/scheinerman/SimpleQuaternions.jl.svg?branch=master)](https://travis-ci.org/scheinerman/SimpleQuaternions.jl)

[![Coverage Status](https://coveralls.io/repos/scheinerman/SimpleQuaternions.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/scheinerman/SimpleQuaternions.jl?branch=master)

[![codecov.io](http://codecov.io/github/scheinerman/SimpleQuaternions.jl/coverage.svg?branch=master)](http://codecov.io/github/scheinerman/SimpleQuaternions.jl?branch=master)

The *quaternions* are an extension to the real (and complex) numbers. See
[this article](https://en.wikipedia.org/wiki/Quaternion).

---

This module provides the `SimpleQuaternion` type. To create the quaternion 
*a + bi + cj + dk* use `SimpleQuaternion(a,b,c,d)` or, alternatively
`a + b*im + c*jm + d*km`. 

Note that `im` is the usual Julia representation for *i*; this module adds `jm` 
and `km`. Thus, the expression `1+im` yields a `Complex` value, but `1+jm` yields 
a `SimpleQuaternion`.

Some examples:
```
julia> a = 3im-4 + km
-4 + 3im + 0jm + 1km

julia> parts(a)
(-4, 3, 0, 1)

julia> real(a)
-4

julia> a'
-4 - 3im + 0jm - 1km

julia> b = 1 - 4im + jm
1 - 4im + 1jm + 0km

julia> a+b
-3 - 1im + 1jm + 1km

julia> a-b
-5 + 7im - 1jm + 1km

julia> a*b
8 + 18im - 8jm + 4km

julia> inv(a)
-0.15384615384615385 - 0.11538461538461539im + 0.0jm - 0.038461538461538464km

julia> 1//a
-2//13 - 3//26im + 0//1jm - 1//26km

julia> a/b
-0.8888888888888888 - 0.6666666666666666im + 0.4444444444444444jm - 0.1111111111111111km

julia> a//b
-8//9 - 2//3im + 4//9jm - 1//9km

julia> im*jm == km
true

julia> jm*im == -km
true

julia> im*im == jm*jm == km*km == -1
true
```
