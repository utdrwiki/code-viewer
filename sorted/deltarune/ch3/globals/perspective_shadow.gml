function scr_perspective_shadow(arg0, arg1 = 100)
{
    var _x2 = camerax() + (camerawidth() / 2);
    var _y2 = cameray() + (cameraheight() / 2);
    scr_perspective_shadow_ext(arg0, 0, _x2, _y2, false, 0, arg1);
}

function scr_perspective_shadow_ext(arg0, arg1, arg2, arg3 = 0, arg4 = false, arg5 = 0, arg6 = 100)
{
    with (arg0)
    {
        var _stl = scr_get_sprite_point(id, 0, 0, false);
        var _sbr = scr_get_sprite_point(id, 1, 1, false);
        var _sh = arg3 - scr_get_sprite_point(id, 0, 0, false).y;
        var _topdif = _stl.y - arg3;
        var _botdif = _sbr.y - arg3;
        var _tl = scr_perspective_scale_ext(_stl.x, arg3, arg6 + _topdif, arg1, arg2, arg6);
        var _tr = scr_perspective_scale_ext(_sbr.x, arg3, arg6 + _topdif, arg1, arg2, arg6);
        var _bl = scr_perspective_scale_ext(_stl.x, arg3, arg6 + _botdif, arg1, arg2, arg6);
        var _br = scr_perspective_scale_ext(_sbr.x, arg3, arg6 + _botdif, arg1, arg2, arg6);
        draw_sprite_pos_fixed_col(sprite_index, image_index, _tl.x, _tl.y, _tr.x, _tr.y, _br.x, _br.y, _bl.x, _bl.y, arg5, 1);
    }
}

function scr_perspective_shadow_alt(arg0, arg1, arg2, arg3 = 0, arg4 = false, arg5 = 0, arg6 = 100)
{
    with (arg0)
    {
        var _bl = scr_get_sprite_point(id, 0, 1, false);
        var _br = scr_get_sprite_point(id, 1, 1, false);
        if (!arg4)
            arg3 += _bl.y;
        var _sh = arg3 - scr_get_sprite_point(id, 0, 0, false).y;
        var _sl = scr_perspective_scale_ext(_bl.x, arg3, arg6 - _sh, arg1, arg2, arg6);
        var _sr = scr_perspective_scale_ext(_br.x, arg3, arg6 - _sh, arg1, arg2, arg6);
        if (!arg4 && arg3 != _bl.y)
        {
            _bl = scr_perspective_scale_ext(_bl.x, arg3, arg6 + (sprite_height - _sh), arg1, arg2);
            _br = scr_perspective_scale_ext(_br.x, arg3, arg6 + (sprite_height - _sh), arg1, arg2);
        }
        draw_sprite_pos_fixed_col(sprite_index, image_index, _sl.x, _sl.y, _sr.x, _sr.y, _br.x, arg3, _bl.x, arg3, arg5, 1);
    }
}
