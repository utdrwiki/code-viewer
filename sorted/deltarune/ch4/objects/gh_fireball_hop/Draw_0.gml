scaler = sin((timer * 2) + pi) / 4;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale - scaler, image_yscale + scaler, image_angle, c_white, image_alpha);
