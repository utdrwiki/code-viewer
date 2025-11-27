function scr_intercept_x(arg0, arg1, arg2, arg3, arg4)
{
    var __ylength = lengthdir_y(arg2, arg3);
    var __xlength = lengthdir_x(arg2, arg3);
    var __dist = arg4 - arg1;
    if (sign(__ylength) != sign(__dist) || abs(__ylength) < abs(__dist))
        return arg0 + __xlength;
    else
        return arg0 + (__xlength * (__dist / __ylength));
}
