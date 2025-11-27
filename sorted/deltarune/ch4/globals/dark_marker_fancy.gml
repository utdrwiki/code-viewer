function scr_dark_marker_fancy(arg0, arg1, arg2)
{
    var _thismarker = instance_create(arg0, arg1, obj_marker_fancy);
    with (_thismarker)
    {
        sprite_index = arg2;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
    }
    return _thismarker;
}
