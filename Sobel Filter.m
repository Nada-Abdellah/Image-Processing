% % Lab 4
% clear all
% close all
% image = imread('Lena.bmp');
% if (size(image,3) > 1)
%     image = rgb2gray(image);
% end
% 
% result = zeros(size(image));
% 
% lp_filter = [0 -1 0; -1 4 -1;0 -1 0];
% 
% image = double(image);
% for i = 2:size(image,1)-1
%     for j = 2:size(image,2)-1
%        gx = sum(sum(lp_filter.*image(i-1:i+1,j-1:j+1)));
%        result(i,j) = gx;
%     end
% end
% image = uint8(image);
% result = uint8(result);
% 
% 
% figure;
% subplot(1,2,1)
% imshow(image);
% title('Original Image');
% subplot(1,2,2)
% imshow(result);
% title('Enhanced Image');

clear all
close all

img = imread('Lena.bmp');
figure;
imshow(img);
img_gray = rgb2gray(img);
img = img_gray;
subplot(2,2,1), imshow(img),title('original image');
h = fspecial('sobel');
sobel_img = imfilter(img, h);
subplot(2,2,2),imshow(sobel_img),title('Sobel');

[BW, thresh] = edge(img, 'sobel');

sobel_img_H_dir = edge(img, 'sobel',thresh, 'horizontal');
subplot(2,2,3),imshow(sobel_img_H_dir),title('Sobel Horizontal');
sobel_img_v_dir = edge(img, 'sobel',thresh,'vertical');
subplot(2,2,4),imshow(sobel_img_v_dir),title('Sobel Vertical');
sobel_img_vert  = sobel_img_H_dir + sobel_img_v_dir;
figure,imshow(sobel_img_vert);
