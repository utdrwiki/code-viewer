function lerp_clamped(arg0, arg1, arg2)
{
    if (arg0 > arg1)
        return clamp(lerp(arg0, arg1, arg2), arg1, arg0);
    else
        return clamp(lerp(arg0, arg1, arg2), arg0, arg1);
}
