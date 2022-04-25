scr_debug_fullheal = function() //gml_Script_scr_debug_fullheal
{
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = true
    }
    scr_healallitemspell(999)
    for (i = 0; i < 3; i++)
    {
        with (global.charinstance[i])
            tu--
    }
    return;
}

