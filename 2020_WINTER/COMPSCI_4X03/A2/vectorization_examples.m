A(1,:) = 1:4;
A(2,:) = 5:8;
A(3,:) = 9:12;
A(4,:) = 13:16;
A
% swap rows 1 and 3
A([1 3],:) = A([3 1],:)
% max in column 2 starting from entry 2
max(A(2:4,2))

v = 1:5
%swap entries 1 and 4 in v
v([1 4]) = v([4 1])

% Multiply row 1 of A by 0.1
A(1,:) = 0.1*A(1,:)

% Divide column 2 of A by 10
A(:,2) = A(:,2)./10

% Get submatrix of A 
S1 = A(2:end, 3:end)
% and another one
S2 = A(2:4, :)

v = [ 2 1 3 4];
A
%permute the rows of A
A1 = A(v,:)
%or the columns
A2 = A(:,v)

% identity matirx
I = eye(4)
% permute its rows
I(v,:)

