function [output_image] = gauss_filter(noisy_image, gausskernel)
    img = padarray(noisy_image, [4 4], 0, 'both');
    stacked_kernel = cat(3, gausskernel, gausskernel, gausskernel);
    [r, c, ~] = size(noisy_image);
    output_image = zeros(size(noisy_image));
    
    for i = 1:r
        for j = 1:c
            slice = double(img(i:i+8, j:j+8, :));
            output_image(i, j, :) = sum(sum(slice .* stacked_kernel));
        end
    end
    output_image = uint8(output_image);
end