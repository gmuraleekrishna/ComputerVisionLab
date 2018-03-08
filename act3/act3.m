close all;
img = imread('face_01_u6528602.jpg');
img = imcrop(img, [450, 100, 500, 400]);
resized_img = imresize(img, [512 512]);
noisy_img = imnoise(resized_img, 'gaussian', 0, 0.0138);
hist_ri = imhist(resized_img);
hist_ni = imhist(noisy_img);

sigma = 1.1;
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