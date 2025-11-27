function scr_intercept_y(arg0, arg1, arg2, arg3, arg4)
{
    var __ylength = lengthdir_y(arg2, arg3);
    var __xlength = lengthdir_x(arg2, arg3);
    var __dist = arg4 - arg0;
    if (sign(__xlength) != sign(__dist) || abs(__xlength) < abs(__dist))
        return arg1 + __ylength;
    else
        return arg1 + (__ylength * (__dist / __xlength));
}
