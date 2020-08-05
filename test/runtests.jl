using SimpleQuaternions, Test 

a = SimpleQuaternion(1)
@test a==1 

a = SimpleQuaternion(1,1,1,1)
@test a == 1 + im + jm + km
@test norm(a) == 2 
@test a * inv(a) == 1 
@test a/a == 1
@test a+a == 2a
@test a-a == 0 
@test a*a == SimpleQuaternion(-2,2,2,2)
@test get_parts(a) == (1,1,1,1)
@test a//a == 1
@test sqrt(real(a*a')) == norm(a)


b = SimpleQuaternion(5,0,-2,4)
A = real_matrix(a)
B = real_matrix(b)
@test a == SimpleQuaternion(A)
@test A*B == real_matrix(a*b)

A = complex_matrix(a)
B = complex_matrix(b)
@test A*B == complex_matrix(a*b)
@test b == SimpleQuaternion(B)