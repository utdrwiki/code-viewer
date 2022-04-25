lerp_ease_ext = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_lerp_ease_ext
{
    if (argument2 && (!argument3))
        return lerp(argument0, argument1, scr_ease_in(argument4, argument5));
    else if ((!argument2) && argument3)
        return lerp(argument0, argument1, scr_ease_out(argument4, argument5));
    else if (argument2 && argument3)
        return lerp(argument0, argument1, scr_ease_inout(argument4, argument5));
    return lerp(argument0, argument1, argument4);
}

