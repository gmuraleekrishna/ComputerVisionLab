clear;
close all;
img = imread('face_01_u6528602_resized.jpg');
resized_img = imresize(img, [512 512]);
noisy_img = resized_img;


[r, c, ~] = size(resized_img);

% add salt and pepper noise
prob = 0.5;
rand_nos = randi(r, [floor(prob * r) 2]);
for i = 1:size(rand_nos, 1)
    x = rand_nos(i,1);
    y = rand_nos(i,2);
    if mod(i,2) == 0
        noisy_img(x,y, :) = [0, 0, 0];
    else
        noisy_img(x,y, :) = [255, 255, 255];
    end
end

median_f_image = median_filter(noisy_img);
medfilt3_img = medfilt3(noisy_img);


sigma = 1.1;
gaussian_kernel = fspecial('gaussian', [9 9], sigma);
gaussian_f_image = gauss_filter(noisy_img, gaussian_kernel);


figure(1)
subplot(2,2,1);
imshow(noisy_img);
title('(a) Noisy Image');

subplot(2,2,2);
imshow(median_f_image);
title('(b) Median filtered');

subplot(2,2,3);
imshow(medfilt3_img);
title('(b) Median with medfilt3');

subplot(2,2,4);
imshow(gaussian_f_image);
title('(c) Gaussian filtered');

figure(2)
imshow(gaussian_f_image - medfilt3_img);
title('Difference');



figure(3)

subplot(1,2,1);
imshow(sobel_filter(resized_img));
title('(a) Sobel filtered');

subplot(1,2,2);
sobel_h = fspecial('sobel');
imshow(imfilter(resized_img, sobel_h));
title('(b) Inbuild Sobel filtered');


