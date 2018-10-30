% Initializes K centroids that are to be used in K-Means on the dataset X.
function centroids = init_centroids(X, K)
    % Randomly reorder the indices of examples
    random_ids = randperm(size(X, 1));

    % Take the first K examples as centroids
    centroids = X(random_ids(1:K), :);
end
