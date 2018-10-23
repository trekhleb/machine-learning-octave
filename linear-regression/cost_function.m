% COST function.
% It shows how accurate our model is based on current model parameters.
function [cost] = cost_function(X, y, theta)
    % Input:
    % X - input features - (m x n) matrix.
    % theta - our model parameters - (n x 1) vector.
    % y - a vector of correct output - (m x 1) vector.
    %
    % Output:
    % cost - number that represents the cost (error) of our model with specified parameters theta.
    %
    % Where:
    % m - number of training examples,
    % n - number of features.

    % Get the size of the trainging set.
    m = size(X, 1);

    % Get the difference between predictions and correct output values.
    differences = hypothesis(X, theta) - y;

    % Calculate current predictions cost.
    cost = (1 / 2 * m) * differences' * differences;
end
