W = [0 0 0]'
x = [1 1 1 1;1 1 0 0; 1 0 1 0]
yd = [1; 1 ; 1; 0]
error = 1;
while error ~= 0 
    error=0;
    for i=1:1:4
        y = hardlim(W'*x(:,i)); 
        e = yd(i) - y;
        W =  W + 1*e.*x(:,i);
        error = error + abs(e);
        
    end
    disp(W)
end
for i=1:1:4
    y = hardlim(W'*x(:,i))
end
