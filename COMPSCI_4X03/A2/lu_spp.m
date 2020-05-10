function [L, U, P] = lu_spp(A)

[m, n] = size(A);

if n ~= m
    disp("ERROR: Matrix not N x N")
    return
end

% Create matrices
L=eye(n);
P=eye(n);
U=A;
ratio_vector = max(abs(A'));  % Create the ratio vector

for i=1:n-1
    temp = U;
    div_temp = temp ./ ratio_vector'; % Divide the matrix by the transpose of this vector
    
    max_value=max(abs(div_temp(i:n,i))); % Find the mmax column value
    for j=i:n
        if(abs(div_temp(j,i))== max_value)
            swap_index=j;  % Get the swap index
            break;
        end
    end
    
    % Swap rows in matrix
    U([i,swap_index],i:n) = U([swap_index,i],i:n);
    L([i,swap_index],1:i-1) = L([swap_index,i],1:i-1);
    P([i,swap_index],:) = P([swap_index,i],:);
    
    % Elimination
    for j=i+1:n
        L(j,i)=U(j,i)/U(i,i);
        U(j,i:n)=U(j,i:n)-L(j,i)*U(i,i:n);
    end
end
end