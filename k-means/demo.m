% Initialization
clear; close all; clc;

% Clustering Set #1 ---------------------------------------------------------------------

% Loading the data.
fprintf('Loading the data set #1...\n');
load('set1.mat');

% Plotting the data.
fprintf('Plotting the data set #1...\n');
subplot(2, 2, 1);
plot(X(:, 1), X(:, 2), 'k+','LineWidth', 1, 'MarkerSize', 7);
title('Training Set #1');

% Training K-Means.
fprintf('Training K-Means for data set #1...\n');
K = 3; % Number of centroids.
max_iterations = 20; % How many iterations we will do to find optimal centroids positions.
[centroids, closest_centroids_ids] = k_means_train(X, K, max_iterations);

% Plotting clustered data.
fprintf('Plotting clustered data for data set #1...\n');
subplot(2, 2, 2);
for k=1:K
    % Plotting the cluster.
    cluster_x = X(closest_centroids_ids == k, :);
    plot(cluster_x(:, 1), cluster_x(:, 2), '+');
    hold on;

    % Plotting centroid.
    centroid = centroids(k, :);
    plot(centroid(:, 1), centroid(:, 2), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
    hold on;
end
title('Clustered Set #1');
hold off;

% Clustering Set #2 ---------------------------------------------------------------------

% Loading the data.
fprintf('Loading the data set #2...\n');
load('set2.mat');

% Plotting the data.
fprintf('Plotting the data set #2...\n');
subplot(2, 2, 3);
plot(X(:, 1), X(:, 2), 'k+','LineWidth', 1, 'MarkerSize', 7);
title('Training Set #2');

% Training K-Means.
fprintf('Training K-Means for data set #2...\n');
K = 3; % Number of centroids.
max_iterations = 20; % How many iterations we will do to find optimal centroids positions.
[centroids, closest_centroids_ids] = k_means_train(X, K, max_iterations);

% Plotting clustered data.
fprintf('Plotting clustered data for data set #2...\n');
subplot(2, 2, 4);
for k=1:K
    % Plotting the cluster.
    cluster_x = X(closest_centroids_ids == k, :);
    plot(cluster_x(:, 1), cluster_x(:, 2), '+');
    hold on;

    % Plotting centroid.
    centroid = centroids(k, :);
    plot(centroid(:, 1), centroid(:, 2), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
    hold on;
end
title('Clustered Set #2');
hold off;
