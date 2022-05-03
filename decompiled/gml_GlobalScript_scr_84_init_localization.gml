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
            ds_map_add(sm, "spr_bnamekris", 2258)
            ds_map_add(sm, "spr_bnameralsei", 2259)
            ds_map_add(sm, "spr_bnamesusie", 2260)
            ds_map_add(sm, "spr_btact", 2261)
            ds_map_add(sm, "spr_btdefend", 2262)
            ds_map_add(sm, "spr_btfight", 2263)
            ds_map_add(sm, "spr_btitem", 2264)
            ds_map_add(sm, "spr_btspare", 2266)
            ds_map_add(sm, "spr_bttech", 2265)
            ds_map_add(sm, "spr_darkmenudesc", 2461)
            ds_map_add(sm, "spr_dmenu_captions", 2363)
            ds_map_add(sm, "spr_quitmessage", 3247)
            ds_map_add(sm, "spr_thrashbody_b", 2331)
            ds_map_add(sm, "spr_thrashfoot_b", 2329)
            ds_map_add(sm, "spr_fieldmuslogo", 2483)
            ds_map_add(sm, "spr_werewire_zzt_text", 3272)
            ds_map_add(sm, "spr_face_queen", 175)
            ds_map_add(sm, "spr_city_mice_sign_01", 247)
            ds_map_add(sm, "spr_city_mice_sign_02", 2818)
            ds_map_add(sm, "spr_city_mice_sign_03", 3179)
            ds_map_add(sm, "spr_bnamenoelle", 866)
            ds_map_add(sm, "spr_bnamethrash", 3310)
            ds_map_add(sm, "spr_cutscene_27_tender_goodbye", 2998)
            ds_map_add(sm, "spr_ch2_cityscreen", 3279)
            ds_map_add(sm, "spr_battlemsg", 3073)
            ds_map_add(sm, "spr_queenscreen", 2116)
            ds_map_add(sm, "spr_acrade_retire", 3156)
            ds_map_add(sm, "spr_sneo_playback", 3320)
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
            ds_map_add(sm, "spr_bnamekris", 2235)
            ds_map_add(sm, "spr_bnameralsei", 2236)
            ds_map_add(sm, "spr_bnamesusie", 2238)
            ds_map_add(sm, "spr_btact", 2240)
            ds_map_add(sm, "spr_btdefend", 2242)
            ds_map_add(sm, "spr_btfight", 2243)
            ds_map_add(sm, "spr_btitem", 2248)
            ds_map_add(sm, "spr_btspare", 2244)
            ds_map_add(sm, "spr_bttech", 2250)
            ds_map_add(sm, "spr_darkmenudesc", 2451)
            ds_map_add(sm, "spr_dmenu_captions", 2351)
            ds_map_add(sm, "spr_quitmessage", 2543)
            ds_map_add(sm, "spr_thrashbody_b", 2331)
            ds_map_add(sm, "spr_thrashfoot_b", 2329)
            ds_map_add(sm, "spr_fieldmuslogo", 2483)
            ds_map_add(sm, "spr_werewire_zzt_text", 1741)
            ds_map_add(sm, "spr_face_queen", 643)
            ds_map_add(sm, "spr_city_mice_sign_01", 3075)
            ds_map_add(sm, "spr_city_mice_sign_02", 3076)
            ds_map_add(sm, "spr_city_mice_sign_03", 3077)
            ds_map_add(sm, "spr_bnamenoelle", 2239)
            ds_map_add(sm, "spr_bnamethrash", 2237)
            ds_map_add(sm, "spr_cutscene_27_tender_goodbye", 373)
            ds_map_add(sm, "spr_ch2_cityscreen", 3060)
            ds_map_add(sm, "spr_battlemsg", 2527)
            ds_map_add(sm, "spr_queenscreen", 37)
            ds_map_add(sm, "spr_acrade_retire", 2193)
            ds_map_add(sm, "spr_sneo_playback", 3273)
            sndm = global.chemg_sound_map
        }
    }
    return;
}

