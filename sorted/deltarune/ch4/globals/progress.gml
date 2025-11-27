function scr_progress(arg0, arg1, arg2, arg3, arg4)
{
    return clamp(arg3 + (((arg0 - arg1) / (arg2 - arg1)) * (arg4 - arg3)), arg3, arg4);
}
