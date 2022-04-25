scr_iteminfo_ch1 = function(argument0) //gml_Script_scr_iteminfo_ch1
{
    usable = false
    value = 0
    itemtarget = 0
    itemnameb = " "
    itemdescb = " "
    switch argument0
    {
        case 0:
            itemnameb = " "
            itemdescb = "---"
            break
        case 1:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_14_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_15_0")
            itemtarget = 1
            value = 25
            usable = true
            break
        case 2:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_21_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_22_0")
            itemtarget = 1
            value = 400
            usable = true
            break
        case 3:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_28_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_29_0")
            itemtarget = 0
            value = 200
            usable = false
            break
        case 4:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_35_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_36_0")
            itemtarget = 2
            value = 1
            usable = false
            break
        case 5:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_42_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_43_0")
            itemtarget = 1
            value = 5
            usable = true
            break
        case 6:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_49_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_50_0")
            itemtarget = 2
            value = 150
            usable = true
            break
        case 7:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_56_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_57_0")
            itemtarget = 2
            value = 5
            usable = true
            break
        case 8:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_63_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_64_0")
            itemtarget = 1
            value = 70
            usable = true
            break
        case 9:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_70_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_71_0")
            itemtarget = 1
            value = 10
            usable = true
            break
        case 10:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_77_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_78_0")
            itemtarget = 1
            value = 10
            usable = true
            break
        case 11:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_84_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_85_0")
            itemtarget = 2
            value = 70
            usable = true
            break
        case 12:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_91_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_92_0")
            itemtarget = 1
            value = 40
            usable = true
            break
        case 13:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_98_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_99_0")
            itemtarget = 1
            value = 40
            usable = true
            break
        case 14:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_105_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_106_0")
            itemtarget = 1
            value = 10
            usable = true
            break
        case 15:
            itemnameb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_112_0")
            itemdescb = scr_84_get_lang_string_ch1("scr_iteminfo_slash_scr_iteminfo_gml_113_0")
            itemtarget = 1
            value = 50
            usable = true
            break
    }

    return;
}

