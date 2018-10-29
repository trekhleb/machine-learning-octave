% GRADIENT STEP function.
% Computes the cost and gradient of the neural network for unrolled theta parameters.
function [J gradients] = nn_gradient_step(nn_params_unrolled, layers, X, y, lambda)
    % Reshape nn_params back into the matrix parameters.
    nn_params = nn_params_roll(nn_params_unrolled, layers);

    % Compute the cost.
    J = nn_cost_function(nn_params, layers, X, y, lambda);

    % Do backpropagation.
    gradients = nn_backpropagation(nn_params, layers, X, y, lambda);
end
