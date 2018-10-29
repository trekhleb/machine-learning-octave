% COST FUNCTION.
% Computes the cost of the neural network.
function J = nn_cost_function(nn_params, layers, X, y, lambda)
    % Calculate the total number of layers.
    L = length(layers);

    % Calculate total number of training examples.
    m = size(X, 1);

    % Calculate the size of output layer (number of labels).
    num_labels = layers(end);

    % Feedforward the neural network
    h = nn_feedforward_propagation(X, nn_params, layers);

    % Compute the cost.

    % For now y is just an expected number for each input example (5000 x 1).
    % We need to convert every result from number to vector that will illustrate 
    % the output we're expecting. For example instead of having just number 5
    % we want to expect [0 0 0 0 1 0 0 0 0 0]. The bit is set for 5th position.
    y_vectors = zeros(m, num_labels);
    for i = 1:m
        y_vectors(i, y(i)) = 1;
    end

    % Calculate regularization parameter.
    theta_square_sum = 0;
    for layer_number=1:(L-1)
        layer_theta = nn_params{layer_number};
        % Don't try to regularize bias thetas.
        theta_square_sum = theta_square_sum + sum(sum(layer_theta(:, 2:end) .^ 2));
    end

    regularization_param = (lambda / (2 * m)) * theta_square_sum;

    % Calculate the cost with regularization.
    J = (-1 / m) * sum(sum((y_vectors .* log(h) + (1 - y_vectors) .* log(1 - h)))) + regularization_param;
end
