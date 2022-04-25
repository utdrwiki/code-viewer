scr_litemshift = function(argument0, argument1) //gml_Script_scr_litemshift
{
    global.litem[8] = argument1
    for (i = argument0; i < 8; i += 1)
        global.litem[i] = global.litem[(i + 1)]
    script_execute(gml_Script_scr_litemname)
    return;
}

