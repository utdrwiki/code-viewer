scr_remapvalue = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_remapvalue
{
    if (argument1 == argument0)
        return argument3;
    var __invLerp = ((argument2 - argument0) / (argument1 - argument0))
    return lerp(argument3, argument4, __invLerp);
}

remap = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_remap
{
    __invLerp = scr_inverselerp(argument1, argument2, argument0)
    return lerp(argument3, argument4, __invLerp);
}

remap_clamped = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_remap_clamped
{
    var __remapped_value = gml_Script_remap(argument0, argument1, argument2, argument3, argument4)
    return clamp(__remapped_value, argument3, argument4);
}

