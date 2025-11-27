var _xscale = (sprite_width + 16) / sprite_get_width(sprite_index);
var _yscale = (sprite_height + 16) / sprite_get_height(sprite_index);
draw_sprite_ext(sprite_index, 0, screenx(), screeny(), _xscale, _yscale, 0, c_white, 1);
