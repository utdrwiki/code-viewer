var _left = x;
var _top = y;
var _width = width;
var _height = 14;
draw_sprite_ext(spr_pxwhite, 0, x, y, width, 14, 0, c_black, 1);
if (!surface_exists(clip_surface))
    clip_surface = surface_create(_width, _height);
surface_set_target(clip_surface);
draw_clear_alpha(c_black, 0);
draw_set_color(c_white);
draw_set_font(global.tvlandfont);
draw_text_ext_transformed(scr_even(x - _left - xpos), (y + 2) - _top, mystring, 0, 999999999, 2, 2, 0);
surface_reset_target();
draw_surface(clip_surface, _left, _top);
textwidth = string_width(mystring);
if (xpos >= ((textwidth * 2) + looppause))
    xpos = -width;
