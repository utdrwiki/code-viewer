scr_wall_intersect_y = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_wall_intersect_y
{
    var xlength = lengthdir_x(argument2, argument3)
    if (sign((xlength - x)) != sign((argument4 - x)))
        return (argument0 + lengthdir_x(argument2, argument3));
    return (argument1 + lengthdir_y((abs((argument0 - argument4)) / xlength), argument3));
}

