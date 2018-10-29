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
    10,     % Second hidden layer - 10 hidden units.
    10      % Output layer - 10 labels, from 1 to 10 (note that we have mapped "0" to label 10).
];

% The range for initial theta values.
epsilon = 0.12;
nn_params = nn_params_init(layers, epsilon);

% Unroll parameters matrix into vector.
nn_params_unrolled = unroll(nn_params);

% Setup regularization parameter.
lambda = 1;
nn_gradient_step(nn_params_unrolled, layers, X, y, lambda);
