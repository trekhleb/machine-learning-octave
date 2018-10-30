% Find the best threshold (epsilon) to use for selecting outliers.
function [bestEpsilon bestF1] = select_threshold(yval, pval)
    bestEpsilon = 0;
    bestF1 = 0;
    F1 = 0;

    stepsize = (max(pval) - min(pval)) / 1000;
    for epsilon = min(pval):stepsize:max(pval)
        predictions = (pval < epsilon);

        % The number of false positives: the ground truth label says it’s not 
        % an anomaly, but our algorithm incorrectly classified it as an anomaly.
        fp = sum((predictions == 1) & (yval == 0));

        % The number of false negatives: the ground truth label says it’s an anomaly,
        % but our algorithm incorrectly classified it as not being anoma- lous.
        fn = sum((predictions == 0) & (yval == 1));

        % The number of true positives: the ground truth label says it’s an 
        % anomaly and our algorithm correctly classified it as an anomaly.
        tp = sum((predictions == 1) & (yval == 1));

        % Precision.
        prec = tp / (tp + fp);

        % Recall.
        rec = tp / (tp + fn);

        % F1.
        F1 = 2 * prec * rec / (prec + rec);

        if F1 > bestF1
            bestF1 = F1;
            bestEpsilon = epsilon;
        end
    end

end
