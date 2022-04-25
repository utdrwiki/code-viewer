scr_spellinfo_ch1 = function(argument0) //gml_Script_scr_spellinfo_ch1
{
    cost = -1
    spelltarget = 1
    spellname = " "
    spellnameb = " "
    spelldescb = " "
    spelldesc = " "
    spellanim = false
    spellusable = false
    spelltext = " "
    switch argument0
    {
        case 0:
            spellname = " "
            spellnameb = " "
            spelltarget = 0
            cost = -1
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_18_0")
            break
        case 1:
            spellname = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_21_0")
            spellnameb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_22_0")
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_23_0")
            spelldesc = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_24_0")
            spelltarget = 2
            cost = 125
            spellusable = false
            break
        case 2:
            spellname = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_31_0")
            spellnameb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_32_0")
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_33_0")
            spelldesc = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_34_0")
            spelltarget = 1
            cost = 80
            usable = false
            spellusable = true
            break
        case 3:
            spellname = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_42_0")
            spellnameb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_43_0")
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_44_0")
            spelldesc = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_45_0")
            spelltarget = 2
            cost = 40
            usable = false
            spellusable = false
            break
        case 4:
            spellname = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_52_0")
            spellnameb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_53_0")
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_54_0")
            spelldesc = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_55_0")
            spelltarget = 2
            cost = 125
            if (global.charweapon[2] == 7)
                cost = 100
            spellusable = false
            break
        case 5:
            spellname = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_64_0")
            spellnameb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_65_0")
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_66_0")
            spelldesc = " "
            spelltarget = 2
            cost = 0
            spellusable = false
            break
        case 6:
            spellname = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_75_0")
            spellnameb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_76_0")
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_77_0")
            spelldesc = " "
            spelltarget = 0
            cost = 0
            spellusable = false
            break
        case 7:
            spellname = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_86_0")
            spellnameb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_87_0")
            spelldescb = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_88_0")
            spelldesc = scr_84_get_lang_string_ch1("scr_spellinfo_slash_scr_spellinfo_gml_89_0")
            spelltarget = 0
            cost = 0
            spellusable = false
            break
    }

    return;
}

