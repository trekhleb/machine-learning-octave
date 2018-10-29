% BACKPROPAGATION FUNCTION. 
function gradients = nn_backpropagation(nn_params, layers, X, y, lambda)
    % Calculate the total number of layers.
    L = length(layers);

    % Calculate total number of training examples.
    m = size(X, 1);

    % Calculate the size of output layer (number of labels).
    num_labels = layers(end);

    % Initialize big delta - aggregated delta values for all training examples that will indicate
    % how exact theta need to be changed.
    Delta = {};
    for layer_number=1:(L-1)
        L_in = layers(layer_number);
        L_out = layers(layer_number + 1);
        Delta{layer_number} = zeros(L_out, L_in + 1);
    end

    for i=1:m
        % We will store "z" and "a" values for each layer in order to re-use it later.
        Z = {};
        A = {};

        % Setup input layer activations.
        a = [1; X(i, :)'];
        A{1} = a;

        % Perform a feedforward pass for current training example.
        for layer_number=1:(L-1)
            layer_theta = nn_params{layer_number};
            z = layer_theta * a;
            a_next = [1; sigmoid(z)];
            a = a_next;

            Z{layer_number + 1} = z;
            A{layer_number + 1} = a;
        end

        % Remove bias units from the output activations.
        a_output = a(2:end, :);

        % Calculate deltas.
        % For input layer we don't calculate delta because we do not associate error with the input.
        delta = {};

        % Convert the y output from number to vector (i.e. 5 to [0; 0; 0; 0; 1; 0; 0; 0; 0; 0])
        y_vector = (1:num_labels == y(i))';

        % Calculate deltas for the output layer for current training example.
        delta{L} = a_output - y_vector;

        % Calculate small deltas for hidden layers for current training example.
        for layer_number=1:(L-2)
            % The loops should go for the layers L, L-1, ..., 2.
            backward_layer_number = L - layer_number;
            
            layer_theta = nn_params{backward_layer_number};
            next_delta = delta{backward_layer_number + 1};
            layer_z = Z{backward_layer_number};

            delta{backward_layer_number} = (layer_theta' * next_delta) .* [1; sigmoid_gradient(layer_z)];
            % Take off the bias row.
            delta{backward_layer_number} = delta{backward_layer_number}(2:end);
        end

        % Accumulate the gradient (update big deltas)
        for layer_number=1:(L-1)
            Delta{layer_number} = Delta{layer_number} + delta{layer_number + 1} * A{layer_number}';
        end
    end

    % Obtain the (unregularized) gradient for the neural network cost function.
    % Remember that we should NOT be regularizing the first column of theta.
    regularization_params = {};
    for layer_number=1:(L-1)
        current_Delta = Delta{layer_number};
        regularization_params{layer_number} = (lambda / m) * [zeros(size(current_Delta, 1), 1) current_Delta(:, 2:end)];
    end

    for layer_number=1:(L-1)
        Delta{layer_number} = (1 / m) * Delta{layer_number} + regularization_params{layer_number};
    end

    % Unroll gradients.
    gradients = unroll(Delta);
end
