scr_marker_ch1 = function(argument0, argument1, argument2) //gml_Script_scr_marker_ch1
{
    thismarker = instance_create_ch1(argument0, argument1, obj_marker_ch1)
    with (thismarker)
    {
        sprite_index = argument2
        image_speed = 0
    }
    return thismarker;
}

