scr_lrecoitem_ch1 = function(argument0) //gml_Script_scr_lrecoitem_ch1
{
    scr_lrecover_ch1(argument0)
    global.item[8] = recovered
    if (maxedout == 1)
        global.item[8] = 9999
    global.msg[0] += scr_84_get_lang_string_ch1("scr_lrecoitem_slash_scr_lrecoitem_gml_11_0")
    if (global.item[8] < 999)
        global.msg[0] += scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("scr_lrecoitem_slash_scr_lrecoitem_gml_14_0"), string(global.item[8]))
    else
        global.msg[0] += scr_84_get_lang_string_ch1("scr_lrecoitem_slash_scr_lrecoitem_gml_16_0")
    script_execute(gml_Script_scr_writetext_ch1, 0, "x", 0, 0)
    return;
}

