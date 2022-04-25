scr_fadeout = function(argument0) //gml_Script_scr_fadeout
{
    __fadeouter = instance_create((camerax() - 200), (cameray() - 200), obj_fadeout)
    __fadeouter.fadespeed = (1 / argument0)
    __fadeouter.depth = 3
    return __fadeouter;
}

