scr_kingface_ch1 = function(argument0, argument1) //gml_Script_scr_kingface_ch1
{
    if (global.plot >= 235)
        global.msg[argument0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("scr_kingface_slash_scr_kingface_gml_3_0"), string(argument1))
    else
        global.msg[argument0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("scr_kingface_slash_scr_kingface_gml_7_0"), string(argument1))
    return;
}

