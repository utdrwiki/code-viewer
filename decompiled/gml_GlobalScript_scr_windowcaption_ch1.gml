scr_windowcaption_ch1 = function(argument0) //gml_Script_scr_windowcaption_ch1
{
    if (global.tempflag[10] == 1)
        window_set_caption(scr_84_get_lang_string_ch1("scr_windowcaption_slash_scr_windowcaption_gml_1_0"))
    else
        window_set_caption(argument0)
    return;
}

