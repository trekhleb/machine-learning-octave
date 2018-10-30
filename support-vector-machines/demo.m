% Initialization
clear; close all; clc;

% Load and visualize the data ----------------------------------------------------------
fprintf('Loading and visualizing data...\n');

% Load data.
% X and y will be loaded automatically.
load('linear-data.mat');

% Plot training data
plot_data(X, y);

