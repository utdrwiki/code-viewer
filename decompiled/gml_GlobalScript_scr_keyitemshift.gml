scr_keyitemshift = function(argument0, argument1) //gml_Script_scr_keyitemshift
{
    global.keyitem[12] = argument1
    for (i = argument0; i < 12; i += 1)
        global.keyitem[i] = global.keyitem[(i + 1)]
    scr_keyiteminfo_all()
    return;
}

