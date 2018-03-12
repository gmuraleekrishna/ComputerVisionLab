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
title('(a) Histogram of Original Image')

subplot(1,2,2)
imhist(noisy_img);
title('(b) Histogram of Noisy Image')

sigma = 2;
gaussian_kernel = fspecial('gaussian', [9 9], sigma);
output_image = gauss_filter(noisy_img, gaussian_kernel);
imgaussfilt_img = imgaussfilt(noisy_img, sigma);

figure
subplot(2,2,1);
imshow(noisy_img);
title('(a) Noisy Image');

subplot(2,2,2);
imshow(output_image);
title('(b) Filtered Image');

subplot(2,2,3);
imshow(imgaussfilt_img);
title('(c) Filtered Using imgaussfilt');

subplot(2,2,4);
imshow(imgaussfilt_img - output_image);
title('(d) Difference');