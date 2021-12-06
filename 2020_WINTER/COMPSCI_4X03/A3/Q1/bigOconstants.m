function [a,b,n,time] = bigOconstants(alg)
disp(alg)
n = 7:11;
n = 2.^n;
l = length(n);
time = zeros(1, l);
for i=1:length(n)
    A = rand(n(i));
    B = rand(n(i));
    if alg == 1
        tic
        A*B;
        time(i) = toc;
        
    elseif alg == 2
        tic
        strassen(A,B);
        time(i) = toc;
        
    elseif alg == 3
        tic
        strassenw(A,B);
        time(i) = toc;
    end
    
end

B = [ones(l,1), log(n)'];
coeff = B\log(time)';
a = exp(coeff(1));
b = coeff(2);
return
end
