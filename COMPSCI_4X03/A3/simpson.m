function val = simpson(f, a, b, n)

h = (b-a)/n;
range2 = 1:2:n-1;
range4 = 2:2:n-2;

output_array2 = 2 * f(a + range2.*h);
output_array4 = 4 * f(a + range4.*h);

val = h/3*(f(a) + f(b) + sum(output_array2) + sum(output_array4));
end
    
