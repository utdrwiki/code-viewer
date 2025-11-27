image_blend = merge_color(c_gray, c_white, abs(flip));
if ((image_xscale * image_yscale) >= 0)
    draw_self();
else
    draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
