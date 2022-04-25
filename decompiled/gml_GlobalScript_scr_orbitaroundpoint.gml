scr_orbitaroundpoint = function(argument0, argument1, argument2) //gml_Script_scr_orbitaroundpoint
{
    var __theta = point_direction(argument0, argument1, x, y)
    var __radius = point_distance(argument0, argument1, x, y)
    __theta += argument2
    x = (argument0 + lengthdir_x(__radius, __theta))
    y = (argument1 + lengthdir_y(__radius, __theta))
    return;
}

