% Finds the best threshold (epsilon) to use for selecting outliers.
function [best_epsilon best_F1] = select_threshold(yval, probabilities)
    best_epsilon = 0;
    best_F1 = 0;
    F1 = 0;

    stepsize = (max(probabilities) - min(probabilities)) / 1000;

    for epsilon = min(probabilities):stepsize:max(probabilities)
        predictions = (probabilities < epsilon);

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

        if F1 > best_F1
            best_F1 = F1;
            best_epsilon = epsilon;
        end
    end
end
