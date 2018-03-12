function [output_image] = sobel_filter(noisy_image)
    sobel_opr1 = [ -1 -2 -1; 0 0 0; 1 2 1];
    sobel_opr2 = sobel_opr1';
    output_image = uint8(zeros(size(noisy_image)));
    for channel = 1:3
         temp_x = conv2(noisy_image(:, :, channel), sobel_opr1, 'same');
         temp_y = conv2(noisy_image(:, :, channel), sobel_opr2, 'same');
         output_image(:, :, channel) = sqrt(temp_x.^2 + temp_y.^2);
    end
end