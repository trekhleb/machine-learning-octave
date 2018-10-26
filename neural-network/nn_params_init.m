% Randomly initialize the weights for each neural network layer.
% Each layer will have its own theta matrix W with L_in incoming connections and L_out outgoing connections.
% Note that W will be set to a matrix of size(L_out, 1 + L_in) as the first column of W handles the "bias" terms.
function nn_params = nn_params_init(layers, epsilon)
    % Get number of layers.
    L = length(layers);

    % Generate initial thetas for each layer.
    nn_params = {}; % Matrix version of Theta.

    % Generate Thetas only for input and hidden layers.
    % There is no need to generate Thetas for the output layer.
    for layer_number=1:(L-1)
        L_in = layers(layer_number);
        L_out = layers(layer_number + 1);
        nn_params{layer_number} = rand(L_out, L_in + 1) * 2 * epsilon - epsilon;
    end
end
