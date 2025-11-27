var _color;
if (type == 0)
    _color = 4235519;
if (type == 1)
    _color = 16776960;
var _side = 1;
if (hspeed < 0)
    _side = -1;
_index += 1;
var a = 0;
repeat (10)
{
    draw_sprite_ext(spr_holywater_waterline, _index, x, (obj_growtangle.y - 74) + (a * 15), _side, 1, 0, merge_color(_color, _color, 0.5), 1);
    a++;
}
a = 0;
repeat (10)
{
    draw_sprite_ext(spr_holywater_waterline, _index, x - 1, (obj_growtangle.y - 74) + (a * 15), _side, 1, 0, merge_color(_color, _color, 0.5), 1);
    a++;
}
a = 0;
repeat (10)
{
    draw_sprite_ext(spr_holywater_waterline, _index, x - 2, (obj_growtangle.y - 74) + (a * 15), _side, 1, 0, merge_color(_color, _color, 0.5), 1);
    a++;
}
a = 0;
repeat (10)
{
    draw_sprite_ext(spr_holywater_waterline, _index, x - 3, (obj_growtangle.y - 74) + (a * 15), _side, 1, 0, merge_color(_color, _color, 0.5), 1);
    a++;
}
draw_set_color(c_white);
