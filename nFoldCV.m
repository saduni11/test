function avg_accuracy = nFoldCV(data,n)

X = data(:,1:end-1);
y = data(:,end);

% Create cross-validation partition
cv = cvpartition(size(X, 1), 'KFold', n); 

accuracies = zeros(n,1); 

for i = 1:n
    traindata = [X(training(cv, i),:), y(training(cv, i))];
    testdata = [X(test(cv, i), :),y(test(cv, i))]; 
     
    % Calculate accuracy for the current fold
    accuracies(i) = nn(traindata,testdata);
    
    % Display progress
    fprintf('Fold %d accuracy: %.2f%%\n', i, accuracies(i)*100);
end

avg_accuracy = mean(accuracies);
fprintf('Average accuracy:%.2f%%\n', avg_accuracy);