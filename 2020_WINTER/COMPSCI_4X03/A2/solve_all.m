function [xm, xpp, xspp] = solve_all(A,b)
xm = A\b;

[n, m] = size(A);

if n ~= m
    disp("ERROR: Matrix not N x N")
    return
end

[L,U,P] = lu_pp(A);

inv_P = inv(P);
B = b;
for i=1:n-1
    max_value=max(abs(inv_P(i:n,i))); % Find the pivot row
    for j=i:n
        if(abs(inv_P(j,i))== max_value)
            swap_index=j;  % Get the swap index
            break;
        end
    end
    
    inv_P([i,swap_index],:) = inv_P([swap_index,i],:);
    B([i,swap_index],:) = B([swap_index,i],:);
    
end

    [LS,US,PS] = lu_spp(A);
    inv_PS = inv(PS);
    BS = b;
    for i=1:n-1
        max_value=max(abs(inv_PS(i:n,i))); % Find the pivot row
        for j=i:n
            if(abs(inv_PS(j,i))== max_value)
                swap_index=j;  % Get the swap index
                break;
            end
        end
        
        inv_PS([i,swap_index],:) = inv_PS([swap_index,i],:);
        BS([i,swap_index],:) = BS([swap_index,i],:);
        
        
        
    end
    xpp = lu_solve(L,U,B);
    xspp = lu_solve(LS,US,BS);
end