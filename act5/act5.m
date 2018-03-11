close all;
img = imresize(imread('text.PNG'), [1024 1024]);
gray_img = rgb2gray(img);

no_of_white = sum(sum(gray_img >= 200));
no_of_black = sum(sum(gray_img <= 15));
sum_white_black_px = no_of_white + no_of_black;

binary_img = gray_img > 160;

se = strel('disk',2);

figure(1)
imshow(binary_img);

figure(2)
% Erode
subplot(2,2,1);
eroded_img = imerode(binary_img, se);
imshow(eroded_img);
title('Erored');

% Dilate
dil_img = imdilate(binary_img, se);
subplot(2,2,2);
imshow(dil_img);
title('Dilated');

% Closing
closed_img = imclose(binary_img, se);
subplot(2,2,3);
imshow(eroded_img);
title('Closed');


% Opening
opened_img = imopen(binary_img, se);
subplot(2,2,4);
imshow(opened_img);
title('Opened');

