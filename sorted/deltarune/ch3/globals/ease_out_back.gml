function ease_out_back(arg0, arg1, arg2, arg3, arg4 = 1.70158)
{
    arg0 = (arg0 / arg3) - 1;
    return (arg2 * ((arg0 * arg0 * (((arg4 + 1) * arg0) + arg4)) + 1)) + arg1;
}
