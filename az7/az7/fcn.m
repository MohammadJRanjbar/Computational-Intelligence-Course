function [ x1_dot , x2_dot ] = fcn( x1 , x2  )
x1_dot = x2
x2_dot=-x1+(1-x1^2)*x2
end

