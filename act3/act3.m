close all;
img = imread('face_01_u6528602.jpg');
img = imcrop(img, [450, 100, 500, 400]);
resized_img = imresize(img, [512 512]);
gray_img = rgb2gray(resized_img);
gray_img = imadjust(gray_img, [], [0 1]);
noisy_img = imnoise(gray_img, 'gaussian', 0, 0.0138);

figure
subplot(1,2,1)
imhist(gray_img);
title('Histogram of Original Image')

subplot(1,2,2)
imhist(noisy_img);
title('Histogram of Noisy Image')

sigma = 1.5;
gaussian_kernel = fspecial('gaussian', [9 9], sigma);
output_image = gauss_filter(noisy_img, gaussian_kernel);

figure
subplot(1,3,1);
imshow(noisy_img);
title('Noisy Image');

subplot(1,3,2);
imshow(output_image);
title('Filtered Image');


subplot(1,3,3);
imshow(imgaussfilt(noisy_img, sigma));
title('Filtered Using imgaussfilt');