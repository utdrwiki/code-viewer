draw_set_font(fnt_mainbig);
draw_set_halign(fa_center);
draw_set_color(c_blue);
if (red)
    draw_set_color(merge_color(c_red, c_black, 0.7));
draw_text(x + 2, y + 2, blurb);
var _color = 16776960;
if (red)
    _color = 255;
draw_set_color(_color);
draw_text(x, y, blurb);
draw_set_halign(fa_left);
