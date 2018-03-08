close all;
img = imresize(imread('text.PNG'), [1024 1024]);
gray_img = rgb2gray(img);
% thr_img = gray_img > 160;
imshow(thr_img);
se = strel('disk',2);
eroded_img = imerode(thr_img, se);
figure
imshow(eroded_img);

dil_img = imdilate(thr_img, se);
figure
imshow(dil_img);

dil_img = imdilate(thr_img, se);
eroded_img = imerode(dil_img, se);
figure
imshow(eroded_img);

eroded_img = imerode(thr_img, se);
dil_img = imdilate(eroded_img, se);
figure
imshow(dil_img);
