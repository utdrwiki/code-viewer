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
            ds_map_add(sm, "spr_bnamekris", 4047)
            ds_map_add(sm, "spr_bnameralsei", 4048)
            ds_map_add(sm, "spr_bnamesusie", 4049)
            ds_map_add(sm, "spr_btact", 4050)
            ds_map_add(sm, "spr_btdefend", 4051)
            ds_map_add(sm, "spr_btfight", 4052)
            ds_map_add(sm, "spr_btitem", 4053)
            ds_map_add(sm, "spr_btspare", 4055)
            ds_map_add(sm, "spr_bttech", 4054)
            ds_map_add(sm, "spr_darkmenudesc", 4189)
            ds_map_add(sm, "spr_dmenu_captions", 4167)
            ds_map_add(sm, "spr_quitmessage", 4382)
            ds_map_add(sm, "spr_thrashbody_b", 4096)
            ds_map_add(sm, "spr_thrashfoot_b", 4094)
            ds_map_add(sm, "spr_thrashlogo", 4100)
            ds_map_add(sm, "spr_thrashstats", 4110)
            ds_map_add(sm, "spr_fieldmuslogo", 4231)
            var sndm = global.chemg_sound_map
            ds_map_add(sndm, "snd_joker_anything", 473)
            ds_map_add(sndm, "snd_joker_chaos", 474)
            ds_map_add(sndm, "snd_joker_metamorphosis", 475)
            ds_map_add(sndm, "snd_joker_neochaos", 476)
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
            ds_map_add(sm, "spr_bnamekris", 4026)
            ds_map_add(sm, "spr_bnameralsei", 4027)
            ds_map_add(sm, "spr_bnamesusie", 4028)
            ds_map_add(sm, "spr_btact", 4029)
            ds_map_add(sm, "spr_btdefend", 4031)
            ds_map_add(sm, "spr_btfight", 4032)
            ds_map_add(sm, "spr_btitem", 4036)
            ds_map_add(sm, "spr_btspare", 4033)
            ds_map_add(sm, "spr_bttech", 4038)
            ds_map_add(sm, "spr_darkmenudesc", 4178)
            ds_map_add(sm, "spr_dmenu_captions", 4164)
            ds_map_add(sm, "spr_quitmessage", 4284)
            ds_map_add(sm, "spr_thrashbody_b", 4095)
            ds_map_add(sm, "spr_thrashfoot_b", 4093)
            ds_map_add(sm, "spr_thrashlogo", 4099)
            ds_map_add(sm, "spr_thrashstats", 4102)
            ds_map_add(sm, "spr_fieldmuslogo", 4230)
            sndm = global.chemg_sound_map
            ds_map_add(sndm, "snd_joker_anything", 468)
            ds_map_add(sndm, "snd_joker_chaos", 465)
            ds_map_add(sndm, "snd_joker_metamorphosis", 470)
            ds_map_add(sndm, "snd_joker_neochaos", 471)
        }
    }
    return;
}

