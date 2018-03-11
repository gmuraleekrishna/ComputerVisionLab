function [output_image] = gauss_filter(noisy_image, gausskernel)
    img = padarray(noisy_image, [4 4], 0, 'both'); % pad image with zeros for easy convolution
    [r, c, ~] = size(noisy_image);
    output_image = zeros(size(noisy_image));
    
    for i = 1:r
        for j = 1:c
            slice = double(img(i:i+8, j:j+8)); % get slice of image 
            output_image(i, j) = sum(sum(slice .* gausskernel)); % get sum of products
        end
    end
    img = output_image(4:size(output_image, 1) - 4, 4:size(output_image, 2) - 4); % remove padding
    output_image = uint8(img); % convert to unsigned integer image
end