function [S, count] = inner_integral(f, a, b, tol, count, count_max)

global xpoints

count = count + 1;

h = b - a;
c = (a + b) / 2;
d = (a + c) / 2;
e = (c + b) / 2;

syms x
fa = f(x,a);
fb = f(x,b);
fc = f(x,c);
fd = f(x,d);
fe = f(x,e);

S1 = h/6*(fa + 4*fc + fb);
S2 = h/12 * (fa + 4*fd + 2*fc + 4*fe + fb);
E2 = (S2 - S1)/15;

xpoints = unique([xpoints, a, b, c, d, e]);

if count >= count_max
    S = S2 + E2;
    
else
    [Q1, count] = inner_integral(f, a, c, tol/2, count, count_max);
    [Q2, count] = inner_integral(f, c, b, tol/2, count, count_max);
    S = Q1 + Q2;
end
end