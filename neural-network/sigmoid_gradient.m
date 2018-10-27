% Computes the gradient of the sigmoid function evaluated at z.
% This function works regardless if z is a matrix or a vector.
% In particular, if z is a vector or matrix, you it will return the gradient for each element.
function g = sigmoid_gradient(z)
    g = sigmoid(z) .* (1 - sigmoid(z));
end
