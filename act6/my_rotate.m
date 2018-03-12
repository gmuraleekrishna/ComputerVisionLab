function [rotated_img] = my_rotate(orig_img, theta)
    [h, w, ~] = size(orig_img);
    T = [cosd(theta) sind(theta); -sind(theta) cosd(theta)]; % rotation matrix
    
    corner_pts = abs(T) * [w h]'; % find the location of corners in rotated img
    rows_rot_img = ceil(corner_pts(1));
    cols_rot_img = ceil(corner_pts(2));

    rotated_img = zeros([rows_rot_img, cols_rot_img 3]); % new scaled up rotated_img
    
    mid_x_img = round(h/2);
    mid_y_img = round(w/2);
    
    mid_y_rot = round(rows_rot_img/2);
    mid_x_rot = round(cols_rot_img/2);
    
    for x = 1:cols_rot_img
         for y = 1:rows_rot_img
             pos = T * [(x - mid_x_rot) (y - mid_y_rot)]'; % rotation in terms of rotated_img
             x_ = round(pos(1)) + mid_x_img; % coorodinate x w.r.t orig_img
             y_ = round(pos(2)) + mid_y_img; % coorodinate y w.r.t orig_img
             if(x_ <= w && y_ <= h && x_ >= 1 && y_ >= 1)
                 rotated_img(x, y, :) = orig_img(x_, y_, :);
             end
         end
    end
    rotated_img = uint8(rotated_img);
end