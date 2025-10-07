function rate = nn(traindata,testdata)

% This script is used for 1-NN Classification 
m = size(traindata,1);
n = size(testdata,1);
predict = [];

for test = 1:n % For each testing data
	for train = 1:m % For each training data
		Euclidist(train) = norm(testdata(test,1:end-1) - traindata(train,1:end-1));
	end
	
	[val,ind] = min(Euclidist);
	predict(test) = traindata(ind,end);
end

actual = testdata(:,end);
rate = 100*sum(actual==predict')/n;