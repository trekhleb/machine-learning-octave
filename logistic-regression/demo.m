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

% Add more polynomial features in order to make decision boundary to have more complex curve form.
polynomialDegree = 6;
X = add_polynomials(X(:, 1), X(:, 2), polynomialDegree);

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1.
lambda = 1;

% Compute and display initial cost and gradient for regularized logistic regression.
[cost, gradients] = cost_function(X, y, initial_theta, lambda);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros) - first five values only:\n');
fprintf(' %f \n', gradients(1:5));
fprintf('\n');

% Let's try to optimize cost function with different values of regularization parameter lambda
fprintf('Optimizing using fminunc...\n\n');

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = fminunc(@(t)(cost_function(X, y, t, lambda)), initial_theta, options);

fprintf('Plotting decision boundaries...\n');
fprintf('\n');

% Here is the grid range
u = linspace(-1, 1.5, 50);
v = linspace(-1, 1.5, 50);

z = zeros(length(u), length(v));
% Evaluate z = theta*x over the grid.
for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = add_polynomials(u(i), v(j), polynomialDegree) * theta;
    end
end

fprintf('Optimized cost %f\n', J);

z = z'; % important to transpose z before calling contour

% Plot z = 0
% Notice you need to specify the range [0, 0]
contour(u, v, z, [0, 0], 'LineWidth', 2)

title(sprintf('lambda = %g', lambda));
legend('y = 1', 'y = 0', 'Decision boundary');

hold off;

% Trying to predict custom experimetns.
x = [
    0, 0;
    -0.5, -0.5
];

% Feature mapping function to polynomial features.
x = add_polynomials(x(:, 1), x(:, 2), polynomialDegree);

probabilities = hypothesis(x, theta);
probabilities
