% Function performs data clustering using K-Means algorithm.
function [centroids, closest_centroids_ids] = k_means_train(X, K, max_iterations)
    % Init some useful variables.
    [m n] = size(X);

    % Generate random centroids based on training set.
    centroids = init_centroids(X, K);

    % Run K-Means.
    for i=1:max_iterations
        % Find the closest centroids for training examples.
        closest_centroids_ids = find_closest_centroids(X, centroids);

        % Compute means based on the closest centroids found in the previous part.
        centroids = compute_centroids(X, closest_centroids_ids, K);
    end
end
