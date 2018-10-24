% Generates polinomyal features of certain degree.
% This function is used to extend training set features with new features to get 
% more complex form/shape if decision boundaries.
function out = add_polynomial_features(X1, X2, degree)
    % Returns a new feature array with more features, comprising of 
    % X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
    out = ones(size(X1(:, 1)));
    for i = 1:degree
        for j = 0:i
            out(:, end + 1) = (X1 .^ (i - j)) .* (X2 .^ j);
        end
    end
end
