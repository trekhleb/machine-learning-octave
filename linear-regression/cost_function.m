% COST function.
% It shows how accurate our model is based on current model parameters.
function [cost] = cost_function(X, y, theta, lambda)
    % Input:
    % X - input features - (m x n) matrix.
    % theta - our model parameters - (n x 1) vector.
    % y - a vector of correct output - (m x 1) vector.
    % lambda - regularization parameter.
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

    % Calculate regularization parameter.
    % Remember that we should not regularize the parameter theta_zero.
    theta_cut = theta(2:end, 1);
    regularization_param = lambda * (theta_cut' * theta_cut);

    % Calculate current predictions cost.
    cost = (1 / 2 * m) * (differences' * differences + regularization_param);
end
