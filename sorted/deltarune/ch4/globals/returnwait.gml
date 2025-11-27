function scr_returnwait(arg0, arg1, arg2, arg3, arg4)
{
    return max(1, round(point_distance(arg0, arg1, arg2, arg3) / arg4));
}
