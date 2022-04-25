scr_pan_ch1 = function(argument0, argument1, argument2) //gml_Script_scr_pan_ch1
{
    panner = instance_create_ch1(0, 0, obj_panner_ch1)
    panner.panmax = argument2
    panner.panx = argument0
    panner.pany = argument1
    return;
}

