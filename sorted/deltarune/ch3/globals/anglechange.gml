function scr_anglechange(arg0, arg1, arg2)
{
    arg0 = median(-arg2, arg2, angle_difference(arg1, arg0));
    return arg0;
}
