% GRADIENT CALLBACK function.
% This function is used as a callback function for fminunc and it aggregates
% cost and gradient values.
function [cost, gradients] = gradient_callback(X, y, theta, lambda)
    % X - training set.
    % y - training output values.
    % theta - model parameters.
    % lambda - regularization parameter.

    % Calculate cost function.
    cost = cost_function(X, y, theta, lambda);

    % Do one gradient step.
    gradients = gradient_step(X, y, theta, lambda);
end
