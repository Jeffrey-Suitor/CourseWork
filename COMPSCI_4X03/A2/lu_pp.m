function [L, U, P] = lu_pp(A)

[m, n] = size(A);

if n ~= m
    disp("ERROR: Matrix not N x N")
    return
end

% Create matrices
L=eye(n);
P=eye(n);
U=A;

for i=1:n-1
    max_value=max(abs(U(i:n,i))); % Find the pivot row
    for j=i:n
        if(abs(U(j,i))== max_value)
            swap_index=j;  % Get the swap index
            break;
        end
    end
    
    % Swap rows in matrix
    U([i,swap_index],i:n) = U([swap_index,i],i:n);
    L([i,swap_index],1:i-1) = L([swap_index,i],1:i-1);
    P([i,swap_index],:) = P([swap_index,i],:);
    
    % Gaussian elimination
    for j=i+1:n
        L(j,i)=U(j,i)/U(i,i);
        U(j,i:n)=U(j,i:n)-L(j,i)*U(i,i:n);
    end
end
end