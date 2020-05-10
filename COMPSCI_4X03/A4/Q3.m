%Q3
clc; clear all;
options = optimset('Display','final');
%A

% Setup
init_conds = [15; -2];
tol = 1e-6;

%Functions
f1 = @(args) args(1) + args(2)*(args(2)*(5-args(2)) - 2) - 13;
f2 = @(args) args(1) + args(2)*(args(2)*(1+args(2)) - 14) - 29;
funs = {f1; f2};
F = @(x) [f1(x); f2(x)];

% Jacobian
j1 = @(args) 1;
j2 = @(args) -3*args(2).^2 + 10*args(2) -2;
j3 = @(args) 1;
j4 = @(args) 3*args(2).^2 + 2*args(2) - 14;
jacob = {j1, j2; j3, j4};

%Solution
[solutions1,~,~,out] = fsolve(F, init_conds, options);
fprintf("The fsolve solutions are x1=%g and x2=%g, using %g iterations\n" , solutions1, out.iterations);

[solutions2, iters] = newton_raphson(funs, jacob, init_conds, tol);
if ~ isnan(iters)
    fprintf("The newton solutions are x1=%g and x2=%g, using %g iterations\n" , solutions2, iters);
end
%% B

%Setup
init_conds = [(1+sqrt(3))/2; (1-sqrt(3))/2; sqrt(3)];
tol = 1e-6;

% Functions
f1 = @(args) args(1)^2 + args(2)^2 + args(3)^2 - 5;
f2 = @(args) args(1) + args(2) - 1;
f3 = @(args) args(1) + args(3) - 3;
funs = {f1; f2; f3};
F = @(x) [f1(x); f2(x); f3(x)];

% Jacobian
j1 = @(args) 2*args(1);
j2 = @(args) 2*args(2);
j3 = @(args) 2*args(3);
j4 = @(args) 1;
j5 = @(args) 1;
j6 = @(args) 0;
j7 = @(args) 1;
j8 = @(args) 0;
j9 = @(args) 1;
jacob = {j1, j2, j3; j4, j5, j6; j7, j8, j9};

%Solution
[solutions1,~,~,out] = fsolve(F, init_conds,options);
fprintf("The fsolve solutions are x1=%g x2=%g, and x3=%g using %g iterations\n" , solutions1, out.iterations);

[solutions2, iters] = newton_raphson(funs, jacob, init_conds, tol);
if ~ isnan(iters)
    fprintf("The newton solutions are x1=%g, x2=%g, and x3=%g using %g iterations\n" , solutions2, iters);
end
%% C

%Setup
init_conds = [1; 2; 1; 1];
tol = 1e-6;


% Functions
f1 = @(args) args(1)+10*args(2);
f2 = @(args) sqrt(5)*(args(3)-args(4));
f3 = @(args) (args(2)-args(3))^2;
f4 = @(args) sqrt(10)*(args(1)-args(4))^2;
funs = {f1; f2; f3; f4};
F = @(x) [f1(x), f2(x), f3(x), f4(x)];

% Jacobian
j1 = @(args) 1;
j2 = @(args) 10;
j3 = @(args) 0;
j4 = @(args) 0;
j5 = @(args) 0;
j6 = @(args) 0;
j7 = @(args) 5^(0.5);
j8 = @(args) -5^(0.5);
j9 = @(args) 0;
j10 = @(args) 2*args(2) - 2*args(3);
j11 = @(args) 2*args(3) - 2*args(2);
j12 = @(args) 0;
j13 = @(args) 2*10^0.5*args(1) - 2*10^0.5*args(4);
j14 = @(args) 0;
j15 = @(args) 0;
j16 = @(args) -2*10^0.5*args(1) + 2*10^0.5*args(4);
jacob = {j1, j2, j3 j4; j5, j6, j7, j8; j9, j10, j11, j12; j13, j14, j15, j16};

%Solution
[solutions1,~,~,out] = fsolve(F, init_conds,options);
fprintf("The fsolve solutions are x1=%g, x2=%g, x3=%g, and x4=%g using %g iterations\n" , solutions1, out.iterations)

[solutions2, iters] = newton_raphson(funs, jacob, init_conds, tol);
if ~ isnan(iters)
    fprintf("The newton solutions are x1=%g, x2=%g, x3=%g, and x4=%g using %g iterations\n" , solutions2, iters)
end

%% D

%Setup
init_conds = [1.8; 0];
tol = 1e-6;

% Functions
f1 = @(args) args(1);
f2 = @(args) 10*args(1)/(args(1)+0.1)+2*args(2)^2;
funs = {f1; f2};
F = @(x) [f1(x), f2(x)];

% Jacobian
j1 = @(args) 1;
j2 = @(args) 0;
j3 = @(args) 100/(100*args(1)^2 + 20*args(1) + 1);
j4 = @(args) 4*args(2);

jacob = {j1, j2; j3 j4};

%Solution
[solutions1,~,~,out] = fsolve(F, init_conds,options);
fprintf("The fsolve solutions are x1=%g and x2=%g, using %g iterations\n" , solutions1, out.iterations)

[solutions2, iters] = newton_raphson(funs, jacob, init_conds, tol);
if ~ isnan(iters)
    fprintf("The newton solutions are x1=%g, and x2=%g using %g iterations\n" , solutions2, iters)
end

%% Function Defs

function F = fsolve_func_A(args)

F(1) = args(1) + args(2)*(args(2)*(5-args(2)) - 2) - 13;
F(2) = args(1) + args(2)*(args(2)*(1+args(2)) - 14) - 29;
end
