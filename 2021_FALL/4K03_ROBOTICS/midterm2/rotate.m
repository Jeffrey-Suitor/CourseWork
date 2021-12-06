function output = rotate(direction, degree)
% Create a rotation matrix specified by a direction and a degree

   if isnumeric(degree)
        s = sind(degree);
        c = cosd(degree);
   else 
        s = sin(degree);
        c = cos(degree);
   end

    switch (direction)
        case 'X'
            output = [1 0 0    0;
                      0 c -1*s 0;
                      0 s c    0;
                      0 0 0    1];
        case 'Y'
            output = [c    0 s 0;
                      0    1 0 0;
                      -1*s 0 c 0;
                      0    0 0 1];
        case 'Z'
            output = [c -1*s 0 0;
                      s c    0 0;
                      0 0    1 0;
                      0 0    0 1];
    end
end