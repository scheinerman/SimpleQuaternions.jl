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
@test parts(a) == (1,1,1,1)
@test a//a == 1
@test sqrt(real(a*a')) == norm(a)

