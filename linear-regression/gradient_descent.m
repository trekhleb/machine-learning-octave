% GRADIENT DESCENT function.
% It calculates what steps (deltas) should be taken for each theta parameter in
% order to minimize the cost function.
function [theta, J_history] = gradient_descent(X, y, theta, alpha, lambda, num_iterations)
    % Input:
    % X - training set of features - (m x n) matrix.
    % y - a vector of expected output values - (m x 1) vector.
    % theta - current model parameters - (n x 1) vector.
    % alpha - learning rate, the size of gradient step we need to take on each iteration.
    % lambda - regularization parameter.
    % numb_iterations - number of iterations we will take for gradient descent.
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

    % Initialize J_history with zeros.
    J_history = zeros(num_iterations, 1);

    for iteration = 1:num_iterations
        % Perform a single gradient step on the parameter vector theta.
        theta = gradient_step(X, y, theta, alpha, lambda);

        % Save the cost J in every iteration.  
        J_history(iteration) = cost_function(X, y, theta, lambda);
    end
end
