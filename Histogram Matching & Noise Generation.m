clc 
close all

% Histogram Matching

image = imread('Lena.bmp');
reference = imread('beach.jpg');

new_image = imhistmatch(image, reference);

figure;
imshow(new_image)
title('After Histogram Matching')

x = immse(new_image, image);

% Noise Generation

figure;
subplot(1,2,1)
imshow(image);
title('Original Image');
if (size(image,3) > 1)
    image = rgb2gray(image);
end

img_size = size(image);

rows = img_size(1);
cols = img_size(2);
N = rows * cols;
noise_size = uint16(N/10);

for i = 1:noise_size
    rand_row_num = randi([1 rows], 1);
    rand_col_num = randi([1 cols], 1);
    image(rand_row_num, rand_col_num) = 0;
end

subplot(1,2,2)
imshow(image);
title('Noisy Image');

image_2 = imread('download.jpg');

if (size(image_2,3) > 1)
    image_2 = rgb2gray(image_2);
end

figure;
imshow(image_2);
title('Original');

noisy_tiger = imnoise(image_2, 'salt & pepper',1);

figure;
imshow(noisy_tiger);