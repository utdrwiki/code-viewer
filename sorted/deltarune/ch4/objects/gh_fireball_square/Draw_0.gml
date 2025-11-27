scaler = 0;
draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale - scaler, image_yscale + scaler, image_angle, c_white, image_alpha);
if (iris)
    draw_sprite_ext(spr_ghosthouse_iris, sprite_width > 12, round(x + lengthdir_x(3 + ((sprite_width > 12) * (iris_dir <= 90 || iris_dir >= 270)), iris_dir)), round(y + lengthdir_y(4, iris_dir)), 1, 1, iris_dir, c_white, 1);
