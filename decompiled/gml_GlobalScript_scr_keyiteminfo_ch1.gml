scr_keyiteminfo_ch1 = function(argument0) //gml_Script_scr_keyiteminfo_ch1
{
    tempkeyitemdesc = "---"
    tempkeyitemname = " "
    tempkeyitemusable = false
    switch argument0
    {
        case 0:
            tempkeyitemdesc = "---"
            tempkeyitemname = " "
            break
        case 1:
            tempkeyitemdesc = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_13_0")
            tempkeyitemname = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_14_0")
            tempkeyitemusable = true
            break
        case 2:
            tempkeyitemdesc = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_18_0")
            tempkeyitemname = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_19_0")
            tempkeyitemusable = true
            break
        case 3:
            tempkeyitemdesc = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_23_0")
            tempkeyitemname = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_24_0")
            break
        case 4:
            tempkeyitemdesc = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_27_0")
            tempkeyitemname = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_28_0")
            break
        case 5:
            tempkeyitemdesc = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_31_0")
            tempkeyitemname = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_32_0")
            break
        case 6:
            tempkeyitemdesc = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_35_0")
            tempkeyitemname = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_36_0")
            break
        case 7:
            tempkeyitemdesc = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_39_0")
            tempkeyitemname = scr_84_get_lang_string_ch1("scr_keyiteminfo_slash_scr_keyiteminfo_gml_40_0")
            break
    }

    return;
}

