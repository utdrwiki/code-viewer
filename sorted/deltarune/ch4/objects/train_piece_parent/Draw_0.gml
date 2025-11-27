var _ramp = instance_place(x, y, obj_traintrack_ramp);
if (_ramp != -4)
{
    var _ox = x;
    var _oy = y;
    var _ramp_pos_r = clamp((x + 5) - _ramp.x, 0, 40);
    var _ramp_y;
    if (_ramp_pos_r < 30)
        _ramp_y = lerp(0, -10, clamp(_ramp_pos_r / 20, 0, 1));
    else
        _ramp_y = lerp(-10, 0, (_ramp_pos_r - 30) / 10);
    y += _ramp_y;
    draw_self();
    x = _ox;
    y = _oy;
}
else
{
    draw_self();
}
