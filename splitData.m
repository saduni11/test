function [trData,teData] = splitData(data)

[m,n] = size(data);

% Perform random shuffle on the data
 indices = randperm(m);
 data = data(indices,:);

trData = []; teData = [];

nTr = round(m*0.7);
trData = data(1:nTr,:);
teData = data(nTr+1:m,:);