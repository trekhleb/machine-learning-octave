% Creates a small neural network to check the backpropagation gradients.
% It will output the analytical gradients
% produced by your backprop code and the numerical gradients (computed
% using computeNumericalGradient). These two gradient computations should
% result in very similar values.
function debug_nn_gradients(lambda)
    input_layer_size = 3;
    hidden_layer_size = 5;
    num_labels = 3;
    m = 5;

    layers = [
        input_layer_size,
        hidden_layer_size,
        num_labels
    ];

    % We generate some 'random' test data.
    Theta1 = debug_initialize_weights(hidden_layer_size, input_layer_size);
    Theta2 = debug_initialize_weights(num_labels, hidden_layer_size);

    % Reusing debug_initialize_weights to generate X.
    X  = debug_initialize_weights(m, input_layer_size - 1);
    y  = 1 + mod(1:m, num_labels)';

    % Unroll parameters
    nn_params_unrolled = [Theta1(:); Theta2(:)];

    % Short hand for cost function
    gradient_step = @(p) nn_gradient_step(p, layers, X, y, lambda);

    [cost, grad] = gradient_step(nn_params_unrolled);
    numgrad = debug_numerical_gradient(gradient_step, nn_params_unrolled);

    % Visually examine the two gradient computations.  The two columns
    % you get should be very similar. 
    disp([numgrad grad]);
    fprintf(['The above two columns you get should be very similar.\n' ...
            '(Left - Your Numerical Gradient, Right - Analytical Gradient)\n\n']);

    % Evaluate the norm of the difference between two solutions.  
    % If you have a correct implementation, and assuming you used EPSILON = 0.0001 
    % in debug_numerical_gradient.m, then diff below should be less than 1e-9.
    diff = norm(numgrad - grad) / norm(numgrad + grad);

    fprintf(['If your backpropagation implementation is correct, then \n' ...
            'the relative difference will be small (less than 1e-9). \n' ...
            '\nRelative Difference: %g\n'], diff);
end
