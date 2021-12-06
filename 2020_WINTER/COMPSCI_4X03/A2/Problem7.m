clc; clear; close;

% POLYFIT
x = linspace(-pi,pi,21);
y = max(0,sin(x));

xx = linspace(-pi,pi,200);
yy = max(0,sin(xx));

p = polyfit(x,y,20);
pp = polyval(p,xx);

disp("Polynomial is")
poly2sym(p)
figure
hold on
title("Polyfit interpolation")
plot(xx,pp,xx,yy,x,y,'o')
legend('p(x)','f(x)','datapoints')
hold off

%SPLINE
spline = spline(x,y,xx);
disp("Spline Fit is")
poly2sym(spline)

figure
hold on
title("Spline interpolation")
plot(xx,spline,xx,yy,x,y,'o')
legend('p(x)','f(x)','datapoints')
hold off

%CHEBYSHEV
x=zeros(0,21);
for i=1:21
x(i) = -pi*cos((2.*i-1)/(2*21)*pi);
end

y = max(0,sin(x));
p = polyfit(x,y,20);
pp = polyval(p,xx);

disp("Chebysev is")
poly2sym(p)
figure
hold on
title("Chevyshev interpolation")
plot(xx,pp,xx,yy,x,y,'o')
legend('p(x)','f(x)','datapoints')
hold off
