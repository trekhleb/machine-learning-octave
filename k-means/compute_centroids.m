% Returns the new centroids by computing the means of the data points assigned to each centroid.
function centroids = compute_centroids(X, closest_centroids_ids, K)
    % Useful variables
    [m n] = size(X);

    % We need to return the following variables correctly.
    centroids = zeros(K, n);

    % Go over every centroid and compute mean of all points that
    % belong to it. Concretely, the row vector centroids(i, :)
    % should contain the mean of the data points assigned to
    % centroid i.
    for centroid_id = 1:K
        centroids(centroid_id, :) = mean(X(closest_centroids_ids == centroid_id, :));
    end
end
