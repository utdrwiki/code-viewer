draw_self();
d3d_set_fog(true, c_black, 0, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, darken_alpha);
d3d_set_fog(false, c_black, 0, 0);
