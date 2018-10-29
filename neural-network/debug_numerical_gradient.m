% Computes the gradient using "finite differences" and gives
% us a numerical estimate of the gradient.
function numgrad = debug_numerical_gradient(gradient_step, theta)
    % The following code implements numerical gradient checking, and 
    % returns the numerical gradient. It sets numgrad(i) to (a numerical 
    % approximation of) the partial derivative of J with respect to the 
    % i-th input argument, evaluated at theta. (i.e., numgrad(i) should 
    % be the (approximately) the partial derivative of J with respect 
    % to theta(i).)        
    numgrad = zeros(size(theta));
    perturb = zeros(size(theta));

    e = 1e-4;
    for p = 1:numel(theta)
        % Set perturbation vector
        perturb(p) = e;
        [loss1 gradients1] = gradient_step(theta - perturb);
        [loss2 gradients2] = gradient_step(theta + perturb);
        
        % Compute numerical gradient.
        numgrad(p) = (loss2 - loss1) / (2 * e);
        perturb(p) = 0;
    end
end
