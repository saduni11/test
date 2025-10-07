% KNN Accuracy Evaluation with Cross-Validation for Multiple k values
% Save results to a text file

% Load Fisher Iris dataset
load fisheriris
X = meas;
Y = categorical(species);  % Convert labels to categorical for comparison

% Cross-validation setup
nFolds = 5;
cv = cvpartition(Y, 'KFold', nFolds);

% Define k values to test
kValues = [1, 3, 5, 7];

% Open file to write results
fileID = fopen('knn_accuracy_results.txt', 'w');

% Loop over each k
for k = kValues
    accuracy = zeros(nFolds, 1);  % store accuracy for each fold
    
    for i = 1:nFolds
        % Get training and test indices
        trainIdx = training(cv, i);
        testIdx = test(cv, i);

        % Train KNN model
        model = fitcknn(X(trainIdx, :), Y(trainIdx), 'NumNeighbors', k);

        % Predict on test set
        predictions = predict(model, X(testIdx, :));

        % Compute accuracy
        accuracy(i) = sum(predictions == Y(testIdx)) / numel(predictions);

        % Write fold result to file
        fprintf(fileID, 'k = %d | Fold %d Accuracy: %.2f%%\n', k, i, accuracy(i)*100);
    end

    % Write average accuracy for current k
    avgAcc = mean(accuracy);
    fprintf(fileID, 'k = %d | Average Accuracy: %.2f%%\n\n', k, avgAcc*100);
end

% Close the file
fclose(fileID);
