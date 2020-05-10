function [S, count] = adaptive_simpson(f, a, b, tol, count, count_max)

global xpoints

count = count + 1;

h = b - a;
c = (a + b) / 2;
d = (a + c) / 2;
e = (c + b) / 2;

S1 = h/6*(f(a) + 4*f(c) + f(b));
S2 = h/12 * (f(a) + 4*f(d) + 2*f(c) + 4*f(e) + f(b));
E2 = 1/15 * (S2 - S1);

xpoints = unique([xpoints, a, b, c, d, e]);

if count > count_max
    S = S2;
    disp("Max Recursion Reached")
    
elseif abs(E2) < tol
    S = S2 + E2;
    
else
    [Q1, count] = adaptive_simpson(f, a, c, tol/2, count, count_max);
    [Q2, count] = adaptive_simpson(f, a, b, tol/2, count, count_max);
    S = Q1 + Q2;
end
    return
end