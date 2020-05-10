h = helper_functions;

% Question 1
syms t;

% Question 1 A (Not done)
% 0 <= t <= 2 is 1 otherwise 0
figure(1)
h.reset()
x = @(t) (heaviside(t) - heaviside(t-2));
fplot(t, x);
title("Question 1. A")
xlabel("Time (s)");
ylabel("Value");
xlim([-1, 5])
ylim([0, 2]);

% % Question 1 B
% % x(t) = 10e-3t * u(t)
% h.reset();
% figure(2);
% x = @(t) (10*exp(-3*t)*heaviside(t));
% fplot(x);
% xlim([-1, 5]);
% ylim([0, 11]);
% 
% % Question 1 C
% % x(t) = 3* e^-t * cost(2*t*u(t))
% h.reset();
% figure(3);
% x = @(t) (3*exp(-t)*cos(2*t*heaviside(t)));
% fplot(x);
% xlim([-1, 5]);
% ylim([-1, 10]);
% 
% Question 1 D
% x(t) = 2sin(3t-pi/2)-cos(2t)
% h.reset();
% figure(4);
% x = @(t) (2*sin(3*t-pi/2)-cos(2*t));
% fplot(x);
% xlim([-1, 5]);
% ylim([-4, 4]);
% 
% % Question 2
% n = linspace(-5, 15, 20);
% 
% % Question 2 A 
% h.reset();
% figure(5);
% x = zeros(20);
% 
% for i=1:21
%     cur_n = -6 + i;
%     x(i) = 0.5^cur_n * heaviside(cur_n);
% end
% stem(n,x);
% xlim([-5, 15]);
% ylim([-1, 1]);
% 
% % Question 2 B
% h.reset();
% figure(6);
% x = zeros(20);
% 
% for i=1:21
%     cur_n = -6 + i;
%     x(i) = 2^cur_n * heaviside(cur_n);
% end
% stem(n,x);
% xlim([-5, 15]);
% ylim([0, 9000]);
% 
% % Question 2 B
% h.reset();
% figure(7);
% x = zeros(20);
% 
% for i=1:21
%     cur_n = -6 + i;
%     x(i) = sin(pi*cur_n/4);
% end
% stem(n,x);
% xlim([-5, 15]);
% ylim([-1, 1]);
% 
% 
% % Question 3 A -> causal, memoryless, time-variant, linear
% % Question 3 B -> causal, memoryless, time-invariant, non-linear
% % Question 3 C -> causal, memoryless, time-invariant, non-linear
% % Question 3 D -> causal, memory, time-variant, linear
% 
% % Question 4 A -> causal, memoryless, time-invariant, non-linear
% % Question 4 B -> causal, memoryless, time-varient, linear
% % Question 4 C -> causal, memoryless, time-invarient, non-linear
% % Question 4 D -> causal, memoryless, time-invarient, non-linear
% % Question 4 E -> causal, memory, time-varient, linear
% % Question 4 F -> causal, memory, time-varient, linear
% 
% 
% 

