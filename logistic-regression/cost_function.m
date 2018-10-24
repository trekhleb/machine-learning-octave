% COST function.
% It shows how accurate our model is based on current model parameters.
function [cost] = cost_function(X, y, theta, lambda)
    % X - training set.
    % y - training output values.
    % theta - model parameters.
    % lambda - regularization parameter.

    % Initialize number of training examples.
    m = length(y); 

    % Calculate hypothesis.
    predictions = hypothesis(X, theta);

    % Calculate regularization parameter.
    % Remmber that we should not regularize the parameter theta_zero.
    theta_cut = theta(2:end, 1);
    regularization_param = (lambda / (2 * m)) * (theta_cut' * theta_cut);
    
    % Calculate cost function.
    cost = (-1 / m) * (y' * log(predictions) + (1 - y)' * log(1 - predictions)) + regularization_param;
end
