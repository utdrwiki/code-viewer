if (im_done)
    exit;
d3d_set_fog(true, c_lime, 0, 1);
draw_sprite_ext(sprite_index, image_index, xpprevious, ypprevious, image_xscale * 0.85, image_yscale * 0.85, image_angle, image_blend, 0.5);
d3d_set_fog(false, c_black, 0, 0);
d3d_set_fog(true, c_lime, 0, 1);
draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale * 0.85, image_yscale * 0.85, image_angle, image_blend, image_alpha);
d3d_set_fog(false, c_black, 0, 0);
draw_self();
xpprevious = xprevious;
ypprevious = yprevious;
