% Initialization
clear ; close all; clc;

% Load the data --------------------------------------------------------
fprintf('Loading the data...\n\n');

data = load('microchips_tests.csv');

X = data(:, 1:2);
y = data(:, 3);

% Plotting the data ----------------------------------------------------
fprintf('Plotting the data...\n\n');

figure(1, 'position', [50, 50, 850, 650]);
hold on;

% Find indices of positive and negative examples.
positiveIndices = find(y == 1);
negativeIndices = find(y == 0);

% Plot examples.
plot(X(positiveIndices, 1), X(positiveIndices, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(negativeIndices, 1), X(negativeIndices, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

% Draw labels and Legend
xlabel('Microchip Test 1');
ylabel('Microchip Test 2');
legend('y = 1', 'y = 0');

% Add Polynomial Features -----------------------------------------------
fprintf('Adding polynomial features...\n\n');

% Feature mapping function to polynomial features.
polynomialDegree = 6;
X = add_polynomials(X(:, 1), X(:, 2), polynomialDegree);