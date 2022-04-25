if (con == 1)
{
    if (obj_mainchara_ch1.x >= (x - 200) && global.interact == 0)
    {
        snd_free_all_ch1()
        global.facing = 1
        with (obj_caterpillarchara_ch1)
        {
            fun = true
            if (rsprite == spr_ralseir_ch1)
                sprite_index = spr_ralseir_ch1
        }
        with (obj_mainchara_ch1)
            cutscene = true
        global.interact = 1
        sprite_index = spr_lancer_lt_ch1
        with (s)
            sprite_index = spr_susiel_dark_ch1
        exc = instance_create_ch1((x + 30), (y - 20), obj_excblcon_ch1)
        con = 2
        scr_pan_ch1(4, 0, 30)
        alarm[4] = 30
    }
}
if (con == 3)
{
    global.currentsong[0] = snd_init_ch1("lancer.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.7, 1)
    global.typer = 31
    global.fc = 2
    global.fe = 10
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_30_0")
    scr_susface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_32_0")
    scr_lanface_ch1(3, 1)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_34_0")
    scr_susface_ch1(5, 2)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_36_0")
    scr_lanface_ch1(7, 2)
    global.msg[8] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_38_0")
    scr_susface_ch1(9, 4)
    global.msg[10] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_40_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 4
}
if (con == 4 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_dt_ch1
    snd_play_ch1(snd_impact_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    con = 5
    alarm[4] = 5
}
if (con == 6)
{
    global.typer = 32
    global.fc = 5
    global.fe = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_60_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 7
}
if (con == 7 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susied_dark_ch1
    snd_play_ch1(snd_impact_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    con = 8
    alarm[4] = 5
}
if (con == 9 && (!d_ex_ch1()))
{
    global.typer = 30
    global.fc = 1
    global.fe = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_79_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 10
}
if (con == 10 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_rt_ch1
    with (s)
        sprite_index = spr_susiel_dark_ch1
    con = 11
    alarm[4] = 5
}
if (con == 12)
{
    global.typer = 30
    global.fc = 1
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_97_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 13
}
if (con == 13 && (!d_ex_ch1()))
{
    snd_play_ch1(snd_magicsprinkle_ch1)
    whitefade = scr_dark_marker_ch1(-10, -10, spr_pixel_white_ch1)
    with (whitefade)
    {
        image_alpha = 0
        image_xscale = 1000
        image_yscale = 1000
        depth = -100
    }
    wtimer = 0
    con = 14
}
if (con == 14)
{
    wtimer += 1
    if (wtimer <= 25)
    {
        with (whitefade)
            image_alpha += 0.04
    }
    if (wtimer == 26)
    {
        sprite_index = spr_lancer_pose_ch1
        with (s)
            sprite_index = spr_susieb_spellready_ch1
        with (s)
            image_xscale = -2
        with (s)
            image_speed = 0.2
        with (s)
            x += 60
    }
    if (wtimer > 28)
    {
        with (whitefade)
            image_alpha -= 0.04
    }
    if (wtimer >= 60)
    {
        with (whitefade)
            instance_destroy()
        con = 15
    }
}
if (con == 15 && (!d_ex_ch1()))
{
    global.typer = 32
    global.fc = 5
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_158_0")
    if (global.flag[214] == 1)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_161_0")
    if (global.flag[214] == 2)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_165_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 16
}
if (con == 16 && (!d_ex_ch1()))
{
    alarm[4] = 30
    con = 17
}
if (con == 18)
{
    snd_free_all_ch1()
    global.fc = 2
    global.fe = 8
    global.typer = 31
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_185_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 19
}
if (con == 19 && (!d_ex_ch1()))
{
    with (s)
    {
        image_speed = 0
        image_index = 0
        sprite_index = spr_susiel_dark_unhappy_ch1
        image_xscale = 2
        x -= 60
    }
    sprite_index = spr_lancer_lt_unhappy_ch1
    global.typer = 30
    global.fc = 1
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_205_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_206_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_207_0")
    scr_lanface_ch1(3, 6)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_209_0")
    scr_ralface_ch1(5, 1)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_211_0")
    global.msg[7] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_212_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 20
}
if (con == 20 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_lt_ch1
    with (s)
        sprite_index = spr_susiel_dark_ch1
    global.typer = 30
    global.fc = 1
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_224_0")
    scr_lanface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_226_0")
    scr_susface_ch1(3, 2)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_228_0")
    scr_lanface_ch1(5, 2)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_230_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 21
}
if (con == 21 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_ch1
    con = 22
    alarm[4] = 30
}
if (con == 23)
{
    global.typer = 30
    global.fc = 1
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_247_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 24
}
if (con == 24 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_rt_ch1
    con = 25
    alarm[4] = 30
}
if (con == 26)
{
    global.fc = 5
    global.fe = 3
    global.typer = 32
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susiebadguy_event_slash_Step_0_gml_265_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 27
}
if (con == 27 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_dt_ch1
    vspeed = 16
    with (s)
    {
        sprite_index = spr_susied_dark_ch1
        image_speed = 0.5
        vspeed = 16
    }
    con = 27.1
    alarm[4] = 30
}
if (con == 28.1)
{
    scr_pan_ch1(-4, 0, 30)
    con = 28
    alarm[4] = 30
}
if (con == 29)
{
    global.currentsong[0] = snd_init_ch1("forest.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.7, 1)
    global.facing = 0
    with (obj_caterpillarchara_ch1)
        fun = false
    with (obj_mainchara_ch1)
        cutscene = false
    global.interact = 0
    global.plot = 70
    con = 30
}
