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

    % % Calculate regularization parameter.
    % reg = (lambda / (2 * m)) * (sum(sum(Theta1(:, 2:end) .^ 2)) + sum(sum(Theta2(:, 2:end) .^ 2)));

    % J = (-1 / m) * sum(sum((log(h) .* y_vectors + log(1 - h) .* (1 - y_vectors)))) + reg;


    % % Do back propagation -----------------------------------------------------

    % for t = 1:m
    %     % Perform a feedforward pass.

    %     % Input layer (l=1).
    %     a1 = [1; X(t,:)']; % (401 x 1)
        
    %     % Hidden layer (l=2).
    %     z2 = Theta1 * a1; % (25 x 401) * (401 x 1) = (25 x 1)
    %     a2 = [1; sigmoid(z2)]; % (26 x 1)

    %     % Output layer (l=3).
    %     z3 = Theta2 * a2; % (10 x 26) * (26 x 1) = (10 x 1)
    %     a3 = sigmoid(z3); % (10 x 1)

    %     % Calculate deltas.

    %     % Convert the y output from number to vector (i.e. 5 to [0; 0; 0; 0; 1; 0; 0; 0; 0; 0])
    %     y_vector = (1:num_labels == y(t))';

    %     % Calculate deltas for the output layer (l=3).
    %     delta_3 = a3 - y_vector; % (10 x 1)

    %     % Calculate deltas for hidden layer (l=2).
    %     delta_2 = (Theta2' * delta_3) .* [1; sigmoidGradient(z2)]; % (10 x 26)' * (10 x 1) .* (26 x 1) = (26 x 1)
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
