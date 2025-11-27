var _xx = screenx();
var _yy = screeny();
draw_set_blend_mode(bm_subtract);
draw_sprite_ext(sprite_index, 0, _xx, _yy, image_xscale, image_yscale, image_angle, image_blend, 1);
draw_set_blend_mode(bm_normal);
