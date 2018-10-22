% NORMAL EQUATION function.
% Closed-form solution to linear regression.
function [theta] = normal_equation(X, y)
    theta = pinv(X' * X) * X' * y;
end
