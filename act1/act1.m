% resize and hist eq images
close all


[orig_img, ~] = imread('face_03_u6528602.jpg');
orig_img = imresize(orig_img, [512, 768]);
r = orig_img(:, :, 1); % get R channel
g = orig_img(:, :, 2); % get G channel
b = orig_img(:, :, 3); % get B channel

figure
subplot(1,2,1);
imshow(orig_img)
title('Original Image');


subplot(1,2,2);
subplot(2,3,1);
imshow(r); % show histogram R
title('R channel');
subplot(2,3,2);
imshow(g); % show histogram G
title('G channel');
subplot(2,3,3);
imshow(b); % show histogram B
title('B channel');

subplot(2,3,4);
imhist(r); % show histogram R
title('R channel histogram');
subplot(2,3,5);
imhist(g); % show histogram G
title('G channel histogram');
subplot(2,3,6);
imhist(b); % show histogram B
title('B channel histogram');

hist_eq_img = histeq(orig_img); % get equalized histogram
rh = hist_eq_img(:, :, 1);
gh = hist_eq_img(:, :, 2);
bh = hist_eq_img(:, :, 3);


figure
subplot(1,2,1);
imshow(hist_eq_img)
title('Histogram Equalised Image');

subplot(1,2,2);
subplot(2,3,1);
imshow(hist_eq_img(:,:,1)); % show histogram R
title('R channel');
subplot(2,3,2);
imshow(hist_eq_img(:,:,1)); % show histogram G
title('G channel');
subplot(2,3,3);
imshow(hist_eq_img(:,:,1)); % show histogram B
title('B channel');

subplot(2,3,4);
imhist(rh); % show histogram R
title('R channel histogram');
subplot(2,3,5);
imhist(gh); % show histogram G
title('G channel histogram');
subplot(2,3,6);
imhist(bh); % show histogram B
title('B channel histogram');
