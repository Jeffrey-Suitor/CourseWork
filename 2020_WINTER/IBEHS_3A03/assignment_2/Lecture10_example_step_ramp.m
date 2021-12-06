figure

subplot(2,2,1)
fplot(@(t) unitstep(t),[-5 5])
ylim([0 1.1])
xlabel('t')
ylabel('u(t)')
title('C-T unit step')

subplot(2,2,3)
fplot(@(t) unitstep(t).*t,[-5 5])
ylim([0 6])
xlabel('t')
ylabel('r(t)')
title('C-T unit ramp')

n = -5:5;

subplot(2,2,2)
stem(n,unitstep(n))
ylim([0 1.1])
xlabel('n')
ylabel('u[n]')
title('D-T unit step')

subplot(2,2,4)
stem(n,unitstep(n).*n)
ylim([0 6])
xlabel('n')
ylabel('r[n]')
title('D-T unit ramp')
