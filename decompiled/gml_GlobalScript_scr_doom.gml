scr_doom = function(argument0, argument1) //gml_Script_scr_doom
{
    with (instance_create_depth(0, 0, 0, obj_doom))
    {
        alarm[0] = argument1
        target = argument0
    }
    return;
}

