function data = shuffleData(data)

% This function is used to shuffle a dataset

[m,n]=size(data);
indices=randperm(m);
data=data(indices,:);
