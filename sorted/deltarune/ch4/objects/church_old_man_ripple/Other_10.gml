if (type == 3)
{
    var _col = 16777215;
    if (timer == 0)
        _col = 8421504;
    if (timer >= 5)
        _col = merge_color(c_white, c_black, clamp01((timer - 5) / 15));
    draw_sprite_ext(spr_kris_defending_dark, timer, x - 44, y - 80, 2, 2, 0, _col, 1);
}
if (type == 4)
{
    var _col = 16777215;
    if (timer == 0)
        _col = 8421504;
    if (timer >= 5)
        _col = merge_color(c_white, c_black, clamp01((timer - 5) / 15));
    draw_sprite_ext(spr_kris_defending_parry_dark, clamp((timer + 6) / 3, 0, 8), x - 44, y - 80, 2, 2, 0, _col, 1);
}
