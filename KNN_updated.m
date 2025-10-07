function MeanAccuracy = KNN(data)

x = data(:, 1:end-1);
y = data(:, end);

nFolds = 3;
accuracy = zeros(nFolds, 1);

cv = cvpartition(y, 'KFold', nFolds);

for i=1:nFolds
	trainIdx = training(cv, i);
	testIdx = test(cv, i);
	
	model = fitcknn(x(trainIdx, :), y(trainIdx), 'NumNeighbors', 3);
	
	predictions = predict(model, x(testIdx, :));
	
	accuracy(i) = sum(predictions == y(testIdx)) / numel(predictions);
end

MeanAccuracy = mean(accuracy);