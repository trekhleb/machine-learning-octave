% Initialization
clear; close all; clc;

% Load the data.
fprintf('Loading data...\n');
load('servers_params.mat');

% Estimate mu and sigma2.
fprintf('Estimating mu and sigma2...\n');
[mu sigma2] = estimate_gaussian(X);

% Visualize the fit.
fprintf('Visualizing data and Gaussian distribution...\n');
visualize_fit(X,  mu, sigma2);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');
title('Servers Parameters');

% Returns the density of the multivariate normal at each data point (row) of X.
probabilities = multivariate_gaussian(X, mu, sigma2);

% Select best threshold.
fprintf('Selecting a best threshold...\n');
[epsilon F1] = select_threshold(yval, probabilities);

fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);

% Plottin outliers.
fprintf('Plottin outliers...\n');

%  Find the outliers in the training set and plot them.
outliers = find(probabilities < epsilon);

%  Draw a red circle around those outliers
hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
legend('Training set', 'Gaussian contour', 'Anomalies');
hold off
