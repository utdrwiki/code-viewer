scr_dark_marker_depth = function(argument0, argument1, argument2, argument3) //gml_Script_scr_dark_marker_depth
{
    thismarker = instance_create_depth(argument0, argument1, argument2, obj_marker)
    with (thismarker)
    {
        sprite_index = argument3
        image_speed = 0
        image_xscale = 2
        image_yscale = 2
    }
    return thismarker;
}

