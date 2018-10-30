% LINEAR REGRESSION function.
function [theta mu sigma X_normalized J_history] = linear_regression_train(X, y, alpha, lambda, num_iterations)
    % X - training set.
    % y - training set output values.
    % alpha - learning rate (gradient descent step size).
    % lambda - regularization parameter.
    % num_iterations - number of gradient descent steps.

    % Calculate the number of training examples.
    m = size(y, 1);

    % Calculate the number of features.
    n = size(X, 2);

    % Normalize features.
    [X_normalized mu sigma] = feature_normalize(X);

    % Add a column of ones to X.
    X_normalized = [ones(m, 1), X_normalized];

    % Initialize model parameters.
    initial_theta = zeros(n + 1, 1);

    % Run gradient descent.
    [theta, J_history] = gradient_descent(X_normalized, y, initial_theta, alpha, lambda, num_iterations);
end
