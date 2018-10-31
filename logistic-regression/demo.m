% PART 1: Microchips classification ====================================

% Initialization
clear; close all; clc;

% Load the data --------------------------------------------------------
fprintf('Loading the data...\n\n');

data = load('microchips_tests.csv');

X = data(:, 1:2);
y = data(:, 3);

% Plotting the data ----------------------------------------------------
fprintf('Plotting the data...\n\n');

% Find indices of positive and negative examples.
positiveIndices = find(y == 1);
negativeIndices = find(y == 0);

% Plot examples.
hold on;
plot(X(positiveIndices, 1), X(positiveIndices, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(negativeIndices, 1), X(negativeIndices, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

% Draw labels and Legend
xlabel('Microchip Test 1');
ylabel('Microchip Test 2');
legend('y = 1', 'y = 0');

% Running logistic regression ------------------------------------------
fprintf('Running logistic regression...\n\n');

% Add more polynomial features in order to make decision boundary to have more complex curve form.
polynomial_degree = 6;
X = add_polynomial_features(X(:, 1), X(:, 2), polynomial_degree);

% Run the regression.
lambda = 1;
[theta, J, J_history, exit_flag] = logistic_regression_train(X, y, lambda);

fprintf('- Initial cost: %f\n', J_history(1));
fprintf('- Optimized cost: %f\n\n', J);

% Plotting decision boundaries -----------------------------------------
fprintf('Plotting decision boundaries...\n\n');

% Generate a grid range.
u = linspace(-1, 1, 50);
v = linspace(-1, 1, 50);
z = zeros(length(u), length(v));
% Evaluate z = (x * theta) over the grid.
for i = 1:length(u)
    for j = 1:length(v)
        % Add polinomials.
        x = add_polynomial_features(u(i), v(j), polynomial_degree);
        % Add ones.
        x = [ones(size(x, 1), 1), x];
        z(i, j) = x * theta;
    end
end

% It is mportant to transpose z before calling the contour.
z = z';

% Plot z = 0
% Notice you need to specify the range [0, 0]
contour(u, v, z, [0, 0], 'LineWidth', 2);
title(sprintf('lambda = %g', lambda));
legend('y = 1', 'y = 0', 'Decision boundary');

hold off;

% Trying to predict custom experiments ------------------------------------
fprintf('Trying to predict custom experiments...\n\n');

x = [
    0, 0;
    -0.5, -0.5
];

% Add polinomials.
x = add_polynomial_features(x(:, 1), x(:, 2), polynomial_degree);
% Add ones.
x = [ones(size(x, 1), 1), x];

probabilities = hypothesis(x, theta);
fprintf(' %f \n', probabilities);

fprintf('\nProgram paused. Press enter to train logistic regression to recognize digits.\n');
pause;

% PART 2: Handwritten digits classification ==============================
clear; close all; clc;

% Load training data
fprintf('Loading training data...\n');
load('digits.mat');

% Plotting some training example ----------------------------------------------------
fprintf('Visualizing data...\n');

% Randomly select 100 data points to display
random_digits_indices = randperm(size(X, 1));
random_digits_indices = random_digits_indices(1:100);

display_data(X(random_digits_indices, :));

% Setup the parameters you will use for this part of the exercise
input_layer_size = 400;  % 20x20 input images of digits.
num_labels = 10; % 10 labels, from 1 to 10 (note that we have mapped "0" to label 10).

fprintf('Training One-vs-All Logistic Regression...\n')
lambda = 0.01;
num_iterations = 50;
[all_theta] = one_vs_all(X, y, num_labels, lambda, num_iterations);

fprintf('Predict for One-Vs-All...\n')
pred = one_vs_all_predict(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
