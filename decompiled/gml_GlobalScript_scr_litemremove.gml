scr_litemremove = function(argument0) //gml_Script_scr_litemremove
{
    for (i = 0; i < 8; i += 1)
    {
        if (global.litem[i] == argument0)
            script_execute(gml_Script_scr_litemshift, i, 0)
    }
    return;
}

