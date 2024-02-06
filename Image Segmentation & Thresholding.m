close all
clc
% Read the image
image = imread('motocycle.jpg');

% Convert an image(if colored) to grayscale image
if(size(image,3)>1)
    image = rgb2gray(image);
end
freq = zeros(256);

for i=1:size(image,1)
    for j=1:size(image,2)
        value=image(i,j);
        freq(value+1)=freq(value+1)+1;
    end
end

% Plotting Histogram
figure;
plot(freq)
title('Histogram');

input_img = image;
[nRows, nCols]=size(input_img);

% Getting maximum & minimum values
max1 = max(max(input_img));
min1 = min(min(input_img));

% Getting average value
avg_level1=mean(mean(input_img));
avg_level2=(max1+min1)/2;
avg_level3= 145;

for i=1:nRows
    for j=1:nCols
        if(input_img(i,j)>=avg_level1)
            input_img(i,j)=255;
        else
            input_img(i,j)=0;
        end 
    end
end

% Plotting Figures
figure;
subplot(1,2,1)
imshow(image)
title('Original Image')
subplot(1,2,2)
imshow(input_img);
title('Global Threshold Result Mean');

% Adaptive Thresholding
% Define the number of subimages
rows = 9;
cols = 8;

var_row = round(nRows/rows);
var_col = round(nCols/cols);
in_img = image;
for i=1:var_row:nRows-var_row+1
    for j=1:var_col:nCols-var_col+1
        
        img_cropt = in_img(i:i+var_row-1, j:j+var_col-1);
        avg_levelt = mean(mean(img_cropt));
        
        for i1 = i:i+var_row-1
            for j1=j:j+var_col-1
                if(in_img(i1,j1)>=avg_levelt)
                    in_img(i1,j1)=255;
                else
                    in_img(i1,j1)=0;
                end
            end
        end
    end
end
figure;
imshow(in_img)
title('Adaptive Thresholding')

% Contrast Stretching
low_con_img = imread('low_con_1.jpg');
image = low_con_img;
if(size(image, 3) == 3)
    image=rgb2gray(image);
end
%image_copy = image;
image_1 = double(image);
min_num = min(min(image_1));
max_num = max(max(image_1));
new_image = ((image_1 - min_num)/(max_num - min_num)) * 255;
new_image = uint8(new_image);
figure;
subplot(1,2,1)
imshow(image)
title('Original')
subplot(1,2,2)
imshow(new_image)
title('Stretched Image')

low_con_img2 = imread('low_con_2.jpg');
[n, m] = size(low_con_img2);

freq = zeros(256);
for i= 1:n
    for j=1:m
        value=low_con_img2(i,j);
        freq(value+1)=freq(value+1)+1;
    end
end
equalized_hist = histeq(low_con_img2);
figure;
subplot(1,2,1)
imhist(low_con_img2)
title('Original Histogram')
subplot(1,2,2)
imhist(equalized_hist)
title('Equalized Histogram')
figure;
subplot(1,2,1)
imshow(low_con_img2)
title('Original Image')
subplot(1,2,2)
imshow(equalized_hist)
title('Equalized Histogram Image')