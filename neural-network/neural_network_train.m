% NEURAL NETWORK function.
function [nn_params, cost] = neural_network_train(X, y, layers, lambda, epsilon, max_iterations)
    % The range for initial theta values.
    nn_params = nn_params_init(layers, epsilon);

    % Unroll parameters matrix into vector.
    nn_params_unrolled_initial = unroll(nn_params);

    % Value to see how more training helps.
    options = optimset('MaxIter', max_iterations);

    % Create "short hand" for the gradient step function to be minimized.
    gradient_step = @(p) nn_gradient_step(p, layers, X, y, lambda);

    % Now, gradient_step is a function that takes in only one argument (the neural network parameters).
    [nn_params_unrolled, cost] = fmincg(gradient_step, nn_params_unrolled_initial, options);

    % Roll nn_params.
    nn_params = nn_params_roll(nn_params_unrolled, layers);
end
