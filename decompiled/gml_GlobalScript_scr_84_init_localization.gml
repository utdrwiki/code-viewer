scr_84_init_localization = function() //gml_Script_scr_84_init_localization
{
    var _locale = os_get_language()
    if (os_type == os_switch)
        var _lang = substr(switch_language_get_desired_language(), 1, 2)
    else
        _lang = (substr(_locale, 1, 2) != "ja" ? "en" : "ja")
    global.lang = _lang
    if ossafe_file_exists("true_config.ini")
    {
        ossafe_ini_open("true_config.ini")
        global.lang = ini_read_string("LANG", "LANG", _lang)
        ossafe_ini_close()
    }
    if (!variable_global_exists("lang_loaded"))
        global.lang_loaded = ""
    if (global.lang_loaded != global.lang)
    {
        global.lang_loaded = global.lang
        if variable_global_exists("lang_map")
        {
            ds_map_destroy(global.lang_map)
            ds_map_destroy(global.font_map)
            ds_map_destroy(global.chemg_sprite_map)
            ds_map_destroy(global.chemg_sound_map)
        }
        global.lang_map = ds_map_create()
        global.font_map = ds_map_create()
        global.lang_missing_map = ds_map_create()
        global.chemg_sprite_map = ds_map_create()
        global.chemg_sound_map = ds_map_create()
        scr_84_lang_load()
        scr_ascii_input_names()
        global.chemg_last_get_font = ""
        if (global.lang == "ja")
        {
            var fm = global.font_map
            ds_map_add(fm, "main", 10)
            ds_map_add(fm, "mainbig", 8)
            ds_map_add(fm, "tinynoelle", 12)
            ds_map_add(fm, "dotumche", 7)
            ds_map_add(fm, "comicsans", 6)
            ds_map_add(fm, "small", 9)
            var sm = global.chemg_sprite_map
            ds_map_add(sm, "spr_bnamekris", 2254)
            ds_map_add(sm, "spr_bnameralsei", 2255)
            ds_map_add(sm, "spr_bnamesusie", 2256)
            ds_map_add(sm, "spr_btact", 2257)
            ds_map_add(sm, "spr_btdefend", 2258)
            ds_map_add(sm, "spr_btfight", 2259)
            ds_map_add(sm, "spr_btitem", 2260)
            ds_map_add(sm, "spr_btspare", 2262)
            ds_map_add(sm, "spr_bttech", 2261)
            ds_map_add(sm, "spr_darkmenudesc", 2457)
            ds_map_add(sm, "spr_dmenu_captions", 2359)
            ds_map_add(sm, "spr_quitmessage", 3244)
            ds_map_add(sm, "spr_thrashbody_b", 2327)
            ds_map_add(sm, "spr_thrashfoot_b", 2325)
            ds_map_add(sm, "spr_fieldmuslogo", 2479)
            ds_map_add(sm, "spr_werewire_zzt_text", 3269)
            ds_map_add(sm, "spr_face_queen", 175)
            ds_map_add(sm, "spr_city_mice_sign_01", 247)
            ds_map_add(sm, "spr_city_mice_sign_02", 2814)
            ds_map_add(sm, "spr_city_mice_sign_03", 3176)
            ds_map_add(sm, "spr_bnamenoelle", 865)
            ds_map_add(sm, "spr_bnamethrash", 3307)
            ds_map_add(sm, "spr_cutscene_27_tender_goodbye", 2995)
            ds_map_add(sm, "spr_ch2_cityscreen", 3276)
            ds_map_add(sm, "spr_battlemsg", 3070)
            ds_map_add(sm, "spr_queenscreen", 2111)
            ds_map_add(sm, "spr_acrade_retire", 3153)
            ds_map_add(sm, "spr_sneo_playback", 3317)
            var sndm = global.chemg_sound_map
        }
        else
        {
            fm = global.font_map
            ds_map_add(fm, "main", 3)
            ds_map_add(fm, "mainbig", 2)
            ds_map_add(fm, "tinynoelle", 0)
            ds_map_add(fm, "dotumche", 1)
            ds_map_add(fm, "comicsans", 4)
            ds_map_add(fm, "small", 5)
            sm = global.chemg_sprite_map
            ds_map_add(sm, "spr_bnamekris", 2231)
            ds_map_add(sm, "spr_bnameralsei", 2232)
            ds_map_add(sm, "spr_bnamesusie", 2234)
            ds_map_add(sm, "spr_btact", 2236)
            ds_map_add(sm, "spr_btdefend", 2238)
            ds_map_add(sm, "spr_btfight", 2239)
            ds_map_add(sm, "spr_btitem", 2244)
            ds_map_add(sm, "spr_btspare", 2240)
            ds_map_add(sm, "spr_bttech", 2246)
            ds_map_add(sm, "spr_darkmenudesc", 2447)
            ds_map_add(sm, "spr_dmenu_captions", 2347)
            ds_map_add(sm, "spr_quitmessage", 2539)
            ds_map_add(sm, "spr_thrashbody_b", 2327)
            ds_map_add(sm, "spr_thrashfoot_b", 2325)
            ds_map_add(sm, "spr_fieldmuslogo", 2479)
            ds_map_add(sm, "spr_werewire_zzt_text", 1736)
            ds_map_add(sm, "spr_face_queen", 642)
            ds_map_add(sm, "spr_city_mice_sign_01", 3072)
            ds_map_add(sm, "spr_city_mice_sign_02", 3073)
            ds_map_add(sm, "spr_city_mice_sign_03", 3074)
            ds_map_add(sm, "spr_bnamenoelle", 2235)
            ds_map_add(sm, "spr_bnamethrash", 2233)
            ds_map_add(sm, "spr_cutscene_27_tender_goodbye", 373)
            ds_map_add(sm, "spr_ch2_cityscreen", 3057)
            ds_map_add(sm, "spr_battlemsg", 2523)
            ds_map_add(sm, "spr_queenscreen", 37)
            ds_map_add(sm, "spr_acrade_retire", 2188)
            ds_map_add(sm, "spr_sneo_playback", 3270)
            sndm = global.chemg_sound_map
        }
    }
    return;
}

