% GRADIENT STEP function.
% It performs one step of gradient descent for theta parameters.
function [gradients] = gradient_step(X, y, theta, lambda)
    % X - training set.
    % y - training output values.
    % theta - model parameters.
    % lambda - regularization parameter.

    % Initialize number of training examples.
    m = length(y); 

    % Initialize variables we need to return. 
    gradients = zeros(size(theta));

    % Calculate hypothesis.
    predictions = hypothesis(X, theta);

    % Calculate regularization parameter.
    regularization_param = (lambda / m) * theta;

    % Calculate gradient steps.
    gradients = (1 / m) * (X' * (predictions - y)) + regularization_param;
    
    % We should NOT regularize the parameter theta_zero.
    gradients(1) = (1 / m) * (X(:, 1)' * (predictions - y));
end
