% Trains multiple logistic regression classifiers and returns all
% the classifiers in a matrix all_theta, where the i-th row of all_theta 
% corresponds to the classifier for label i.
function [all_theta] = one_vs_all(X, y, num_labels, lambda, num_iterations)
    % Some useful variables
    m = size(X, 1);
    n = size(X, 2);

    % We need to return the following variables correctly 
    all_theta = zeros(num_labels, n + 1);

    % Add ones to the X data matrix.
    X = [ones(m, 1) X];

    for class_index=1:num_labels
        % Convert scalar y to vector with related bit being set to 1.
        y_vector = (y == class_index);

        % Set options for fminunc
        options = optimset('GradObj', 'on', 'MaxIter', num_iterations);

        % Set initial thetas to zeros.
        initial_theta = zeros(n + 1, 1);

        % Train the model for current class.
        gradient_function = @(t) gradient_callback(X, y_vector, t, lambda);

        [theta] = fmincg(gradient_function, initial_theta, options);
        
        % Add theta for current class to the list of thetas.
        theta = theta';
        all_theta(class_index, :) = theta; 
    end
end
