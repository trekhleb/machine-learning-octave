% Returns a vector of predictions using a trained SVM model (svmTrain)
function pred = svm_predict(model, X)
    % Check if we are getting a column vector, if so, then assume that we only
    % need to do prediction for a single example
    if (size(X, 2) == 1)
        % Examples should be in rows
        X = X';
    end

    % Dataset 
    m = size(X, 1);
    p = zeros(m, 1);
    pred = zeros(m, 1);

    if strcmp(func2str(model.kernelFunction), 'kernel_linear')
        % We can use the weights and bias directly if working with the 
        % linear kernel
        p = X * model.w + model.b;
    elseif strfind(func2str(model.kernelFunction), 'kernel_gaussian')
        % Vectorized RBF Kernel.
        % This is equivalent to computing the kernel on every pair of examples.
        X1 = sum(X.^2, 2);
        X2 = sum(model.X.^2, 2)';
        K = bsxfun(@plus, X1, bsxfun(@plus, X2, - 2 * X * model.X'));
        K = model.kernelFunction(1, 0) .^ K;
        K = bsxfun(@times, model.y', K);
        K = bsxfun(@times, model.alphas', K);
        p = sum(K, 2);
    else
        % Other Non-linear kernel
        for i = 1:m
            prediction = 0;
            for j = 1:size(model.X, 1)
                prediction = prediction + ...
                    model.alphas(j) * model.y(j) * ...
                    model.kernelFunction(X(i,:)', model.X(j,:)');
            end
            p(i) = prediction + model.b;
        end
    end

    % Convert predictions into 0 / 1
    pred(p >= 0) =  1;
    pred(p <  0) =  0;
end
