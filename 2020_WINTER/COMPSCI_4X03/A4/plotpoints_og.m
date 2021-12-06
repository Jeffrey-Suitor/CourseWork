function plotpoints(trainpoints, labels, points, categories,neurons, lr)
%Plots training data and classified points.
%trainpoints(:,i) contains x,y coordinates of training point i
%labels(:,i) = [1;0], category A, or [0;1], category B.
%points(:,i) contain x,y coordinates.
%categories(i) is 1 if points(:,i) is in category A,  and 0 if category B
%neurons is a vector of size 2. neurons(1) is the number of neurons
%in layer 3 and neurons(2) is number of neurons in layer 4.
%lr is learning rate

%indices of points in categories A and B
A = find(categories == 1);
B = find(categories == 0);

%plot A and B points
h1 = plot(points(1,A), points(2,A), 'y.');
hold on
h2 = plot( points(1,B), points(2,B), 'm.');

%plot the training points
category = labels(1,:) >= labels(2,:);
A = find(category == 1);
B = find(category == 0);

h3 = plot(trainpoints(1,A),  trainpoints(2,A), 'bo','LineWidth', 2);
h4 = plot(trainpoints(1,B),  trainpoints(2,B), 'bx','LineWdith', 2);

legend([h1,h2,h3,h4],'A yellow','B magenta','train A','train B', ...
    'Location', 'NorthWest')

xlim([0,1])
ylim([0,1])
title(sprintf('neurons 2,%d,%d,2, learning rate %g\n',...
    neurons(1), neurons(2), lr));
set(gca,'FontSize', 14);




