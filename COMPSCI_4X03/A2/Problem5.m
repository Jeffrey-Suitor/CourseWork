x = linspace(1,2,100);
error_val = .25^5/20 * abs(-1*1/2^4*120.*x.^(-7/2))
figure

hold on
yline(3/8192)
title("Question 5 Part C")
semilogy(x,error_val)
hold off