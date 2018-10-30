% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mu sigma2] = estimate_gaussian(X)
    % Useful variables
    [m, n] = size(X);
    mu = mean(X);
    sigma2 = (1 / m) * sum((X - mu) .^ 2);
end
