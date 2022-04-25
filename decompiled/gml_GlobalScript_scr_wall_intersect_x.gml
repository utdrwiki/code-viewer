scr_wall_intersect_x = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_wall_intersect_x
{
    var ylength = lengthdir_y(argument2, argument3)
    if (sign((ylength - y)) != sign((argument4 - y)))
        return (argument0 + lengthdir_x(argument2, argument3));
    else
        return (argument0 + lengthdir_x((abs((argument1 - argument4)) / ylength), argument3));
}

