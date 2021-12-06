function  cost = netbp2(neurons, data, labels, niter, lr, file)
% Complete
%lr is learning rate
%niter is maximum number of iterations
%save(file, 'W2','W3','W4','b2','b3','b4')
%cost is a vector storing the value of the cost function 
%after each iteration; i.e. cost(j) is the cost at iteration j
%data is a matrix with two rows.  data(:,i) contains
%the (x,y) coordinates of point i.
%file is a filename where the file is created by 
%Trains a neural network with 4 layers.
%Layer 1 has 2 neurons, layer 2 has neurons(1),
%layer 3 has neurons(2), and layer 4 has 2 neurons
%labels is a matrix with two rows. labels(:,i) is [1;0] 
%if data(:,i) is in category A and [0;1] if it is in category B.


% Initialize weights and biases 
rng(5000);
W2 = 0.5*randn(neurons(1),2); W3 = 0.5*randn(neurons(2),neurons(1)); W4 = 0.5*randn(2,neurons(2));
b2 = 0.5*randn(neurons(1),1); b3 = 0.5*randn(neurons(2),1); b4 = 0.5*randn(2,1);

% Forward and Back propagate 
cost = zeros(niter,1); % value of cost function at each iteration
for counter = 1:niter
    k = randi(length(data));         % choose a training point at random
    point = [data(1,k); data(2,k)];
    % Forward pass
    a2 = activate(point,W2,b2);
    a3 = activate(a2,W3,b3);
    a4 = activate(a3,W4,b4);
    % Backward pass
    delta4 = a4.*(1-a4).*(a4-labels(:,k));
    delta3 = a3.*(1-a3).*(W4'*delta4);
    delta2 = a2.*(1-a2).*(W3'*delta3);
    % Gradient step
    W2 = W2 - lr*delta2*point';
    W3 = W3 - lr*delta3*a2';
    W4 = W4 - lr*delta4*a3';
    b2 = b2 - lr*delta2;
    b3 = b3 - lr*delta3;
    b4 = b4 - lr*delta4;
    
    % Save Cost
    cost(counter) = get_cost(W2,W3,W4,b2,b3,b4);
    
end

% Show decay of cost function  
save(file, 'W2','W3','W4','b2','b3','b4', 'cost')

  function costval = get_cost(W2,W3,W4,b2,b3,b4)
     costvec = zeros(length(data),1); 
     for i = 1:length(data)
         point =[data(1,i); data(2,i)];
         a2 = activate(point,W2,b2);
         a3 = activate(a2,W3,b3);
         a4 = activate(a3,W4,b4);
         costvec(i) = norm(labels(:,i) - a4,2);
     end
     costval = norm(costvec,2)^2;
  end % of nested function

end
