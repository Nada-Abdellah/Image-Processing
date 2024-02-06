clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Global Thresholding %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% image = imread('fish.jpg');
% image_gray = rgb2gray(image);
% figure , imhist(image_gray);
% figure , imshow(image_gray);
% 
% threshold = 60;
% 
% for i= 1: size(image_gray,1)
%     for j = 1:size(image_gray,2)
%         if image_gray(i,j) >= threshold
%             image_gray(i,j) = 0;
%         else
%             image_gray(i,j) = 255;
%         end
%         
%     
%     end
% end
% figure, imshow(image_gray);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%% Local Adaptive Thresholding %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% image = imread('IMG4.jpg');
% image_gray = rgb2gray(image);
% %image_gray = image;
% figure, imshow(image_gray);
% 
% [nRows, nCols] = size(image_gray);
% N = 9; 
% M = 8;
% row_step = round(nRows/N);
% column_step = round(nCols/M);
% 
% for i=1:row_step:nRows-row_step+1
%     for j= 1:column_step:nCols-row_step+1
%         image_crop = image_gray(i:i+row_step-1, j:j+column_step-1);
%         Threshold = mean(mean(image_crop));
%         
%         for ii = i:i+row_step-1
%             for jj = j:j+column_step-1
%                 if(image_gray(ii,jj) >= Threshold)
%                     image_gray(ii,jj) = 255;
%                 else
%                     image_gray(ii,jj) = 0;
%                 end
%             end
%         end
%         
%     end
% end
% 
% figure, imshow(image_gray);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HSV %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% image = imread('fish.jpg');
% figure, subplot(3,1,1) ;imshow(image); title('RGB Image');
% 
% [I_H , I_S , I_V] = rgb2hsv(image);
% subplot(3,1,2) ;imshow(I_H); title('I_H');
% 
% for i = 1: size(I_H,1)
%     for j = 1:size(I_H,2)
%         %if (I_H(i,j)<=0.625) && (I_H(i,j)>=0.54166666666 ) for blue
%         if (I_H(i,j)<=0.25) && (I_H(i,j)>=0.08333333333 ) %for fish
%             I_H(i,j) = 255;
%         else
%             I_H(i,j) = 0;
%         end
%     end
% end
% 
% subplot(3,1,3) ;imshow(I_H); title('Segmentation of blue balls');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Noise %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

image = imread('IMG2.jpg');
image_gray = rgb2gray(image);
[nRows , nCols] = size(image_gray);

figure, subplot(1,3,1);  imshow(image_gray); title('original image');

noise_size = 0.2 * nRows * nCols;

for i = 1:noise_size
    row = randi([1 nRows],1);
    column = randi([1 nCols],1);
    
    image_gray(row,column) = 255;
end

subplot(1,3,2);  imshow(image_gray); title('Noisy image');

J = imnoise(image_gray,'salt & pepper',0.2) ;

subplot(1,3,3);  imshow(J); title('Noisy image matlab'); 