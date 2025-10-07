load fisheriris
X = meas;
Y = species;
nFolds = 5;
cv = cvpartition(Y, 'KFold', nFolds);
accuracy = zeros(nFolds, 1);

k = 5;
fprintf('KNN for when k = %d\n', k);

for i = 1:nFolds
trainIdx = training(cv, i);
    testIdx = test(cv, i);
    model = fitcknn(X(trainIdx, :), Y(trainIdx), 'NumNeighbors', k);
    
    predictions = categorical(predict(model, X(testIdx, :)));
    
    accuracy(i) = sum(predictions == Y(testIdx))/numel(predictions);
    
    fprintf('Fold %d Accuracy: %.2f%%\n', i, accuracy(i)*100);
end
