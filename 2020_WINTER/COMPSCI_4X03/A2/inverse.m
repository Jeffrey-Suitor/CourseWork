%This script shows the difference in time when computing
%the inverse of a matrix using its LU factorization vs solving
%n systems without it
clear
n = 1000; 

A = rand(n,n);
[L,U,P] = lu(A);
tic
for i=1:n
    %i-th unit vector
    ei = zeros(n,1); ei(i) = 1;
    %solve Ax = ei
    % P*A = L*U, so we need to solve L*Ux = P*ei
    % L*y = P*ei
    y = L\(P*ei);
    % Ux = y
    X1(:,i) = U\y;
end
solving_with_lu = toc

% solve n systems
tic
for i=1:n
    %i-th unit vector
    ei = zeros(n,1); ei(i) = 1;
    X2(:,i) = A\ei;
end
solving_directly = toc 

%Matlab's inverse
tic 
X3 = inv(A);
matlab_inv = toc

