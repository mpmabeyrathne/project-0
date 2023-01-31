
X = gen_kmeansdata(10749852);


stdevCol1 = std(X(:,1));
stdevCol2 = std(X(:,2));
stdevCol3 = std(X(:,3));
stdevCol4 = std(X(:,4));

% hist(X)
% saveas(gcf,'histogram')

covariance_matrix = cov(X)
[correlation_matrix,p] = corrcoef(X)
 

mean_silh_k3=[];
mean_silh_k4=[];
mean_silh_k5=[];

for k = [3,4,5]
[idx,C,sumdist3] = kmeans(X,k,'Distance','cityblock');
 
[silh,h] = silhouette(X,idx,'cityblock');
title(['Number of clussters = ' int2str(k)]);
xlabel ('Silhouette Value ');
ylabel ('Cluster');
mean_silh_k = mean(silh);

    if k == 3
    mean_silh_k3 (end+1)= mean_silh_k;
        

    elseif k == 4
    mean_silh_k4 (end+1)= mean_silh_k;
   

    else
    mean_silh_k5 (end+1)= mean_silh_k;
  

    end

end
    figure;
    plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',8);
    hold on;
    plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',8);
    plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',8);
    plot(X(idx==4,1),X(idx==4,2),'y.','MarkerSize',8);
    plot(X(idx==5,1),X(idx==5,2),'magenta.','MarkerSize',8);
    plot(C(:,1),C(:,2),'kx','MarkerSize',8,'LineWidth',3);
    legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Centroids');
    hold off;
   
  

