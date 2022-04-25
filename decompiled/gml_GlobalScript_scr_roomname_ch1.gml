scr_roomname_ch1 = function(argument0) //gml_Script_scr_roomname_ch1
{
    roomname = " "
    if (argument0 == 0)
        roomname = "---"
    if (argument0 == 282)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_3_0")
    if (argument0 == 315)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_4_0")
    if (argument0 == 320)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_5_0")
    if (argument0 == 325)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_6_0")
    if (argument0 == 329)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_7_0")
    if (argument0 == 339)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_8_0")
    if (argument0 == 348)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_9_0")
    if (argument0 == 351)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_10_0")
    if (argument0 == 353)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_11_0")
    if (argument0 == 362)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_12_0")
    if (argument0 == 370)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_13_0")
    if (argument0 == 376)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_14_0")
    if (argument0 == 377)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_15_0")
    if (argument0 == 387)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_16_0")
    if (argument0 == 394)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_17_0")
    if (argument0 == 403)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_18_0")
    if (argument0 == 406)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_19_0")
    if (argument0 == 391)
        roomname = scr_84_get_lang_string_ch1("scr_roomname_slash_scr_roomname_gml_20_0")
    if (argument0 == 336)
    {
        if (global.lang == "en")
            roomname = "Field - Maze of Death"
        if (global.lang == "ja")
            roomname = "平原 - 死の迷路"
    }
    return roomname;
}

