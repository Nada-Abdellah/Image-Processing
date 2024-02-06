clc
clear all
close all
% K Means & Clustering

image = imread('images.jpg');

[segmented,Centers] = imsegkmeans(image, 2);

labeled_image = labeloverlay(image, segmented);

figure;
imshow(labeled_image)

% Dr Code
imagex = imread('switzerland.jpg');
k = 3;
s = 200;
if (size(imagex,3) > 1)
    imagex = rgb2gray(imagex);
end
numP = size(imagex,2);
dimP = size(imagex,1);

figure;
subplot(2,1,1);
scatter(imagex(1,:),imagex(2,:),200,'.');
hold on;
 
randIdx = randperm(numP,k);
center = imagex(:,randIdx);

cluster = zeros(1,numP);

clusterPrev = cluster;
iterations = 0;
stop = false;
while stop == false
    for idxP = 1:numP
        dist = zeros(1,k);
        for idxC=1:k
            dist(idxC)= norm(double(imagex(:,idxP))-double(center(:,idxC)));
            dx = imagex(1,idxP) -center(1,idxC);
            dy = imagex(2,idxP) - center(2,idxC);
            dist(idxC) = dx.^2 + dy.^2;
        end
        
        mind = dist(1);
        mind_i = 1;
        for i = 2:k
            if(dist(i)) < mind
                mind = dist(i);
                mind_i = i;
            end
        end
        clusterP = mind_i;
        cluster(idxP) = clusterP;
    end
    center = zeros(dimP,k);
    for idxC = 1:k
        center(:,idxC)= mean(imagex(:,cluster==idxC),2);
    end
    if clusterPrev==cluster
        stop = true;
    end
    
    clusterPrev = cluster;
    iterations = iterations + 1;
end
% Plotting Clusters
subplot(2,1,2);
hold on
for idxP = 1:s
if(cluster(1,idxP)== 1)
plot(imagex(1,idxP),imagex(2,idxP),'xk','LineWidth',2);
end
if(cluster(1,idxP)== 5)
plot(imagex(1,idxP),imagex(2,idxP),'xm','LineWidth',2);
end
if(cluster(1,idxP)== 4)
plot(imagex(1,idxP),imagex(2,idxP),'xg','LineWidth',2);
end
if(cluster(1,idxP)== 3)
plot(imagex(1,idxP),imagex(2,idxP),'xb','LineWidth',2);
end
if(cluster(1,idxP)== 2)
plot(imagex(1,idxP),imagex(2,idxP),'xr','LineWidth',2);
end
end

imagex_seg = imsegkmeans(imagex,3);
result = labeloverlay(imagex,imagex_seg);

figure;
imshow(result);

