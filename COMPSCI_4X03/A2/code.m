%
y=zeros(0,21)
x=zeros(0,21)

h= (2*pi)/20
for i=1:21
    x(i) = -pi + (i-1)*h;
    y(i) = max(sin(x(i)), 0);
end

p = polyfit(x,y,20)

z = (-pi : (2*pi/200) : pi)
f =  max(0,sin(z))
y1 = polyval(p,z)

plot(z,y1,z,f,x,y,'o')
legend('p(x)','f(x)','datapoints')


%%
%SPLINE
G = y;
x=zeros(0,21)

h= (2*pi)/20
for i=1:21
    x(i) = -pi + (i-1)*h;
end

y = max(0,sin(x));
z = (-pi : (2*pi/200) : pi);
f =  max(0,sin(z));
yy = spline(x,y,z);

plot(z,yy,z,f,x,G,'o')
legend('p(x)','f(x)','datapoints')

%%
%CHEBYSHEV
y=zeros(0,21)
x=zeros(0,21)

for i=1:21
    x(i) = -pi*cos((2*i-1)/(2*21)*pi);
    y(i) = max(sin(x(i)), 0);
end

p = polyfit(x,y,20)


z = (-pi : (2*pi/200) : pi)
f =  max(0,sin(z))
y1 = polyval(p,z)

plot(z,y1,z,f,x,y,'o')
legend('p(x)','f(x)','datapoints')
