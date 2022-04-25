scr_actinfo_ch1 = function(argument0) //gml_Script_scr_actinfo_ch1
{
    actcost = -1
    acttype = 0
    actspell = 0
    actor = 1
    actname = " "
    switch argument0
    {
        case 0:
            actcost = -1
            acttype = 0
            actspell = 0
            actor = 1
            actname = " "
            break
        case 1:
            actcost = -1
            acttype = 0
            actspell = 0
            actor = 1
            actname = scr_84_get_lang_string_ch1("scr_actinfo_slash_scr_actinfo_gml_21_0")
            break
        case 2:
            actcost = -1
            acttype = 1
            actspell = 2
            actor = 2
            actname = scr_84_get_lang_string_ch1("scr_actinfo_slash_scr_actinfo_gml_28_0")
            break
    }

    return;
}

