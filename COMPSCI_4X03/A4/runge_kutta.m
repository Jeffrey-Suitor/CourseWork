function [u1_pos_out, u1_vel_out] = runge_kutta(u1_fun, range, h, vel, pos) 
u1_pos_out = zeros(2,length(range));
u1_vel_out = zeros(2,length(range));

u1_pos_out(:,1) = pos;
u1_vel_out(:,1) = vel;

for i = 1:length(range) - 1
    k1 = u1_fun(range(i),       u1_pos_out(i),          u1_vel_out(i));
    k2 = u1_fun(range(i)+.5*h,  u1_pos_out(i)+.5*k1*h,  u1_vel_out(i)+.5*k1*h);
    k3 = u1_fun(range(i)+.5*h,  u1_pos_out(i)+.5*k2*h,  u1_vel_out(i)+.5*k2*h);
    k4 = u1_fun(range(i)+h,     u1_pos_out(i)+k3*h,     u1_vel_out(i)+k3*h);
    u1_pos_out(i+1) = u1_pos_out(i)+ h*(u1_vel_out(i) + h/6*(k1 + k2 + k3));
    u1_vel_out(i+1) = u1_vel_out(i)+ h/6 *(k1+2*k2+2*k3+k4) ;
    
end
end