function category = classifypoints(file, points)
%Reads parameters from file and classifies points into two
%categories, A or B. This file is created by netbp2.m.
%points is a matrix with two rows, where points(:,i) contains the
%(x,y) coordinates of point i.
%Returns vector category, where category(i) is 1 if
%points(1,i) >= points(2,i) and 0 otherwise.
load(file, 'W2','W3','W4','b2','b3','b4')
category = zeros(1,length(points));
for i=1:length(points)
    point =[points(1,i); points(2,i)];
    a2 = activate(point,W2,b2);
    a3 = activate(a2,W3,b3);
    a4 = activate(a3,W4,b4);
    if a4(1) >= a4(2)
        category(i) = 1;
    else
        category(i) = 0;
    end
end