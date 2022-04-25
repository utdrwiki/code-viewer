scr_keyitemshift_ch1 = function(argument0, argument1) //gml_Script_scr_keyitemshift_ch1
{
    global.keyitem[12] = argument1
    for (i = argument0; i < 12; i += 1)
        global.keyitem[i] = global.keyitem[(i + 1)]
    scr_keyiteminfo_all_ch1()
    return;
}

