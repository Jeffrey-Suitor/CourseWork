clc; clear; close all;

a = 0;
b = 1;
f = @new_func;
x = linspace(a,b,100);
ref = integral(f,a,b, 'AbsTol', 10^-10);
sim_output =  simpson(f,a,b, 1000);
[~, count] = f(0,0);
C1 = count - 1;

[adapt_sim_output, layers] = adaptive_simpson(f,a,b,10^-8, 0, 2000);
[~, count] = f(0,0);
C2 = count - 1;

C1
C2
C_diff = C1/C2
adaptive_error = abs(ref - adapt_sim_output)
composite_error = abs(ref - sim_output)
y = f(x);

if adaptive_error < 10^-8
    disp("Adaptive error within tolerance")
end


hold on
plot(x,y)
title("Sin(pi*x^2/3)")
xlabel("Points")
ylabel("Values")
hold off


function [val, varargout] = new_func(x, ~)

persistent count

if isempty(count) 
    count = 0;
end

if length(x) == 1
    count = count + 1;
else
    count = count + length(x);
end

val = sin(pi.*x/3).*x;

if (nargin == 2) 
    varargout{1} = count;
    count = 0;
end
end