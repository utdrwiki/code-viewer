function draw_sprite_part_ext_rot(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
{
    if (arg2 < 0)
        arg2 = 0;
    if (arg3 < 0)
        arg3 = 0;
    var __xoffset = sprite_get_xoffset(arg0) * arg8;
    var __yoffset = sprite_get_yoffset(arg0) * arg9;
    var __newx = arg2 * arg8;
    var __newy = arg3 * arg9;
    var __theta = point_direction(__xoffset, __yoffset, __newx, __newy);
    var __radius = point_distance(__xoffset, __yoffset, __newx, __newy);
    __theta += arg10;
    var __xx = arg6 + lengthdir_x(__radius, __theta);
    var __yy = arg7 + lengthdir_y(__radius, __theta);
    draw_sprite_general(arg0, arg1, arg2, arg3, (arg4 / arg8) - arg2, (arg5 / arg9) - arg3, __xx, __yy, arg8, arg9, arg10, arg11, arg11, arg11, arg11, arg12);
}
