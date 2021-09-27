x=linspace(-5,5,100);
t = linspace(-5,5,500);
q = cos(t).^2 +sin(t);
z = cos(x).^2 +sin(x);
train=[x;z]'
test = [t;q]'