function h = findS(X,y)
 
% X - data
% y - labels

[m, n] = size(X);
h = repmat('0', 1, n);
    
for i = 1:m
    if y(i) == 1
       if all(h == '0')
          h = X(i,:);
        else     
            for j = 1:n
                if h(j)~=X(i,j)
                   h(j) = '?'; 
                end
            end
        end
       end
    end
end


%X = ["sunny", "warm", "normal", "strong", "warm", "same";
%     "sunny", "warm", "high",   "strong", "warm", "same";
%     "rainy", "cold", "high",   "strong", "warm", "change";
%     "sunny", "warm", "high",   "strong", "cool", "change"];
 
% y = [1; 1; 0; 1]; % 1 = positive, 0 = negative
% hypothesis = findS(X, y);
% disp(hypothesis);