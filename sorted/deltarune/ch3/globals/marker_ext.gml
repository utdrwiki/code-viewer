function scr_marker_ext(arg0, arg1, arg2, arg3 = 1, arg4 = 1, arg5 = 0, arg6 = 0, arg7 = 16777215, arg8 = depth, arg9 = false, arg10 = -1, arg11 = 1)
{
    var thismarker = instance_create(arg0, arg1, obj_marker);
    with (thismarker)
    {
        depth = arg8;
        sprite_index = arg2;
        image_speed = arg5;
        image_xscale = arg3;
        image_yscale = arg4;
        image_index = arg6;
        image_blend = arg7;
        image_alpha = arg11;
        if (arg9)
            scr_depth();
    }
    if (arg10 > 0)
        scr_doom(thismarker, arg10);
    return thismarker;
}
