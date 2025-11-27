var _x = 0;
repeat (40)
{
    draw_sprite(spr_tenna_catwalks, 0, x + (_x * 122), y);
    _x++;
}
if (side == "above")
{
    draw_sprite_ext(spr_tenna_spotlight, 0, x + spot1x, y + 50, 1.5, 2, spot1angle, c_white, 1);
    draw_sprite_ext(spr_tenna_spotlight, 0, x + spot2x, y + 50, 1.5, 2, spot2angle, c_white, 1);
    draw_sprite_ext(spr_tenna_spotlight, 0, x + spot3x, y + 50, 1.5, 2, spot3angle, c_white, 1);
}
else
{
    draw_sprite_ext(spr_tenna_spotlight, 0, x + spot1x, y - 12, 1.5, 2, spot1angle + 180, c_white, 1);
    draw_sprite_ext(spr_tenna_spotlight, 0, x + spot2x, y - 12, 1.5, 2, spot2angle + 180, c_white, 1);
    draw_sprite_ext(spr_tenna_spotlight, 0, x + spot3x, y - 12, 1.5, 2, spot3angle + 180, c_white, 1);
}
