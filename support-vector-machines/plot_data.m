% Plots the data points X and y into a new figure.
function plot_data(X, y)
    % Find indices of positive and negative examples
    positive_indices = find(y == 1);
    negative_indices = find(y == 0);

    % Plot Examples
    plot(X(positive_indices, 1), X(positive_indices, 2), 'k+','LineWidth', 1, 'MarkerSize', 7);
    
    hold on;
    
    plot(X(negative_indices, 1), X(negative_indices, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
    
    hold off;
end
