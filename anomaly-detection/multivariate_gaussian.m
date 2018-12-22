% Computes the probability density function of the multivariate gaussian distribution.
function probabilities = multivariate_gaussian(X, mu, sigma2)
    % Get number of training sets and features.
    [m n] = size(X);

    % Init probabilities matrix.
    probabilities = ones(m, 1);

    % Go through all training examples and through all features.
    for i=1:m
        for j=1:n
            p = (1 / sqrt(2 * pi * sigma2(j))) * exp(-(X(i, j) - mu(j)) .^ 2 / (2 * sigma2(j)));
            probabilities(i) = probabilities(i) * p;
        end
    end
end
