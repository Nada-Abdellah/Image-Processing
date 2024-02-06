clear all;


%%% Problem 1
% image  = imread('lion.jpeg');
% image = rgb2gray(image);
% 
% figure, imshow(image);
% 
% image = 255 - image;
% 
% figure, imshow(image);

%%% Problem 6

% image = imread('lion.jpeg');
% image = rgb2gray(image);
% 
% rows = size(image,1);
% columns = size(image,2);
%
% for i = 1:rows
%     for j = 1:columns
%         if((i<=5)||(i>=rows-5) || (j <= 5) || (j >=columns -5)  )
%             image(i,j) = 0;
%         end
%     end
% end
figure, imshow(image);

%%% Problem 8

% image = imread('Lena.bmp');
% figure, imshow(image);
% figure, imshow(rgb2gray(image)); title('Grayscale by MATLAB');
% rows = size(image,1);
% columns = size(image,2);
% image_gray = zeros(rows,columns);
% 
% for i = 1:rows
%     for j = 1:columns
%          image_gray(i,j) = (image(i,j,1)/3) + (image(i,j,2)/3) + (image(i,j,3)/3);
%     end
% end
% 
% image_gray = uint8(image_gray);
% figure, imshow(image_gray); title('Manual Grayscale ');

%%% Problem 4

% image_x = imread('ImageX.jpg');
% image_y = imread('sky.jpg');
% 
% image_x = rgb2gray(image_x);
% image_y = rgb2gray(image_y);
% 
% rows_x = size(image_x,1);
% columns_x = size(image_x,2);
% 
% rows_y = size(image_y,1);
% columns_y = size(image_y,2);
% 
% first_row = uint16((rows_y/2) - (rows_x/2));
% first_column = uint16((columns_y/2) - (columns_x/2));
% 
% for row = 1:rows_x
%     for column = 1:columns_x
%         image_y(first_row+row-1, first_column +column-1  ) = image_x(row,column);
%     end
% end
% 
% imshow(image_y);
