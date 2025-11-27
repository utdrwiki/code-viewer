draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
d3d_set_fog(true, c_white, 0, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, fadealpha);
d3d_set_fog(false, c_black, 0, 0);
if (fadealpha > 0)
    fadealpha -= 0.1;
