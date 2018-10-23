% HYPOTHESIS function.
% It predicts the output values y based on the input values X and model parameters.
function [predictions] = hypothesis(X, theta)
    % Input:
    % X - input features - (m x n) matrix.
    % theta - our model parameters - (n x 1) vector.
    %
    % Output:
    % predictions - output values that a calculated based on model parameters - (m x 1) vector.
    %
    % Where:
    % m - number of training examples,
    % n - number of features.

    predictions = sigmoid(X * theta);
end
