% GRADIENT STEP function.
% Function performs one step of gradient descent for theta parameters.
function [theta] = gradient_step(X, y, theta, alpha, lambda)
    % Input:
    % X - training set of features - (m x n) matrix.
    % y - a vector of expected output values - (m x 1) vector.
    % theta - current model parameters - (n x 1) vector.
    % alpha - learning rate, the size of gradient step we need to take on each iteration.
    % lambda - regularization parameter.
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

    % Calculate regularization parameter.
    regularization_param = 1 - alpha * lambda / m;

    % Vectorized version of gradient descent.
    theta = theta * regularization_param - alpha * (1 / m) * (difference' * X)';

    % We should NOT regularize the parameter theta_zero.
    theta(1) = theta(1) - alpha * (1 / m) * (X(:, 1)' * difference)';
end
