function draw_sprite_rotated(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var _sw = sprite_get_width(arg0);
    var _sh = sprite_get_height(arg0);
    var _sx = sprite_get_xoffset(arg0);
    var _sy = sprite_get_yoffset(arg0);
    arg2 += ((_sw / 2) - _sx);
    arg3 += ((_sh / 2) - _sy);
    var _depth = lengthdir_y(arg7, arg6);
    if (abs(_depth) == 1)
        _depth = 0.99 * sign(_depth);
    var _x1 = arg2 - (lengthdir_x(_sw / 2, arg6) * (1 / (1 - _depth)));
    var _y1 = arg3 - ((_sh / 2) * (1 / (1 - _depth)));
    var _x2 = arg2 + (lengthdir_x(_sw / 2, arg6) * (1 / (1 + _depth)));
    var _y2 = arg3 - ((_sh / 2) * (1 / (1 + _depth)));
    var _x3 = arg2 + (lengthdir_x(_sw / 2, arg6) * (1 / (1 + _depth)));
    var _y3 = arg3 + ((_sh / 2) * (1 / (1 + _depth)));
    var _x4 = arg2 - (lengthdir_x(_sw / 2, arg6) * (1 / (1 - _depth)));
    var _y4 = arg3 + ((_sh / 2) * (1 / (1 - _depth)));
    draw_sprite_pos_fixed_col(arg0, arg1, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, arg4, arg5);
}

function draw_sprite_rotated_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    var _sw = sprite_get_width(arg0) * arg4;
    var _sh = sprite_get_height(arg0) * arg5;
    var _sx = sprite_get_xoffset(arg0) * arg4;
    var _sy = sprite_get_yoffset(arg0) * arg5;
    arg2 += ((_sw / 2) - _sx);
    arg3 += ((_sh / 2) - _sy);
    var _depth = lengthdir_y(arg9, arg8);
    if (abs(_depth) == 1)
        _depth = 0.99 * sign(_depth);
    var _x1 = arg2 - (lengthdir_x(_sw / 2, arg8) * (1 / (1 - _depth)));
    var _y1 = arg3 - ((_sh / 2) * (1 / (1 - _depth)));
    var _x2 = arg2 + (lengthdir_x(_sw / 2, arg8) * (1 / (1 + _depth)));
    var _y2 = arg3 - ((_sh / 2) * (1 / (1 + _depth)));
    var _x3 = arg2 + (lengthdir_x(_sw / 2, arg8) * (1 / (1 + _depth)));
    var _y3 = arg3 + ((_sh / 2) * (1 / (1 + _depth)));
    var _x4 = arg2 - (lengthdir_x(_sw / 2, arg8) * (1 / (1 - _depth)));
    var _y4 = arg3 + ((_sh / 2) * (1 / (1 - _depth)));
    draw_sprite_pos_fixed_col(arg0, arg1, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, arg6, arg7);
}

function draw_sprite_rotated_ext_old(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    var _sw = sprite_get_width(arg0) * arg4;
    var _sh = sprite_get_height(arg0) * arg5;
    var _sx = sprite_get_xoffset(arg0) * arg4;
    var _sy = sprite_get_yoffset(arg0) * arg5;
    arg2 += ((_sw / 2) - _sx);
    arg3 += ((_sh / 2) - _sy);
    var _x1 = arg2 - lengthdir_x(_sw / 2, arg8);
    var _y1 = arg3 - ((_sh / 2) * (1 + lengthdir_y(arg9, arg8)));
    var _x2 = arg2 + lengthdir_x(_sw / 2, arg8);
    var _y2 = arg3 - ((_sh / 2) * (1 - lengthdir_y(arg9, arg8)));
    var _x3 = arg2 + lengthdir_x(_sw / 2, arg8);
    var _y3 = arg3 + ((_sh / 2) * (1 - lengthdir_y(arg9, arg8)));
    var _x4 = arg2 - lengthdir_x(_sw / 2, arg8);
    var _y4 = arg3 + ((_sh / 2) * (1 + lengthdir_y(arg9, arg8)));
    draw_sprite_pos_fixed_col(arg0, arg1, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, arg6, arg7);
}

function draw_sprite_rotated_pivot(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
{
    var _sw = sprite_get_width(arg0) * arg4;
    var _sh = sprite_get_height(arg0) * arg5;
    var _sx = sprite_get_xoffset(arg0) * arg4;
    var _sy = sprite_get_yoffset(arg0) * arg5;
    arg6 *= arg4;
    arg7 *= arg5;
    arg2 += (arg6 - _sx);
    arg3 += (arg7 - _sy);
    var _depth = lengthdir_y(arg11, arg10);
    var _pivxl = arg6 / _sw;
    var _pivxr = 1 - (arg6 / _sw);
    if (abs(_depth) == 1)
        _depth = 0.99 * sign(_depth);
    var _x1 = arg2 - (lengthdir_x(arg6, arg10) * (1 / (_pivxl * (1 - _depth))));
    var _y1 = arg3 - (arg7 * (1 / (_pivxl * (1 - _depth))));
    var _x2 = arg2 + (lengthdir_x(_sw - arg6, arg10) * (1 / (_pivxr * (1 + _depth))));
    var _y2 = arg3 - (arg7 * (1 / (_pivxr * (1 + _depth))));
    var _x3 = arg2 + (lengthdir_x(_sw - arg6, arg10) * (1 / (_pivxr * (1 + _depth))));
    var _y3 = arg3 + ((_sh - arg7) * (1 / (_pivxr * (1 + _depth))));
    var _x4 = arg2 - (lengthdir_x(arg6, arg10) * (1 / (_pivxl * (1 - _depth))));
    var _y4 = arg3 + ((_sh - arg7) * (1 / (_pivxl * (1 - _depth))));
    draw_sprite_pos_fixed_col(arg0, arg1, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, arg8, arg9);
}
