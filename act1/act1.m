% resize and hist eq images
close all
[orig_img, ~] = imread('face_01_u6528602_resized.jpg');
orig_img = imresize(orig_img, [512, 768]);
r = orig_img(:, :, 1); % get R channel
g = orig_img(:, :, 2); % get G channel
b = orig_img(:, :, 3); % get B channel

hist_eq_img = histeq(orig_img); % get equalized histogram
rh = hist_eq_img(:, :, 1);
gh = hist_eq_img(:, :, 2);
bh = hist_eq_img(:, :, 3);

figure
subplot(1,2,1);
imshow(orig_img)
title('Original Image');

subplot(1,2,2);
imshow(hist_eq_img)
title('Histogram Equalised Image');

figure
subplot(2,3,1);
imhist(r); % show histogram R
title('R channel');
subplot(2,3,2);
imhist(g); % show histogram G
title('G channel');
subplot(2,3,3);
imhist(b); % show histogram B
title('B channel');

subplot(2,3,4);
imhist(rh);
title('Equlised R channel');
subplot(2,3,5);
imhist(gh);
title('Equlised G channel');
subplot(2,3,6);
imhist(bh);
title('Equlised B channel');
imwrite(hist_eq_img, 'face_01_u6528602_hist_eqd.jpg');