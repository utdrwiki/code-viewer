function scr_marker_blend(arg0 = x, arg1 = y, arg2 = sprite_index, arg3 = 1, arg4 = image_xscale, arg5 = image_yscale, arg6 = image_index, arg7 = image_speed, arg8 = image_alpha, arg9 = 16777215, arg10 = depth, arg11 = -1)
{
    var thismarker = instance_create(arg0, arg1, obj_marker_blendmode);
    with (thismarker)
    {
        blendmode = arg3;
        sprite_index = arg2;
        image_speed = arg7;
        image_xscale = arg4;
        image_yscale = arg5;
        image_index = arg6;
        image_blend = arg9;
        image_alpha = arg8;
        depth = arg10;
    }
    if (arg11 > 0)
        scr_doom(thismarker, arg11);
    return thismarker;
}
