var _gy = obj_shootout_controller.kris_y_ground - 16;
var _bullet_length = 20;
var _line_length = _gy - y;
var _yoffset = ((parent.char_timer % bullet_delay) / bullet_delay) * (_bullet_length * 2);
draw_set_color(c_white);
var _d = _yoffset;
while (_d < _line_length)
{
    draw_line_width(x, y + _d, x, y + _d + _bullet_length, 4);
    _d += (_bullet_length * 2);
}
draw_sprite_ext(spr_shootout_crosshair, 0, x, _gy, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_shootout_shock, (current_time / 100) % 2, x, _gy, shock_scale, shock_scale, 0, c_white, 1);
