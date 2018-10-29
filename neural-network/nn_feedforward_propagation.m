% FEEDFORWARD PROPAGATION of the neural network.
function h = nn_feedforward_propagation(X, nn_params, layers)
    % Calculate the total number of layers.
    L = length(layers);

    % Calculate the number of training examples.
    m = size(X, 1);

    % Input layer (l=1).
    a = [ones(m, 1), X];

    % Hidden layers.
    for layer_number=1:(L-1)
        theta = nn_params{layer_number};
        z = a * theta';
        a_next = sigmoid(z);
        % Add bias units.
        a_next = [ones(m, 1), a_next];
        a = a_next;
    end

    % Output layer should not contain bias units.
    h = a(:, 2:end);
end
