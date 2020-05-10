% A. Newton root
f = @(x) x.^9 - 18.*x.^8 + 144.*x.^7 - 672.*x.^6 ...
              + 2016.*x.^5 - 4032.*x.^4 + 5376.*x.^3 ...
              - 4608.*x.^2 + 2304.*x - 512;
x_lower = 0;
x_upper = 4;
tol = 1e-6;
newton_root = newton_midpoint(f, x_lower, x_upper, tol);
fprintf("The Newton root is %g and the tolerance is below %g\n", newton_root, tol);

%B. Horner vs Direct Evaluationn 
interval = linspace(1.92, 2.08, 161);
fun = @(x) (x-2).^9;

poly = [1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512];

horner_result = horner(poly, interval);
direct_result = fun(interval);
figure(1)
subplot(1,2,1)
plot(interval, direct_result)
title("Direct result")
subplot(1,2,2)
plot(interval, horner_result)
title("Horner result")

%C. Horner root
horner_mid = @(x) horner(poly,x);
horner_lower = 1.92;
horner_upper = 2.08;

horner_root = newton_midpoint(horner_mid, horner_lower, horner_upper, tol);
fprintf("The Horner root is %g and the tolerance is below %g\n", horner_root, tol)

function result = horner(poly, interval)
result = zeros(1, length(interval));
for i=1:length(result)
    for j=1:length(poly)
        result(i) = result(i)*interval(i) + poly(j);
    end
end
end

function mid = newton_midpoint(f, lower, upper, tol)

mid = (lower + upper) / 2;

while abs(f(mid)) > tol
    if (f(mid) * f(upper)) < 0
        lower = mid;
    else
        upper = mid;
    end
    mid = (lower + upper)/2;
end
end