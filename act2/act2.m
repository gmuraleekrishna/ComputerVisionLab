% color map conversion
% From Digital Image Processing pp 410-411, Gonzalez, RC & Woods,
close all;
img = imread('colorwheel.jpg');
r = double(img(:, :, 1))/255;
g = double(img(:, :, 2))/255;
b = double(img(:, :, 3))/255;

maxV = max(max(r, g), b);
minV = min(min(r, g), b);

d = maxV - minV;
sum = (r + g + b);

v =  sum ./ 3;
s = 1 - ( 3 * d ) ./ sum;
a = sqrt((r - g).^2 + ((r - b) .* (g - b)));
theta = acosd(0.5 * ((r - g) + (r - b )) ./ a);

h = zeros(size(r));

for i=1:size(r,1)
    for j=1:size(r, 1)
        if isnan(theta(i,j))
            th = 0;
        else
            th = theta(i,j);
        end
        if(b(i,j) <= g(i,j))
            h(i,j) = th;
        else
            h(i,j) = 360 - th;
        end
    end
 end
h = h/360;

data_markers = [571,121; 766, 205; 892, 325; 962,553; 909,759; 777, 913; 563,980; 563, 980; 326, 904; 184, 750; 105, 598; 175, 318; 342, 157];

for i=1:size(data_markers, 1)
    x = data_markers(i, 1);
    y = data_markers(i, 2);
    h_value = mean(mean(h(x:x+8, y:y+8)));
    h = insertText(h, [x, y], h_value, 'FontSize', 28);
end

figure
subplot(1,2, 1);
imshow(img);
title('(a) Original');

subplot(1,2, 2);
imshow(h);
title('(b) Hue with average value');