function scr_rotatetowards_point(arg0, arg1, arg2, arg3)
{
    var __sx = x;
    var __sy = y;
    var __tx = arg1;
    var __ty = arg2;
    var __dir = arg0;
    var __delta = arg3;
    var __targetdir = point_direction(__sx, __sy, __tx, __ty);
    var __diff = angle_difference(__targetdir, __dir);
    if (abs(__diff) > __delta)
        return __dir + (sign(__diff) * __delta);
    else
        return __targetdir;
}

function scr_rotatetowards_point_ext(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var __sx = arg1;
    var __sy = arg2;
    var __tx = arg3;
    var __ty = arg4;
    var __dir = arg0;
    var __delta = arg5;
    var __targetdir = point_direction(__sx, __sy, __tx, __ty);
    var __diff = angle_difference(__targetdir, __dir);
    if (abs(__diff) > __delta)
        return __dir + (sign(__diff) * __delta);
    else
        return __targetdir;
}
