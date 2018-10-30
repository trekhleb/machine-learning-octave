% Returns a linear kernel between x1 and x2.
function similarity = kernel_linear(x1, x2)
    % Ensure that x1 and x2 are column vectors.
    x1 = x1(:);
    x2 = x2(:);

    % Compute the kernel.
    similarity = x1' * x2;
end
