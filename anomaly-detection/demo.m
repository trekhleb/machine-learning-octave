% Initialization
clear; close all; clc;

% The following command loads the dataset. You should now have the
% variables X, Xval, yval in your environment
load('./data/servers_params.mat');

%  Visualize the example dataset
plot(X(:, 1), X(:, 2), 'bx');
axis([0 30 0 30]);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');
title('Servers Parameters');

%  Estimate my and sigma2
[mu sigma2] = estimate_gaussian(X);

%  Visualize the fit
visualize_fit(X,  mu, sigma2);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');

%  Returns the density of the multivariate normal at each data point (row) of X.
pval = multivariate_gaussian(X, mu, sigma2);

[epsilon F1] = select_threshold(yval, pval);
fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
fprintf('   (you should see a value epsilon of about 8.99e-05)\n');
fprintf('   (you should see a Best F1 value of  0.875000)\n\n');

%  Find the outliers in the training set and plot the
outliers = find(pval < epsilon);

%  Draw a red circle around those outliers
hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off
