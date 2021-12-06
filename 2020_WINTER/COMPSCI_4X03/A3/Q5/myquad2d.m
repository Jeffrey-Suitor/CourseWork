function Q = myquad2d(fun, a, b, c, d, tol)
f = matlabFunction(inner_integral(fun,c,d,tol,0,20));
Q = adaptive_simpson(f,a,b,tol, 0, 20);
end