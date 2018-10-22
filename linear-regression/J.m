% Cost function.
% It shows how accurate our model is based on current model parameters.
function [cost] = J(X, y, theta)
    % X is input features - (m x n) matrix.
    % theta is our model parameters - (n x 1) vector.
    % y is a vector of correct output - (m x 1) vector.
    %
    % Where:
    % m - number of training examples,
    % n - number of features.

    % Get the size of the trainging set.
    m = size(X, 1);

    % Get the difference between predictions and correct output values.
    differences = h(X, theta) - y;

    % Calculate current predictions cost.
    cost = (1 / 2 * m) * differences' * differences;
end
