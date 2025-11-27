function scr_custom_marker_depth(arg0, arg1, arg2, arg3, arg4)
{
    thismarker = instance_create_depth(arg0, arg1, arg2, arg3);
    with (thismarker)
    {
        sprite_index = arg4;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
    }
    return thismarker;
}
