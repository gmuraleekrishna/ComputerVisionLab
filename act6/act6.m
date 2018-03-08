close all;
img = imread('Lenna.png');
[r, c, ~] = size(img);
rotated_img = zeros(size(img));
theta = 270;

T = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
mid_x = r/2;
mid_y = c/2;


for x = 1:r
    for y = 1:c
        pos = T * [(x-mid_x) (y-mid_y)]';
        x_ = round(pos(1)) + mid_x;
        y_ = round(pos(2)) + mid_y;
        if(x_ <= c && y_ <= r && x_ >= 1 && y_ >= 1)
            rotated_img(x_, y_, :) = img(x, y, :);
        end
    end
end

figure
subplot(1,2,1);
imshow(uint8(rotated_img));
title('Rotated image');

subplot(1,2,2);
imshow(imrotate(img, theta));
title('Rotated image using imrotate');