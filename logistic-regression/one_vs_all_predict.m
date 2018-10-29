% Predict the label for a trained one-vs-all classifier. The labels 
% are in the range 1..K, where K = size(all_theta, 1)
function p = one_vs_all_predict(all_theta, X)
    m = size(X, 1);
    num_labels = size(all_theta, 1);

    % We need to return the following variables correctly.
    p = zeros(size(X, 1), 1);

    % Add ones to the X data matrix
    X = [ones(m, 1) X];

    % Calculate probabilities of each number for each input example.
    % Each row relates to the input image and each column is a probability that this example is 1 or 2 or 3 etc. 
    h = sigmoid(X * all_theta');

    % Now let's find the highest predicted probability for each row.
    % Also find out the row index with highest probability since the index is the number we're trying to predict.
    [p_vals, p] = max(h, [], 2);
end
