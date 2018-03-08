img = imread('IMG_20180302_203415.jpg');
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


figure
imshow(noisy_img);
output_image = median_filter(noisy_img);
figure
imshow(output_image)
figure
imshow(sobel_filter(output_image));