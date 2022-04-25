scr_orbitx = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_orbitx
{
    if (argument4 == 0)
        return argument2;
    var __theta = point_direction(argument0, argument1, argument2, argument3)
    var __radius = point_distance(argument0, argument1, argument2, argument3)
    __theta += argument4
    return (argument0 + lengthdir_x(__radius, __theta));
}

