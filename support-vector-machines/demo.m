% Initialization
clear; close all; clc;

% PART 1: SVM using linear kernel ------------------------------------------------------

% Load and visualize the data
fprintf('Loading and visualizing data...\n');

% Load data.
% X and y will be loaded automatically.
load('./data/linear-set.mat');

% Plot training data
plot_data(X, y);

% Training linear SVM
fprintf('Training Linear SVM...\n');
C = 1;
tolerance = 1e-3;
max_passes = 20;
model = svm_train(X, y, C, @kernel_linear, tolerance, max_passes);

% Visualice decision boundary.
visualize_boundary_linear(X, y, model);

fprintf('\nProgram paused. Press enter to launch non-linear SVM training.\n');
pause;

% PART 2: SVM usin Gaussian kernel -----------------------------------------------------

% Load data.
% X and y will be loaded automatically.
load('./data/non-linear-set.mat');

% SVM Parameters
C = 1;
sigma = 0.1;
tolerance = 1e-3;
max_passes = 5;
model = svm_train(X, y, C, @(x1, x2) kernel_gaussian(x1, x2, sigma), tolerance, max_passes); 

% Visualice decision boundary.
visualize_boundary(X, y, model);
