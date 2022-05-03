scr_84_init_localization_ch1 = function() //gml_Script_scr_84_init_localization_ch1
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
        global.chemg_sprite_map = ds_map_create()
        global.chemg_sound_map = ds_map_create()
        scr_84_lang_load_ch1()
        scr_ascii_input_names_ch1()
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
            ds_map_add(sm, "spr_bnamekris", 4052)
            ds_map_add(sm, "spr_bnameralsei", 4053)
            ds_map_add(sm, "spr_bnamesusie", 4054)
            ds_map_add(sm, "spr_btact", 4055)
            ds_map_add(sm, "spr_btdefend", 4056)
            ds_map_add(sm, "spr_btfight", 4057)
            ds_map_add(sm, "spr_btitem", 4058)
            ds_map_add(sm, "spr_btspare", 4060)
            ds_map_add(sm, "spr_bttech", 4059)
            ds_map_add(sm, "spr_darkmenudesc", 4194)
            ds_map_add(sm, "spr_dmenu_captions", 4172)
            ds_map_add(sm, "spr_quitmessage", 4387)
            ds_map_add(sm, "spr_thrashbody_b", 4101)
            ds_map_add(sm, "spr_thrashfoot_b", 4099)
            ds_map_add(sm, "spr_thrashlogo", 4105)
            ds_map_add(sm, "spr_thrashstats", 4115)
            ds_map_add(sm, "spr_fieldmuslogo", 4236)
            var sndm = global.chemg_sound_map
            ds_map_add(sndm, "snd_joker_anything", 474)
            ds_map_add(sndm, "snd_joker_chaos", 475)
            ds_map_add(sndm, "snd_joker_metamorphosis", 476)
            ds_map_add(sndm, "snd_joker_neochaos", 477)
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
            ds_map_add(sm, "spr_bnamekris", 4031)
            ds_map_add(sm, "spr_bnameralsei", 4032)
            ds_map_add(sm, "spr_bnamesusie", 4033)
            ds_map_add(sm, "spr_btact", 4034)
            ds_map_add(sm, "spr_btdefend", 4036)
            ds_map_add(sm, "spr_btfight", 4037)
            ds_map_add(sm, "spr_btitem", 4041)
            ds_map_add(sm, "spr_btspare", 4038)
            ds_map_add(sm, "spr_bttech", 4043)
            ds_map_add(sm, "spr_darkmenudesc", 4183)
            ds_map_add(sm, "spr_dmenu_captions", 4169)
            ds_map_add(sm, "spr_quitmessage", 4289)
            ds_map_add(sm, "spr_thrashbody_b", 4100)
            ds_map_add(sm, "spr_thrashfoot_b", 4098)
            ds_map_add(sm, "spr_thrashlogo", 4104)
            ds_map_add(sm, "spr_thrashstats", 4107)
            ds_map_add(sm, "spr_fieldmuslogo", 4235)
            sndm = global.chemg_sound_map
            ds_map_add(sndm, "snd_joker_anything", 469)
            ds_map_add(sndm, "snd_joker_chaos", 466)
            ds_map_add(sndm, "snd_joker_metamorphosis", 471)
            ds_map_add(sndm, "snd_joker_neochaos", 472)
        }
    }
    return;
}

