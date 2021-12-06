function output = remove_zero_rows(matrix) 
    temp = matrix;
    index = find(all(temp == 0,2));
    temp(index, :) = [];
    output = temp;
end