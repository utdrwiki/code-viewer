scr_debug_ch1 = function() //gml_Script_scr_debug_ch1
{
    if instance_exists(obj_debugcontroller_ch1)
        return obj_debugcontroller_ch1.debug;
    return;
}

