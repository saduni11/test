
function selected_features = fwdFeatureSelect(train,test,select)

% select - #features to be selected

d = size(train,2)-1;

selected_features = []; 
remaining_features = 1:d; 
best_accuracy = 0; 

Xtr = train(:,1:end-1);
Xte = test(:,1:end-1);
Ytr = train(:,end);
Yte = test(:,end);

for i = 1:select
    best_feature = 0;
    for feature = remaining_features

        current_features = [selected_features, feature];
        
        Xtr_subset = Xtr(:,current_features);
        Xte_subset = Xte(:,current_features);

        accuracy = nn([Xtr_subset, Ytr],[Xte_subset, Yte]);

        if accuracy > best_accuracy
            best_accuracy = accuracy;
            best_feature = feature;
        end
    end
    

    if best_feature ~= 0
        selected_features = [selected_features, best_feature];
        remaining_features(remaining_features == best_feature) = [];
    else
        break; 
    end
    
    fprintf('Selected feature %d with accuracy %.2f\n', best_feature, best_accuracy);
end

