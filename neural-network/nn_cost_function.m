% COST FUNCTION.
% Computes the cost and gradient of the neural network.
% The parameters for the neural network are "unrolled" into the vector nn_params_unrolled and 
% need to be converted back into the weight matrices. 
function [J grad] = nn_cost_function(nn_params_unrolled, layers, X, y, lambda)
    % Calculate the total number of layers.
    L = length(layers);

    % Calculate total number of training examples.
    m = size(X, 1);

    % Calculate the size of output layer (number of labels).
    num_labels = layers(end);

    % Reshape nn_params back into the matrix parameters.
    nn_params = nn_params_roll(nn_params_unrolled, layers);
            
    % % You need to return the following variables correctly 
    % J = 0;
    % Theta1_grad = zeros(size(Theta1));
    % Theta2_grad = zeros(size(Theta2));

    % % Part 2: Implement the backpropagation algorithm to compute the gradients
    % %         Theta1_grad and Theta2_grad. You should return the partial derivatives of
    % %         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
    % %         Theta2_grad, respectively. After implementing Part 2, you can check
    % %         that your implementation is correct by running checkNNGradients
    % %
    % %         Note: The vector y passed into the function is a vector of labels
    % %               containing values from 1..K. You need to map this vector into a 
    % %               binary vector of 1's and 0's to be used with the neural network
    % %               cost function.
    % %
    % %         Hint: We recommend implementing backpropagation using a for-loop
    % %               over the training examples if you are implementing it for the 
    % %               first time.
    % %
    % % Part 3: Implement regularization with the cost function and gradients.
    % %
    % %         Hint: You can implement this around the code for
    % %               backpropagation. That is, you can compute the gradients for
    % %               the regularization separately and then add them to Theta1_grad
    % %               and Theta2_grad from Part 2.
    % %

    % Feedforward the neural network ------------------------------------------
    h = nn_feedforward_propagation(X, y, nn_params, layers);

    % Compute the cost --------------------------------------------------------

    % For now y is just an expected number for each input example (5000 x 1).
    % We need to convert every result from number to vector that will illustrate 
    % the output we're expecting. For example instead of having just number 5
    % we want to expect [0 0 0 0 1 0 0 0 0 0]. The bit is set for 5th position.
    y_vectors = zeros(m, num_labels); % (5000 x 10)
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


    % Do backpropagation -------------------------------------------------------
    for i=1:m
        % Setup input layer activations.
        a = [1; X(i, :)'];

        % Perform a feedforward pass for current training example.
        for layer_number=1:(L-1)
            layer_theta = nn_params{layer_number};
            z = layer_theta * a;
            a_next = [1; sigmoid(z)];
            a = a_next;
        end

        % Remove bias units from the output activations.
        a_output = a(2:end, :);

        % Calculate deltas.
        % For input layer we don't calculate delta because we do not associate error with the input.
        delta = {};

        % Convert the y output from number to vector (i.e. 5 to [0; 0; 0; 0; 1; 0; 0; 0; 0; 0])
        y_vector = (1:num_labels == y(i))';

        % Calculate deltas for the output layer.
        delta{L} = a_output - y_vector;

        % Calculate deltas for hidden layers.
        for layer_number=1:(L-2)
            % The loops should go for the layers L, L-1, ..., 2.
            backward_layer_number = L - layer_number;
            layer_theta = nn_params{backward_layer_number};
            next_delta = delta{backward_layer_number + 1};

            % delta{backward_layer_number} = (layer_theta' * next_delta) .* 
        end
    end

    % for t = 1:m

    %     % Calculate deltas for hidden layer (l=2).
    %     delta_2 = (Theta2' * delta_3) .* [1; sigmoidGradient(z2)];
    %     delta_2 = delta_2(2:end); % Take off the bias row. (25 x 1)

    %     % delta_1 is not calculated because we do not associate error with the input.

    %     % Accumulate the gradient (update big deltas).
    %     Theta1_grad = Theta1_grad + delta_2 * a1'; % (25 x 401) + (25 x 1) * (401 x 1)' = (25 x 401)
    %     Theta2_grad = Theta2_grad + delta_3 * a2'; % (10 x 26) + (10 x 1) * (26 x 1)' = (10 x 26)
    % end

    % % Obtain the (unregularized) gradient for the neural network cost function.
    % % Remember that we should NOT be regularizing the first column of theta.

    % reg_param1 = (lambda / m) * [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)]; % (25 x 401)
    % reg_param2 = (lambda / m) * [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)]; % (25 x 401)

    % Theta1_grad = (1 / m) * Theta1_grad + reg_param1; % (25 x 401)
    % Theta2_grad = (1 / m) * Theta2_grad + reg_param2; % (10 x 26)

    % % =========================================================================

    % % Unroll gradients
    % grad = [Theta1_grad(:) ; Theta2_grad(:)];
end
