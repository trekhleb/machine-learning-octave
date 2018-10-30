% Returns a radial basis function kernel between x1 and x2.
function similarity = kernel_gaussian(x1, x2, sigma)
    % Ensure that x1 and x2 are column vectors.
    x1 = x1(:);
    x2 = x2(:);

    similarity = exp(-sum((x1 - x2) .^ 2) / (2 * sigma ^ 2));
end
