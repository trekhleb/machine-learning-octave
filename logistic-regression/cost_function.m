% COST function.
% It shows how accurate our model is based on current model parameters.
% It computes cost and gradient for logistic regression with regularization.
function [J, grad] = cost_function(X, y, theta, lambda)
    % Initialize number of training examples.
    m = length(y); 

    % Initialize variables we need to return. 
    cost = 0;
    grad = zeros(size(theta));

    % Calculate hypothesis.
    predictions = hypothesis(X * theta);

    % Calculate regularization parameter.
    % Remmber that we should not regularize the parameter theta_zero.
    theta_cut = theta(2:end, 1);
    regularized_param = (lambda / (2 * m)) * (theta_cut' * theta_cut);
    
    % Calculate cost function.
    J = (-1 / m) * (y' * log(predictions) + (1 - y)' * log(1 - predictions)) + regularized_param;

    % Calculate gradient steps.
    regularized_grad_param = (lambda / m) * theta;
    grad = (1 / m) * (X' * (h - y)) + regularized_grad_param;
    grad(1) = (1 / m) * (X(:, 1)' * (h - y)); % we should not regularize the parameter theta_zero
end
