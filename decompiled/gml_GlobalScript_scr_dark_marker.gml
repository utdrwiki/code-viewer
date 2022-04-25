scr_dark_marker = function(argument0, argument1, argument2) //gml_Script_scr_dark_marker
{
    thismarker = instance_create(argument0, argument1, obj_marker)
    with (thismarker)
    {
        sprite_index = argument2
        image_speed = 0
        image_xscale = 2
        image_yscale = 2
    }
    return thismarker;
}

