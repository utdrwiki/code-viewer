draw_sprite_ext(sprite_index, image_index, x + choose(-3, 0, 3), y + choose(-3, 0, 3), image_xscale, image_yscale, image_angle, c_gray, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 0.9 * prev_counter, image_yscale * 0.9 * prev_counter, image_angle, c_black, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 0.9 * color_counter, image_yscale * 0.9 * color_counter, image_angle, c_black, image_alpha);
