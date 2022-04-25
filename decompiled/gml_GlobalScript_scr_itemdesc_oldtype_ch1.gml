scr_itemdesc_oldtype_ch1 = function(argument0) //gml_Script_scr_itemdesc_oldtype_ch1
{
    global.msg[0] = scr_84_get_lang_string_ch1("scr_itemdesc_oldtype_slash_scr_itemdesc_oldtype_gml_2_0")
    switch argument0
    {
        case 0:
            global.msg[0] = scr_84_get_lang_string_ch1("scr_itemdesc_oldtype_slash_scr_itemdesc_oldtype_gml_6_0")
            break
        case 1:
            global.msg[0] = scr_84_get_lang_string_ch1("scr_itemdesc_oldtype_slash_scr_itemdesc_oldtype_gml_9_0")
            break
        case 2:
            global.msg[0] = scr_84_get_lang_string_ch1("scr_itemdesc_oldtype_slash_scr_itemdesc_oldtype_gml_12_0")
            break
    }

    return;
}

