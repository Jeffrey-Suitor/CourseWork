function val = midpoint(f, a, b, n)
h = (b-a)/n;
x = linspace(a,b,2*n+1);
range = x(2:2:2*n);
val = h * sum(f(range));
end