siner += 1;
hscroll += 1;
if (hscroll > 240)
    hscroll -= 240;
colcol = scr_make_color_hsv(siner / 4, 160 + (sin(siner / 32) * 60), 255);
bgsiner += 0.0625;
if (bgsiner > 7)
    bgsiner -= 7;
bg = 3960;
var yy = cameray();
draw_sprite_tiled_ext(bg, 0, tower_x, yy, 2, 2, colcol, 0.7 * eyebody);
draw_sprite_tiled_ext(bg, 0, tower_x - 240, yy, 2, 2, colcol, 0.3 * eyebody);
var xx = 270;
draw_set_color(c_black);
var width = sprite_get_width(spr_fountainedge);
var maxwidth = tower_width;
ossafe_fill_rectangle(0, 0, (maxwidth / 2) - (width / 2), 280, 0);
ossafe_fill_rectangle((maxwidth / 2) + (width / 2), 0, 999, 280, 0);
draw_sprite_ext(spr_fountainedge, 0, xx - (width / 2), yy - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 1);
draw_sprite_ext(spr_fountainedge, 0, xx - (width / 2), (yy + 280) - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 1);
draw_sprite_ext(spr_fountainedge, 0, (xx - (width / 2)) + (sin(siner / 16) * 12), yy - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(spr_fountainedge, 0, (xx - (width / 2)) + (sin(siner / 16) * 12), (yy + 280) - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(spr_fountainedge, 0, xx - (width / 2) - (sin(siner / 16) * 12), yy - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(spr_fountainedge, 0, xx - (width / 2) - (sin(siner / 16) * 12), (yy + 280) - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_set_color(nowcolor);
ossafe_fill_rectangle(0, 0, tower_x + tower_width, 480, 0);
