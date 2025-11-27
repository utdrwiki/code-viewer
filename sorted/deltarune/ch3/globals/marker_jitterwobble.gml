function scr_marker_jitterwobble()
{
    var thismarker = instance_create(argument0, argument1, obj_marker_jitterwobble);
    with (thismarker)
    {
        sprite_index = argument2;
        image_speed = 0;
    }
    return thismarker;
}
