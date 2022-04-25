scr_pan_lerp = function(argument0, argument1, argument2) //gml_Script_scr_pan_lerp
{
    panner = instance_create(argument0, argument1, obj_panner)
    panner.panmax = argument2
    panner.type = 1
    return;
}

