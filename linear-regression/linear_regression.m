% Clear variables and a screen.
clear; close all; clc;

% Loading training data from file.
data = load('house_prices.csv');

% Split data into features and results.
X = data(:, 1:2);
y = data(:, 3);

% Calculate the number of training examples.
m = size(y, 1);

% Calculate the number of features.
n = size(X, 2);

% Add a column of ones to X.
X = [ones(m, 1), X];

% Initialize fitting (theta) parameters.
theta = zeros(n + 1, 1);
