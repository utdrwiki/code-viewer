scr_pingpong = function(argument0, argument1) //gml_Script_scr_pingpong
{
    var __value = (argument0 % (argument1 * 2))
    if (__value > argument1)
        __value = ((argument1 * 2) - __value)
    return value;
}

