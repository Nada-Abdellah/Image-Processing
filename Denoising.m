rgb_image = imread('Lena.bmp');
gray_image = rgb2gray(rgb_image);

[nRows , nCols] = size(gray_image);
figure, subplot(1,3,1);  imshow(gray_image); title('original image');

noise_size = 0.01 * nRows * nCols;

for i = 1:noise_size
    row = randi([1 nRows],1);
    column = randi([1 nCols],1);
    
    gray_image(row,column) = 255;
end

subplot(1,3,2);  imshow(gray_image); title('noisy image');

Filter= uint8([1 1 1 ; 1 1 1 ; 1 1 1]);
for i=2:nRows-1
    for j=2:nCols-1
        G = sum(sum(Filter.*gray_image(i-1:i+1,j-1:j+1)));
        gray_image(i,j) = G/(sum(sum(Filter(:,:)))) ;

    end
end

subplot(1,3,3);  imshow(gray_image); title('denoised image');