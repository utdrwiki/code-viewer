function clamp_gradual(arg0, arg1, arg2, arg3)
{
    if (arg0 < arg1)
    {
        arg0 += abs(arg3);
        if (arg0 > arg1)
            return arg1;
    }
    if (arg0 > arg2)
    {
        arg0 -= abs(arg3);
        if (arg0 < arg2)
            return arg2;
    }
    return arg0;
}
