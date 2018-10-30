% Computes the centroid memberships for every example.
% Returns the closest centroids in closest_centroids_ids for a dataset X where each row is a single example.
% closest_centroids_ids = m x 1 vector of centroid assignments (i.e. each entry in range [1..K]).
function closest_centroids_ids = find_closest_centroids(X, centroids)
    % Set m
    m = size(X, 1);

    % Set K
    K = size(centroids, 1);

    % We need to return the following variables correctly.
    closest_centroids_ids = zeros(m, 1);

    % Go over every example, find its closest centroid, and store
    % the index inside closest_centroids_ids at the appropriate location.
    % Concretely, closest_centroids_ids(i) should contain the index of the centroid
    % closest to example i. Hence, it should be a value in therange 1..K
    for i = 1:m
        distances = zeros(K, 1);
        for j = 1:K
            distances(j) = sum((X(i, :) - centroids(j, :)) .^ 2);
        end
        [min_distance, centroid_id] = min(distances);
        closest_centroids_ids(i) = centroid_id;
    end
end
