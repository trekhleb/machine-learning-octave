% Predict the label of an input given a trained neural network.
function predictions = neural_network_predict(X, nn_params, layers)
    % Useful values
    m = size(X, 1);
    num_labels = size(nn_params{end}, 1);

    % Do feedforward propagation with trained NN params.
    h = nn_feedforward_propagation(X, nn_params, layers);

    % Return the index of the output neuron with the highest probability.
    [dummy, predictions] = max(h, [], 2);
end
