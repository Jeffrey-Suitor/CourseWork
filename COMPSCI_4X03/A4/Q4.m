u=0.012277471;
u_hat=1-u;

f=@(t,x) [...
          x(2);
          x(1) + 2*x(4) - u_hat*(x(1)+u)/((x(1)+u)^2+x(3)^2)^1.5 - u*(x(1)-u_hat)/((x(1) - u_hat)^2 + x(3)^2)^1.5;
          x(4);
          x(3) - 2*x(2) - u_hat*x(3)/((x(1)+u)^2 + x(3)^2)^1.5 - u*x(3)/((x(1) - u_hat)^2 + x(3)^2)^1.5];
     

range = [0;17.1];
init_conds = [0.994; 0; 0; -2.001585106379082522420537862224];
for iters=[100,1000,10000,20000]
    figure;
    [X,Y]=runge_kutta(f, range, init_conds, iters);
    plot(Y(1,:),Y(3,:));
    xlabel('u1(t)');
    ylabel('u2(t)');
    title(['For N=' num2str(iters)]);
end

function [x,y]=runge_kutta(f, range, init_conds, iters)

x = linspace(range(1), range(2), iters);
h=x(2)-x(1);
y = zeros(4, length(x));
y(:,1) = init_conds;

for i=1:(length(x)-1)
    k1 = f(x(i),            y(:,i)                       );
    k2 = f(x(i) + 0.5 * h,  y(:,i) + 0.5 * h * k1        );
    k3 = f(x(i) + 0.5*h,    y(:,i) + 0.5 * h * k2        );
    k4 = f(x(i) + h,        y(:,i) + k3 * h              );
    y(:,i+1) = y(:,i) + (1/6) * (k1 + 2*k2 + 2*k3 +k4) * h;
end

end