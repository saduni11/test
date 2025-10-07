data = rand(10,3);

% Normalisation
mu = mean(data); 
normData = data - mu; 

% Covariance
covMatrix = cov(normData);

% Eigenvalues and eigenvectors
[eigenvectors, eigenvalues] = eig(covMatrix);

% Sort (descending order)
[eigenvaluesSorted, index] = sort(diag(eigenvalues), 'descend');
eigenvectorsSorted = eigenvectors(:,index);

% Top k eigenvectors 
k = 2;
selectedEigenvectors = eigenvectorsSorted(:,1:k);

% Project the data 
reducedData = normData*selectedEigenvectors;

% Original data and reduced data
disp('Original Data:');
disp(data);
disp('Reduced Data (2D):');
disp(reducedData);

% Reduced data for visualization
figure;
scatter(reducedData(:,1), reducedData(:,2), 'filled');
title('PCA - Data Projected onto 2D');
xlabel('PC-1');
ylabel('PC-2');
grid on;