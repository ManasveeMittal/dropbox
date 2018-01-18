X =[   1.0000    3.4572;
    1.0000    4.1961;
    1.0000    4.9350;
    1.0000    5.6739;
    1.0000    6.4128;
    1.0000    7.1517;
    1.0000    7.8906;
    1.0000    8.6295;
    1.0000    9.3684;
    1.0000   10.1073;
    1.0000   10.8462;
    1.0000   11.5851;
    1.0000   12.3241;
    1.0000   13.0630;
    1.0000   13.8019;
    1.0000   14.5408;
    1.0000   15.2797;
    1.0000   16.0186;
    1.0000   16.7575;
    1.0000   17.4964;
];

theta =[   0.50000;
  -0.50000
];


y =[   3.3480;
    4.5439;
    5.9972;
    7.3354;
    8.2459;
    8.6391;
    8.6955;
    8.7709;
    9.2115;
   10.1728;
   11.5389;
   12.9826;
   14.1363;
   14.7836;
   14.9724;
   14.9895;
   15.2115;
   15.9079;
   17.1010;
   18.5538
];

alpha = 0.01;

num_iters = 10;


function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
%J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

totalCost = 0;
for i = 1:rows(X)
  h = theta(1)*X(i,1) + theta(2)*X(i,2);
  squaredError = (h - y(i))^2;
  totalCost = totalCost + squaredError;
endfor

J = totalCost/(2*length(y));

% =========================================================================

end


function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    J_history(iter) = computeCost(X, y, theta);

    tempTheta = zeros(size(theta));
    error = X*theta - y;
    for i = 1:length(theta)
      tempTheta(i) = theta(i) - ((alpha/m) * sum(error .* X(:,i)));
    endfor
    theta = tempTheta

    % ============================================================


endfor

end

gradientDescent(X, y, theta, alpha, num_iters)