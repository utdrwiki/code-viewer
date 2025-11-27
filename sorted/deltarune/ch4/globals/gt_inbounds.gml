function gt_inbounds(arg0, arg1)
{
    return gt_inbounds_tol(arg0, arg1, 0);
}

function gt_inbounds_tol(arg0, arg1, arg2)
{
    return arg0 >= (gt_minx - arg2) && arg0 <= (gt_maxx + arg2) && arg1 >= (gt_miny - arg2) && arg1 <= (gt_maxy + arg2);
}

function gt_inward(arg0, arg1, arg2)
{
    return gt_inward_tol(arg0, arg1, arg2, 0);
}

function gt_inward_tol(arg0, arg1, arg2, arg3)
{
    if (gt_inbounds_tol(arg0, arg1, arg3))
        return true;
    else if (arg0 < (gt_minx() - arg3) && abs(angle_difference(arg2, 0) > 90))
        return false;
    else if (arg0 > (gt_maxx() + arg3) && abs(angle_difference(arg2, 180) > 90))
        return false;
    else if (arg1 < (gt_miny() - arg3) && abs(angle_difference(arg2, 270) > 90))
        return false;
    else if (arg1 > (gt_maxy() + arg3) && abs(angle_difference(arg2, 90) > 90))
        return false;
    return true;
}
