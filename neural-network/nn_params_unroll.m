% Unrolls NN params matrix into the vector.
function nn_params_unrolled = nn_params_unroll(nn_params)
    % Calculate the total number of parametrized layers.
    layers_count = length(nn_params);
    nn_params_unrolled = []; % Vectorized version of Theta.
    for layer_number=1:layers_count        
        % Unroll parameters into vector form.
        nn_params_unrolled = [nn_params_unrolled; nn_params{layer_number}(:)];
    end
end
