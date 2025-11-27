var _gx = obj_growtangle.x;
var _gy = obj_growtangle.y;
draw_set_color(c_white);
if (con < 3 && init != 0)
{
    var _dist = (((3 - con) * 60) + 30) - (scr_ease_in(timer / delay, 4) * 60);
    d_circle(_gx + (_dist * x_change), _gy + (_dist * y_change), 10, 0);
}
if (con == 3 && timer < 6)
{
    var _xx = _gx + (x_change * 64);
    var _yy = _gy + (y_change * 64);
    draw_set_alpha(1 - (timer / 6));
    ossafe_fill_rectangle(max(_gx - 70, _xx - 70), max(_gy - 70, _yy - 70), min(_gx + 71, _xx + 71), min(_gy + 71, _yy + 71), false);
    draw_set_alpha(1);
}
