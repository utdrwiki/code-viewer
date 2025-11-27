function scr_marker_jitter()
{
    var thismarker = instance_create(argument0, argument1, obj_marker_jitter);
    with (thismarker)
    {
        sprite_index = argument2;
        image_speed = 0;
    }
    return thismarker;
}
