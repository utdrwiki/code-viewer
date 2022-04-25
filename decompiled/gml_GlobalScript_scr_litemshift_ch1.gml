scr_litemshift_ch1 = function(argument0, argument1) //gml_Script_scr_litemshift_ch1
{
    global.litem[8] = argument1
    for (i = argument0; i < 8; i += 1)
        global.litem[i] = global.litem[(i + 1)]
    script_execute(gml_Script_scr_litemname_ch1)
    return;
}

