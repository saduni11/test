
% Generate data
rng(1); % For reproducibility
n_points = 100;

% Generate three clusters of points
X1 = [randn(n_points, 2) + 2];  % Cluster 1 around (2, 2)
X2 = [randn(n_points, 2) - 2];  % Cluster 2 around (-2, -2)
X3 = [randn(n_points, 2) + [-4, 4]];  % Cluster 3 around (-4, 4)

X = [X1; X2; X3];

K = 3;
[idx, C] = kmeans(X, K);

figure;
gscatter(X(:,1), X(:,2), idx);
hold on;

% Plot the centroids
plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);
legend('Cluster 1','Cluster 2','Cluster 3','Centroids');
xlabel('Feature 1');
ylabel('Feature 2');
hold off;