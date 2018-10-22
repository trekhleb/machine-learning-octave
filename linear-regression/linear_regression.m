% LINEAR REGRESSION function.
function [theta mu sigma X_normalized J_history] = linear_regression(X, y, alpha, num_iterations)
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
    [theta, J_history] = gradient_descent(X_normalized, y, initial_theta, alpha, num_iterations);
end
