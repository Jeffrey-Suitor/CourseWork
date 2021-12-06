sigma = 10;
b = 8/3;
r = 28;
init_vals = [15 15 36];
range = [0 100];
f = @(t,x) [sigma*(x(2)-x(1)); r*x(1)-x(2)-x(1)*x(3); x(1)*x(2) - b*x(3)];

[t,xa] = ode45(f,range, init_vals);

figure(1)
subplot(1,2,1)
plot(t,xa(:,1))
title('Init Conds: y1(t)')
xlabel('t'), ylabel('y1')

figure(2)
subplot(1,2,1)
plot(t,xa(:,2))
title('Init Conds: y2(t)')
xlabel('t'), ylabel('y2')

figure(3)
subplot(1,2,1)
plot(t,xa(:,3))
title('Init Conds: y3(t)')
xlabel('t'), ylabel('y3')

figure(4)
subplot(1,2,1)
plot(xa(:,1),xa(:,2))
title('Init Conds: y1y2')
xlabel('y1'), ylabel('y2')

figure(5)
subplot(1,2,1)
plot(xa(:,1),xa(:,3))
title('Init Conds: y1y3')
xlabel('y2'), ylabel('y3')

figure(6)
subplot(1,2,1)
plot(xa(:,2),xa(:,3))
title('Init Conds: y2y3')
xlabel('y3'), ylabel('y3')
%% 
sigma = 10;
b = 8/3;
r = 28;
init_vals = [15-10^-10 15-10^-10 36+10^-10];
range = [0 100];
f = @(t,x) [sigma*(x(2)-x(1)); r*x(1)-x(2)-x(1)*x(3); x(1)*x(2) - b*x(3)];

[t,xa] = ode45(f,range, init_vals);

figure(1)
subplot(1,2,2)
plot(t,xa(:,1))
title('New Conds: y1(t)')
xlabel('t'), ylabel('y1')

figure(2)
subplot(1,2,2)
plot(t,xa(:,2))
title('New Conds: y2(t)')
xlabel('t'), ylabel('y2')

figure(3)
subplot(1,2,2)
plot(t,xa(:,3))
title('New Conds: y3(t)')
xlabel('t'), ylabel('y3')

figure(4)
subplot(1,2,2)
plot(xa(:,1),xa(:,2))
title('New Conds: y1y2')
xlabel('y1'), ylabel('y2')

figure(5)
subplot(1,2,2)
plot(xa(:,1),xa(:,3))
title('New Conds: y1y3')
xlabel('y2'), ylabel('y3')

figure(6)
subplot(1,2,2)
plot(xa(:,2),xa(:,3))
title('New Conds: y2y3')
xlabel('y3'), ylabel('y3')