% Initialization.
clear; close all; clc;

% Load training data ----------------------------------------------------------------
fprintf('Loading data...\n');

load('digits.mat');
m = size(X, 1);

% Plotting some training example ----------------------------------------------------
fprintf('Visualizing data...\n');

% Randomly select 100 data points to display
random_digits_indices = randperm(size(X, 1));
random_digits_indices = random_digits_indices(1:100);

display_data(X(random_digits_indices, :));

% Debug neural network --------------------------------------------------------------

% Check gradients with lambda = 0.
% lambda = 0;
% debug_nn_gradients(lambda);
% fprintf('\nProgram paused. Press enter to continue.\n');
% pause;

% Check gradients with lambda = 3.
% lambda = 3;
% debug_nn_gradients(lambda);
% fprintf('\nProgram paused. Press enter to continue.\n');
% pause;

% Initializing neural network parameters --------------------------------------------
fprintf('Initializing neural network parameters...\n');

% Setup neural network parameter.
layers = [
    400,    % Input layer - 20x20 Input images of digits.
    25,     % First hidden layer - 25 hidden units.
%   15,     % Second hidden layer - 10 hidden units.
    10      % Output layer - 10 labels, from 1 to 10 (note that we have mapped "0" to label 10).
];

% Training neural network -----------------------------------------------------------
fprintf('Training neural network...\n');

% Defines the range for initial theta values.
epsilon = 0.12;

% Regularization parameter.
lambda = 0.01;

% Number of iterations to perform for gradient descent.
max_iterations = 30;

% Train neural network.
[nn_params, cost] = neural_network_train(X, y, layers, lambda, epsilon, max_iterations);

% Calculate training set accuracy ---------------------------------------------------
fprintf('Calculate training set accuracy...\n');

% After training the neural network, we would like to use it to predict the labels.
predictions = neural_network_predict(X, nn_params, layers);

fprintf('Training Set Accuracy: %f\n', mean(double(predictions == y)) * 100);
