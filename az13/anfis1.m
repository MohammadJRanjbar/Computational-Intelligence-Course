x=linspace(-5,5,20);
t = linspace(-5,5,200);
q = cos(t);
z = cos(x);
train=[x;z]'
test = [t;q]'