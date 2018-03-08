img = imread('IMG_20180302_203415.jpg');
resized_img = imresize(img, [512 512]);
noisy_img = imnoise(resized_img, 'gaussian', 0, 0.0138);
hist_ri = imhist(resized_img);
hist_ni = imhist(noisy_img);
% figure
% plot(hist_ri);
% figure
% plot(hist_ni);
figure
imshow(noisy_img);
sigma = 1.1;
gaussian_kernel = fspecial('gaussian', [9 9], sigma);
output_image = gauss_filter(noisy_img, gaussian_kernel);
figure
imshow(output_image)
figure
imshow(imgaussfilt(noisy_img, sigma))