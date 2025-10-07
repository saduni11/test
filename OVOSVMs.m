%% Load dataset
load fisheriris
X = meas;      % Features
Y = species;   % Labels

%% Split data (70% train, 30% test)
cv = cvpartition(Y, 'HoldOut', 0.3);
Xtrain = X(training(cv), :);
Ytrain = Y(training(cv));
Xtest = X(test(cv), :);
Ytest = Y(test(cv));

%% Train OVO SVM model (default: linear + majority voting)
model = fitcecoc(Xtrain, Ytrain);

%% Predict on test data
pred = predict(model, Xtest);

%% Evaluate accuracy
acc = mean(pred == Ytest) * 100;
fprintf('OVO SVM Accuracy: %.2f%%\n', acc);
