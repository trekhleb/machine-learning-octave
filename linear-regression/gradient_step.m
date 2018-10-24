% GRADIENT STEP function.
% Function performs one step of gradient descent for theta parameters.
function [theta] = gradient_step(X, y, theta, alpha)
    % Input:
    % X - training set of features - (m x n) matrix.
    % y - a vector of expected output values - (m x 1) vector.
    % theta - current model parameters - (n x 1) vector.
    % alpha - learning rate, the size of gradient step we need to take on each iteration.
    %
    % Output:
    % theta - optimized theta parameters - (m x 1) vector.
    % J_history - the history cost function changes over iterations.
    %
    % Where:
    % m - number of training examples,
    % n - number of features.

    % Get number of training examples.
    m = size(X, 1);

    % Predictions of hypothesis on all m examples.
    predictions = hypothesis(X, theta);

    % The difference between predictions and actual values for all m examples.
    difference = predictions - y;

    % Vectorized version of gradient descent.
    theta = theta - alpha * (1 / m) * (difference' * X)';
end
