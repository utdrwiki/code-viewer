scr_phonename_ch1 = function() //gml_Script_scr_phonename_ch1
{
    for (i = 0; i < 8; i += 1)
        global.phonename[i] = " "
    for (i = 0; i < 8; i += 1)
    {
        itemid = global.phone[i]
        switch itemid
        {
            case 201:
                global.phonename[i] = scr_84_get_lang_string_ch1("scr_phonename_slash_scr_phonename_gml_17_0")
                break
            case 202:
                global.phonename[i] = scr_84_get_lang_string_ch1("scr_phonename_slash_scr_phonename_gml_20_0")
                if (global.flag[274] >= 2)
                    global.phonename[i] = scr_84_get_lang_string_ch1("scr_phonename_slash_scr_phonename_gml_21_0")
                break
        }

    }
    return;
}

