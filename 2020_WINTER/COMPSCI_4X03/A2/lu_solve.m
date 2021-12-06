function x = lu_solve(L,U,b)
y = inv(L) * b;
x = inv(U) * y;
end