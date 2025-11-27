if (con == 1 && prog >= (prate * pcount))
{
    pcount++;
    var _midpoint = 0.4;
    if (prog < (_midpoint / 2))
        exit;
    var _ts = 13;
    var _width = 50;
    if (prog <= _midpoint)
        _width = scr_ease_in(prog / _midpoint, 5);
    else
        _width = 1 - scr_ease_out((prog - _midpoint) / (1 - _midpoint), 6);
    var _tilt = random_range(0.5, 1) * randomsign();
    for (var i = 0; i < _width; i += 40)
    {
        var _tw = (_tilt > 0) ? 110 : 85;
        var _anim = instance_create(x + (lerp(181, 163, prog) * 2) + (_tilt * _width * _tw), ((y + 360) - (prog * 200)) + random_range(-10, 10) + (_tilt * _ts), obj_animation_blend);
        _anim.speed = 4;
        _anim.direction = 90;
        _anim.friction = 0.1;
        _anim.depth = depth;
        _anim.sprite_index = spr_darkshape_dissipate;
        _anim.image_speed = 0.25;
        _anim.image_xscale = 0.5;
        _anim.image_index = 1;
        _anim.image_yscale = 0.5;
    }
    debug_line_start.x = (x + (lerp(181, 163, prog) * 2)) - (_width * 85);
    debug_line_end.x = x + (lerp(181, 163, prog) * 2) + (_width * 110);
    debug_line_start.y = ((y + 360) - (prog * 200)) + (_ts * _width);
    debug_line_end.y = (y + 360) - (prog * 200) - (_ts * _width);
}
