siner += 1;
hscroll += 1;
if (hscroll > 240)
    hscroll -= 240;
if (adjust == 0)
{
    colcol = scr_make_color_hsv(siner / 4, 160 + (sin(siner / 32) * 60), 255);
    change_fountain_color(scr_make_color_hsv(siner / 4, 255, (sin(siner / 16) * 40) + 60));
}
if (adjust == 1)
{
    colcol = merge_color(colcol, c_white, 0.06);
    change_fountain_color(merge_color(nowcolor, c_black, 0.06));
}
if (adjust == 2)
{
    if (slowdown < 1)
        slowdown += 0.04;
    siner -= slowdown;
    bgsiner -= (slowdown / 16);
    change_fountain_color(merge_color(nowcolor, c_white, 0.03));
}
if (adjust == 3)
{
    if (slowdown < 1)
        slowdown += 0.01;
    siner -= (slowdown * 0.5);
    bgsiner -= (slowdown / 24);
    hscroll -= (slowdown * 0.8);
    colcol = merge_color(nowcolor, scr_make_color_hsv(siner / 16, 160 + (sin(siner / 128) * 60), 255), slowdown);
    change_fountain_color(merge_color(nowcolor, scr_make_color_hsv(siner / 16, 255, (sin(siner / 64) * 40) + 60), slowdown));
}
bgsiner += 0.0625;
if (bgsiner > 7)
    bgsiner -= 7;
bg = 3960;
draw_background_tiled_ext(bg, 0 - siner, 0 - siner, 2, 2, colcol, 0.7 * eyebody);
draw_background_tiled_ext(bg, -240 + hscroll, 0 + siner, 2, 2, colcol, 0.3 * eyebody);
draw_set_color(c_black);
ossafe_fill_rectangle(0, 0, (room_width / 2) - (sprite_width / 2), room_height, 0);
ossafe_fill_rectangle((room_width / 2) + (sprite_width / 2), 0, 999, room_height, 0);
draw_sprite_ext(sprite_index, 0, (room_width / 2) - (sprite_width / 2), 0 - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 1);
draw_sprite_ext(sprite_index, 0, (room_width / 2) - (sprite_width / 2), 280 - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 1);
draw_sprite_ext(sprite_index, 0, ((room_width / 2) - (sprite_width / 2)) + (sin(siner / 16) * 12), 0 - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(sprite_index, 0, ((room_width / 2) - (sprite_width / 2)) + (sin(siner / 16) * 12), 280 - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(sprite_index, 0, (room_width / 2) - (sprite_width / 2) - (sin(siner / 16) * 12), 0 - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(sprite_index, 0, (room_width / 2) - (sprite_width / 2) - (sin(siner / 16) * 12), 280 - ((bgsiner * 280) / 7), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(spr_fountainbottom_narrow, 0, (room_width / 2) - (sprite_width / 2) - 16, 122 + (sin(siner / 16) * 8), 2, 2, 0, colcol, 0.3);
draw_sprite_ext(spr_fountainbottom_narrow, 0, (room_width / 2) - (sprite_width / 2) - 16, 126 + (sin(siner / 16) * 4), 2, 2, 0, colcol, 0.5);
draw_sprite_ext(spr_fountainbottom_narrow, 0, (room_width / 2) - (sprite_width / 2) - 16, 130, 2, 2, 0, colcol, 1);
draw_set_color(nowcolor);
ossafe_fill_rectangle(240, 280, 400, 490, 0);
