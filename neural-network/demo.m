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

% Initializing neural network parameters --------------------------------------------
fprintf('Initializing neural network parameters...\n');

% Setup neural network parameter.
layers = [
    400,    % Input layer - 20x20 Input images of digits.
    25,     % First hidden layer - 25 hidden units.
 %  10,     % Second hidden layer - 10 hidden units.
    10      % Output layer - 10 labels, from 1 to 10 (note that we have mapped "0" to label 10).
];

% Defines the range for initial theta values.
epsilon = 0.12;

% Regularization parameter.
lambda = 1; 

% Number of iterations to perform for gradient descent.
max_iterations = 50;

% number_of_examples = 50;
% X = X(1:number_of_examples, :);
% y = y(1:number_of_examples, :);

% Train neural network.
[nn_params, cost] = neural_network(X, y, layers, lambda, epsilon, max_iterations);

% Training neural network -----------------------------------------------------------
fprintf('Training neural network...\n');

% After training the neural network, we would like to use it to predict the labels.
predictions = predict(X, nn_params, layers);

% Calculate training set accuracy ---------------------------------------------------
fprintf('Calculate training set accuracy...\n');
fprintf('Training Set Accuracy: %f\n', mean(double(predictions == y)) * 100);
