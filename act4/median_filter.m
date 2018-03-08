function [output_image] = median_filter(noisy_image)
    img = padarray(noisy_image, [1 1], 0, 'both');
    [r, c, ~] = size(noisy_image);
    output_image = zeros(size(noisy_image));
    
    for i = 1:r
        for j = 1:c
            slice = double(img(i:i+2, j:j+2, :));
            output_image(i, j, :) = median(median(slice));
        end
    end
    output_image = uint8(output_image);
end