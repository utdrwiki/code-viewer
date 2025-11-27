if (visible)
{
    var _cx = camerax();
    var _cy = cameray();
    if (!surface_exists(surf_ripples))
        surf_ripples = surface_create(640, 480);
    var _delcount = 0;
    shader_set(shd_ripple);
    surface_set_target(surf_ripples);
    draw_clear_alpha(c_black, 0);
    var _ripplecount = array_length(ripples);
    for (var i = 0; i < _ripplecount; i++)
    {
        var _thisripple = ripples[i];
        _thisripple.life = max(0, _thisripple.life - 1);
        _thisripple.x += _thisripple.hsp;
        _thisripple.y += _thisripple.vsp;
        if (_thisripple.hsp > 0)
            _thisripple.hsp = scr_approach(_thisripple.hsp, 0, _thisripple.fric);
        if (_thisripple.vsp > 0)
            _thisripple.vsp = scr_approach(_thisripple.vsp, 0, _thisripple.fric);
        var _xx = _thisripple.x - _cx;
        var _yy = _thisripple.y - _cy;
        _thisripple.rad = lerp(_thisripple.radstart, _thisripple.radmax, animcurve_channel_evaluate(curves[_thisripple.curve], 1 - (_thisripple.life / _thisripple.lifemax)));
        if (_thisripple.rad > 0)
        {
            shader_set_uniform_f(u_center, _xx, _yy);
            shader_set_uniform_f(u_rad, _thisripple.rad, _thisripple.radmax, _thisripple.thickness);
            draw_set_colour(_thisripple.col);
            var _rad = _thisripple.rad;
            ossafe_fill_rectangle(_xx - _rad, _yy - _rad, _xx + _rad, _yy + _rad, false);
            if (_thisripple.life == 0)
            {
                _delcount++;
                _thisripple = undefined;
            }
        }
    }
    surface_reset_target();
    shader_reset();
    repeat (_delcount)
        array_delete(ripples, 0, 1);
    draw_surface_ext(surf_ripples, _cx, _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
