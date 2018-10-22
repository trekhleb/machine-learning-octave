% Hypothesis function.
% It predicts the output values y based on the input values X and model parameters.
function [predictions] = h(X, theta)
    % X is input features - (m x n) matrix.
    % theta is our model parameters - (n x 1) vector.
    % predictions are output values that a calculated based on model parameters - (m x 1) vector.
    %
    % Where:
    % m - number of training examples,
    % n - number of features.

    predictions = X * theta;
end
