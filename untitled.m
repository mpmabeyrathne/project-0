clear all,clc,close all
X = gen_kmeansdata(10749852);
N = size(X,1);

K = [3,4,5];
a = zeros(length(K),1);

covariance_matrix = cov(X);
[correlation_matrix,p] = corrcoef(X);
disp(covariance_matrix)
disp(correlation_matrix)
disp(p)

for i = 1:length(K)
    y = K(i);
    [idx,C] = kmeans(X,y);

    a(i)=mean(silhouette(X,idx));

    figure
    [silh,h]=silhouette(X,idx);
end

figure
gscatter(X(:,1),X(:,2),idx)
hold on 
plot(C(:,1),C(:,2),'kx','MarkerSize',10,'LineWidth',2)
title('gscatter plot for clusters and centeroids')
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Centroids');
xlabel ('X-value ');
ylabel ('Y-value');
hold off