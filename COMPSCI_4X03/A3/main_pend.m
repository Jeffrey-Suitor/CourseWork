clc; clear; close all;
a = 0;
b = pi / 2;
x = linspace(-1, 1, 20);
y = zeros(1, length(x));
tol = 10^-4;

for i=1:length(x)
    f = @(val) 1/(1-x(i)^2*sin(val)^2)^0.5;
    y(i) = adaptive_simpson(f, a, b, tol, 0, 20);
end

plot(x,y)
title("Adaptive Simpson")
xlabel("Range from -1 to 1")
ylabel("Value")