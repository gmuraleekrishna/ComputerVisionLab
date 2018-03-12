% resize and hist eq images
close all


[scaled_img, ~] = imread('face_03_u6528602.jpg');
scaled_img = imresize(scaled_img, [512, 768]);
r = scaled_img(:, :, 1); % get R channel
g = scaled_img(:, :, 2); % get G channel
b = scaled_img(:, :, 3); % get B channel

figure
imshow(scaled_img)
title('Scaled image');

figure
subplot(2,3,1);
imshow(r); % show histogram R
title('(a) R channel');
subplot(2,3,2);
imshow(g); % show histogram G
title('(b) G channel');
subplot(2,3,3);
imshow(b); % show histogram B
title('(c) B channel');

subplot(2,3,4);
imhist(r); % show histogram R
title('(a) R channel histogram');
subplot(2,3,5);
imhist(g); % show histogram G
title('(b) G channel histogram');
subplot(2,3,6);
imhist(b); % show histogram B
title('(c) B channel histogram');

hist_eq_img = histeq(scaled_img); % get equalized histogram
rh = hist_eq_img(:, :, 1);
gh = hist_eq_img(:, :, 2);
bh = hist_eq_img(:, :, 3);


figure
subplot(3,2,1);
imshow(hist_eq_img(:,:,1)); 
title('(a) R channel');
subplot(3,2,3);
imshow(hist_eq_img(:,:,1));
title('(b) G channel');
subplot(3,2,5);
imshow(hist_eq_img(:,:,1));
title('(c) B channel');

subplot(3,2,2);
imhist(rh); % show histogram R
title('(d) R channel histogram');
subplot(3,2,4);
imhist(gh); % show histogram G
title('(e) G channel histogram');
subplot(3,2,6);
imhist(bh); % show histogram B
title('(f) B channel histogram');
