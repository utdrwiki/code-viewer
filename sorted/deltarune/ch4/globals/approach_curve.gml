function scr_approach_curve(arg0, arg1, arg2, arg3 = 0.1)
{
    return scr_approach(arg0, arg1, max(arg3, abs(arg1 - arg0) / arg2));
}
