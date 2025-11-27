function scr_fancy_ripple(arg0, arg1, arg2 = 60, arg3 = 16159050, arg4 = 160, arg5 = 1, arg6 = 15, arg7 = 1999000, arg8 = 0, arg9 = 0, arg10 = 0.1, arg11 = 0)
{
    if (!instance_exists(obj_fancy_ripples))
        instance_create_depth(0, 0, arg7, obj_fancy_ripples);
    with (obj_fancy_ripples)
    {
        depth = arg7;
        MakeRipple(arg0, arg1, arg4, arg5, arg6, arg3, arg8, arg9, arg10, arg2, arg11);
    }
}

function scr_fancy_ripple_alt(arg0, arg1, arg2 = 60, arg3 = 16159050, arg4 = 160, arg5 = 1, arg6 = 15, arg7 = 1999000, arg8 = 0, arg9 = 0, arg10 = 0.1, arg11 = 0)
{
    if (!instance_exists(obj_fancy_ripples_alt))
        instance_create_depth(0, 0, arg7, obj_fancy_ripples_alt);
    with (obj_fancy_ripples_alt)
    {
        depth = arg7;
        MakeRipple(arg0, arg1, arg4, arg5, arg6, arg3, arg8, arg9, arg10, arg2, arg11);
    }
}
