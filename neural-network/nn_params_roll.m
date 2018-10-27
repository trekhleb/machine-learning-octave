% Rolls NN params vector into the matrix.
function nn_params_rolled = nn_params_roll(nn_params_unrolled, layers)
    % Calculate the total number of layers.
    L = length(layers);

    nn_params_rolled = {};
    unrolled_shift = 0;

    for layer_number=1:(L-1)
        L_in = layers(layer_number);
        L_out = layers(layer_number + 1);

        params_width = L_in + 1;  % We need to remember about bias unit.
        params_height = L_out;
        params_volume = params_height * params_width;

        % We need to remember about bias units when rolling up params.
        layer_params_unrolled = nn_params_unrolled((unrolled_shift + 1):(unrolled_shift + params_volume), 1);
        nn_params_rolled{layer_number} = reshape(layer_params_unrolled, params_height, params_width);

        unrolled_shift = unrolled_shift + params_volume;
    end
end
