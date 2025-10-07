trueLabels   = [1;     1;   1;   0;   0;   0;    1;   0;    1;   0];   
predictedPos = [0.9; 0.8; 0.7; 0.4; 0.3; 0.2; 0.85; 0.4; 0.95; 0.1]; 

% Compute ROC curve
[X, Y, T, AUC] = perfcurve(trueLabels, predictedPos, 1); % 

% Plot ROC curve
figure;
plot(X, Y, 'LineWidth', 1);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
title('ROC Curve');
grid on;

disp(['AUC: ', num2str(AUC)]);