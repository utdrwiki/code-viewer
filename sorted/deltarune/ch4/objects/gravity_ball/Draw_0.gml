if (level == 0)
    image_blend = c_white;
if (level == 1)
    image_blend = merge_color(merge_color(c_aqua, c_blue, 0.5), c_white, 0.5);
if (level == 2)
    image_blend = merge_color(merge_color(c_yellow, c_orange, 0.5), c_white, 0.5);
if (level >= 3)
    image_blend = merge_color(c_red, c_white, 0.3);
image_blend = merge_color(image_blend, c_white, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * xscale, image_yscale, image_angle, image_blend, 1);
