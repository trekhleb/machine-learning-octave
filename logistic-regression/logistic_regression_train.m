% LOGISTIC REGRESSION function.
% Calculate the optimal thetas for given training set and output values.
function [theta, J, J_history, exit_flag] = logistic_regression_train(X, y, lambda)
    % X - training set.
    % y - training output values.
    % lambda - regularization parameter.

    % Calculate the number of training examples.
    m = size(y, 1);

    % Calculate the number of features.
    n = size(X, 2);

    % Add a column of ones to X.
    X = [ones(m, 1), X];

    % Initialize model parameters.
    initial_theta = zeros(n + 1, 1);

    % Run gradient descent.
    [theta, J, exit_flag] = gradient_descent(X, y, initial_theta, lambda);

    % Record the history of chaning J.
    J_history = zeros(1, 1);
    J_history(1) = cost_function(X, y, initial_theta, lambda);
    J_history(2) = cost_function(X, y, theta, lambda);
end
