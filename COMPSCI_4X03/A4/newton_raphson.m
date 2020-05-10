function [solutions, iters] = newton_raphson(funs, jacob, init_conds, tol)
% funs is a a column vector with each row being a function
% jacob is the jacobian of the functions
% init_conds is the initial conditions
% tol is tolerance
warning('off','all')
del=1;
iters=0;
solutions = init_conds;
results = zeros(length(funs), 1);
jacobian_results = zeros(length(jacob), length(jacob));
while del>tol
    
    for i=1:length(funs)
        results(i) = funs{i}(solutions);
        
    end
    
    for i=1:length(jacob)^2
        jacobian_results(i) = jacob{i}(solutions);
        
    end
     del_x=-inv(jacobian_results)*results;
     del=max(abs(results));
     if det(jacobian_results) == 0
         disp("Matrix is singular and inverse cannot be computed. Newton fails")
         solutions = [NaN, NaN, NaN, NaN];
         iters = NaN;
         return
     end
     solutions=solutions+del_x;
     iters=iters+1;
     
end
end