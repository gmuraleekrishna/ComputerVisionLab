close all;
img = imread('Lenna.png');

theta = 10;

rotated_img = my_rotate(img, theta);
matlab_rotated_img = imrotate(img, theta);

figure
subplot(1,3,1);
imshow(rotated_img);
title('Rotated image');

subplot(1,3,2);
imshow(matlab_rotated_img);
title('Rotated image using imrotate');

subplot(1,3,3);
imshow(rotated_img - matlab_rotated_img);
title('Compared');