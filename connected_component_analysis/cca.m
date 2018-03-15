close all;
img = imresize(imread('text.PNG'), [1024 1024]);
gray_img = rgb2gray(img);

binary_img = gray_img < 160;

maps = zeros([200, 1]);

for i:size(binary_img, 1)
    for i:size(binary_img, 2)
        
    end
end
    