function val = simpson(f, a, b, n)

h = (b-a)/n;
x = linspace(a,b,n+1);

range2 = x(3:2:n-1);
range4 = x(2:2:n);

sum2 = 2 * sum(f(range2));
sum4 = 4 * sum(f(range4));

val = h/3 * (f(a) + f(b) + sum2 + sum4);
end
