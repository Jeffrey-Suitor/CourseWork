function val = trapezoid(f, a, b, n)
h = (b-a)/n;
x = linspace(a,b,n+1);
range = x(2:n);
sum_val = sum(f(range));
val = h/2*(f(a) + 2*sum_val + f(b));
end

