function scr_approach_curve(arg0, arg1, arg2)
{
    return scr_approach(arg0, arg1, max(0.1, abs(arg1 - arg0) / arg2));
}
