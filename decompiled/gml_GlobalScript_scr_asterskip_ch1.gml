scr_asterskip_ch1 = function() //gml_Script_scr_asterskip_ch1
{
    if (aster == true && autoaster == true)
    {
        length += 2
        mystring = string_insert(scr_84_get_lang_string_ch1("scr_asterskip_slash_scr_asterskip_gml_4_0"), mystring, i)
    }
    if (aster == 2)
        aster = true
    return;
}

