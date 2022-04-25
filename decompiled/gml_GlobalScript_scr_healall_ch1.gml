scr_healall_ch1 = function(argument0) //gml_Script_scr_healall_ch1
{
    for (i = 0; i < 3; i += 1)
    {
        if (global.char[i] != 0)
            scr_heal_ch1(i, argument0)
    }
    return;
}

