draw_self();
image_alpha2 -= 0.1;
d3d_set_fog(true, c_red, 0, 1);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha2);
d3d_set_fog(false, c_black, 0, 0);
