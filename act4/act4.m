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

sigma = 1.1;
gaussian_kernel = fspecial('gaussian', [9 9], sigma);
gaussian_f_image = gauss_filter(noisy_img, gaussian_kernel);

figure(1)
subplot(1,3,1);
imshow(noisy_img);
title('Noisy Image');

subplot(1,3,2);
imshow(median_f_image);
title('Median filtered Image');

subplot(1,3,3);
imshow(gaussian_f_image);
title('Gaussian filtered Image');

figure(2)

subplot(1,2,1);
imshow(sobel_filter(resized_img));
title('Sobel filtered Image');

subplot(1,2,2);
sobel_h = fspecial('sobel');
imshow(imfilter(resized_img, sobel_h));
title('Inbuild Sobel filtered Image');


