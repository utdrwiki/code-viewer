function scr_quizwipe(arg0, arg1 = 0, arg2 = true, arg3 = 0)
{
    var _surf;
    if (arg2)
    {
        _surf = surface_create(640, 480);
        surface_set_target(_surf);
        draw_clear_alpha(c_black, 0);
    }
    draw_primitive_begin(pr_trianglefan);
    arg0 = clamp01(arg0);
    draw_set_color(arg1);
    var _camx, _camy;
    if (arg2)
    {
        _camx = 320;
        _camy = 240;
    }
    else
    {
        _camx = camerax() + 320;
        _camy = cameray() + 240;
    }
    var _startangle = lerp_clamped(0, 360, (arg0 * 2) - 1);
    var _endangle = lerp_clamped(0, 360, arg0 * 2);
    draw_vertex(_camx, _camy);
    for (var i2 = 0; i2 <= 8; i2++)
    {
        var _xx = lengthdir_x(450, lerp(90 - _startangle, 90 - _endangle, i2 / 8));
        var _yy = lengthdir_y(450, lerp(90 - _startangle, 90 - _endangle, i2 / 8));
        draw_vertex(_xx + _camx, _yy + _camy);
    }
    draw_primitive_end();
    if (arg2)
    {
        gpu_set_alphatestenable(true);
        gpu_set_alphatestref(1);
        gpu_set_blendmode_ext(bm_dest_alpha, bm_dest_alpha);
        var _xx = 540;
        var _yy = 430;
        if (arg3 == 1)
        {
            draw_sprite_ext(spr_dw_tv_tvtimeSign_quizwipe, 0, _xx + irandom_range(-2, 2), _yy + irandom_range(-2, 2), 1, 1, random_range(-5, 5), #666666, 1);
        }
        else if (arg3 == 2)
        {
            var _xshifta = irandom_range(-3, 3) + 2;
            var _xshiftb = irandom_range(-3, 3) + 2;
            gpu_set_colorwriteenable(true, false, false, true);
            draw_sprite_pos(spr_dw_tv_tvtimeSign_quizwipe, 0, (_xx - 80) + _xshifta, _yy - 35, _xx + 82 + _xshifta, _yy - 35, _xx + 80 + _xshiftb, _yy + 35, (_xx - 80) + _xshiftb, _yy + 35, 0.1);
            _xshifta -= 2;
            _xshiftb -= 2;
            gpu_set_colorwriteenable(false, true, false, true);
            draw_sprite_pos(spr_dw_tv_tvtimeSign_quizwipe, 0, (_xx - 80) + _xshifta, _yy - 35, _xx + 80 + _xshifta, _yy - 35, _xx + 80 + _xshiftb, _yy + 35, (_xx - 80) + _xshiftb, _yy + 35, 0.1);
            _xshifta -= 2;
            _xshiftb -= 2;
            gpu_set_colorwriteenable(false, false, true, true);
            draw_sprite_pos(spr_dw_tv_tvtimeSign_quizwipe, 0, (_xx - 80) + _xshifta, _yy - 35, _xx + 80 + _xshifta, _yy - 35, _xx + 80 + _xshiftb, _yy + 35, (_xx - 80) + _xshiftb, _yy + 35, 0.1);
            gpu_set_colorwriteenable(true, true, true, true);
        }
        else
        {
            draw_sprite_ext(spr_dw_tv_tvtimeSign_quizwipe, 0, _xx, _yy, 2, 2, 0, #555555, 1);
        }
        gpu_set_blendmode(bm_normal);
        gpu_set_alphatestref(128);
        gpu_set_alphatestenable(false);
        surface_reset_target();
        draw_surface(_surf, camerax(), cameray());
        surface_free(_surf);
    }
}
