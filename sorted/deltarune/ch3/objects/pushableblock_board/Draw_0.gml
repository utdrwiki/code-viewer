var _truex = floor(x / 2) * 2;
var _truey = floor(y / 2) * 2;
draw_sprite_ext(sprite_index, 0, _truex, _truey, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_font(fnt_small);
draw_set_color(c_white);
