var _col = merge_color(c_white, c_black, clamp01((timer - 20) / 20));
draw_sprite_ext(sprite_index, 1, x + (sprite_xoffset * 2) + 4, y + (sprite_yoffset * 2), 2, 2, 0, _col, 1);
if (shattered)
    exit;
if (init == false)
{
    for (var i = 0; i < image_number; i++)
        pivot[i] = new Vector2(0, 0);
    init = true;
}
pivot[0] = new Vector2(0, 0);
pivot[1] = new Vector2(0, 0);
pivot[2] = new Vector2(0, 0);
pivot[3] = new Vector2(0, 0);
pivot[4] = new Vector2(13, 20);
pivot[5] = new Vector2(26, 14);
pivot[6] = new Vector2(32, 36);
pivot[7] = new Vector2(51, 31);
pivot[8] = new Vector2(41, 29);
pivot[9] = new Vector2(60, 38);
pivot[10] = new Vector2(17, 19);
pivot[11] = new Vector2(47, 40);
pivot[12] = new Vector2(38, 36);
pivot[13] = new Vector2(23, 34);
pivot[14] = new Vector2(35, 46);
pivot[15] = new Vector2(41, 46);
pivot[16] = new Vector2(48, 50);
pivot[17] = new Vector2(43, 56);
pivot[18] = new Vector2(36, 56);
pivot[19] = new Vector2(28, 47);
pivot[20] = new Vector2(50, 53);
pivot[21] = new Vector2(26, 53);
if (timer == 0 && debug_room)
    draw_sprite_ext(spr_statue_sound_of_justice_crumble, 17, x, y, 2, 2, 0, c_red, 1);
var _font = draw_get_font();
draw_set_font(fnt_small);
if (timer >= 2)
    random_set_seed(8);
var _i = image_number - 1;
while (_i >= 6)
{
    if (show_debug && _i != focus)
    {
    }
    else
    {
        var _xx = tip ? pivot[_i].y : pivot[_i].x;
        var _mult = 1;
        if (timer == 2)
            _mult = -1;
        else if (timer == 3)
            _mult = 3;
        if (timer > 0)
            _xx += (irandom_range(-1, 1) * _mult);
        var _yy = tip ? pivot[_i].x : pivot[_i].y;
        if (timer > 0 && _i != 17 && _i != 18)
            _yy += (irandom_range(-1, 1) * _mult);
        draw_sprite_ext(sprite_index, _i, x + (_xx * 2), y + (_yy * 2), 2, 2, 0, c_white, 1);
    }
    _i--;
}
if (debug_room)
{
    if (show_debug)
        draw_set_alpha(1);
    else
        draw_set_alpha(0.5);
    draw_text(x + 50, y + 130, "Focus:" + string(abs(focus), 2));
}
draw_set_alpha(1);
draw_set_font(_font);
draw_set_color(c_white);
draw_sprite(spr_crosshair_7x7, 0, x + 40, y + 76);
