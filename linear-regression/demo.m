% Clear variables and a screen.
clear; close all; clc;

% Loading training data from file ----------------------------------------------
fprintf('Loading the training data from file...\n');

% Loading training data from file.
data = load('house_prices.csv');

% Split data into features and results.
X = data(:, 1:2);
y = data(:, 3);

% Plotting training data -------------------------------------------------------
fprintf('Plotting the training data...\n');

% Create a window, position and resize it.
figure(1, 'position', [50, 50, 850, 650]);

% Split the figure on 2x2 sectors.
% Start drawing in first sector.
subplot(2, 2, 1);

scatter3(X(:, 1), X(:, 2), y, [], y(:), 'o');
title('Training Set');
xlabel('Size');
ylabel('Rooms');
zlabel('Price');

% Running linear regression ----------------------------------------------------
fprintf('Running linear regression...\n');

alpha = 0.1;
num_iterations = 100;
[theta mu sigma X_normalized J_history] = linear_regression(X, y, alpha, num_iterations);

% Plotting normalized training data --------------------------------------------
fprintf('Plotting normalized training data...\n');

% Start drawing in second sector.
subplot(2, 2, 2);

scatter3(X_normalized(:, 2), X_normalized(:, 3), y, [], y(:), 'o');
title('Normalized Training Set');
xlabel('Normalized Size');
ylabel('Normalized Rooms');
zlabel('Price');

% Draw gradient descent progress ------------------------------------------------
fprintf('Plot gradient descent progress...\n');

% Continue plotting to the right area.
subplot(2, 2, 3);

plot(1:num_iterations, J_history);
xlabel('Iteration');
ylabel('J(\theta)');
title('Gradient Descent Progress');
