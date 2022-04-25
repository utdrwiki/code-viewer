if (con == 1)
{
    if (obj_mainchara_ch1.x >= 140 && global.interact == 0)
    {
        r = global.cinstance[0]
        with (r)
        {
            sprite_index = rsprite
            fun = true
        }
        global.facing = 1
        global.interact = 1
        global.typer = 30
        global.fc = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_16_0")
        scr_lanface_ch1(1, 3)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_18_0")
        scr_susface_ch1(3, 2)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_20_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 2
    }
}
if (con == 2 && (!d_ex_ch1()))
{
    exc = instance_create_ch1((s.x + 30), (s.y - 20), obj_excblcon_ch1)
    con = 3
    with (s)
        sprite_index = spr_susiel_dark_ch1
    sprite_index = spr_lancer_lt_ch1
    alarm[4] = 30
}
if (con == 4)
{
    global.typer = 31
    global.fc = 2
    global.fe = 8
    global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_41_0")
    scr_susface_ch1(1, 7)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_43_0")
    scr_lanface_ch1(3, 6)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_45_0")
    scr_susface_ch1(5, 0)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_47_0")
    scr_ralface_ch1(7, 6)
    global.msg[8] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_49_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 5
}
if (con == 5 && (!d_ex_ch1()))
{
    with (r)
        sprite_index = spr_ralseiu_ch1
    with (s)
        sprite_index = spr_susieu_dark_ch1
    sprite_index = spr_lancer_ut_ch1
    con = 6
    alarm[4] = 30
}
if (con == 7)
{
    with (r)
        sprite_index = spr_ralseir_ch1
    with (s)
        sprite_index = spr_susiel_dark_ch1
    sprite_index = spr_lancer_lt_ch1
    global.typer = 31
    global.fc = 2
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_71_0")
    scr_susface_ch1(1, 0)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_73_0")
    scr_ralface_ch1(3, 6)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_75_0")
    scr_susface_ch1(5, 0)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_77_0")
    global.msg[7] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_78_0")
    scr_lanface_ch1(8, 3)
    global.msg[9] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_80_0")
    scr_susface_ch1(10, 2)
    global.msg[11] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_82_0")
    global.msg[12] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_83_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 8
}
if (con == 8 && (!d_ex_ch1()))
{
    global.facing = 0
    with (r)
        fun = false
    visible = false
    with (s)
        visible = false
    lnpc = instance_create_ch1(x, y, obj_npc_facing_ch1)
    with (lnpc)
    {
        dtsprite = spr_lancer_dt_ch1
        rtsprite = spr_lancer_rt_ch1
        ltsprite = spr_lancer_lt_ch1
        utsprite = spr_lancer_ut_ch1
        sprite_index = dtsprite
        y += 100
    }
    snpc = instance_create_ch1(s.x, s.y, obj_npc_facing_ch1)
    with (snpc)
    {
        dtsprite = spr_susiedt_dark_ch1
        rtsprite = spr_susiert_dark_ch1
        ltsprite = spr_susielt_dark_ch1
        utsprite = spr_susieut_dark_ch1
        sprite_index = dtsprite
        y += 100
    }
    global.interact = 0
    con = 9
}
if (con == 9 && obj_mainchara_ch1.x < 40 && global.interact == 0)
{
    global.facing = 1
    with (obj_mainchara_ch1)
        x = 32
    global.interact = 1
    global.typer = 30
    global.fc = 1
    global.fe = 0
    if (talked == false)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_133_0")
    else
        global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_137_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 10
}
if (con == 10 && (!d_ex_ch1()))
{
    talked += 1
    with (obj_mainchara_ch1)
        x = 32
    global.interact = 0
    con = 9
}
if (con == 15 && global.interact == 0)
{
    if (obj_suitspuzz_ch1.won == 1)
    {
        global.facing = 1
        with (global.cinstance[0])
        {
            fun = true
            sprite_index = rsprite
        }
        snd_play_ch1(snd_screenshake_ch1)
        instance_create_ch1(0, 0, obj_shake_ch1)
        global.interact = 1
        with (block)
            instance_destroy()
        with (spike[0])
            image_index = 1
        with (spike[1])
            image_index = 1
        with (spike[2])
            image_index = 1
        con = 11
        alarm[4] = 60
        s.visible = true
        visible = true
        sprite_index = spr_lancer_rt_ch1
        with (s)
            sprite_index = spr_susier_dark_ch1
        with (snpc)
            instance_destroy()
        with (lnpc)
            instance_destroy()
    }
}
if (con == 12)
{
    with (s)
        sprite_index = spr_susiel_dark_ch1
    sprite_index = spr_lancer_lt_ch1
    global.typer = 30
    global.fc = 1
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_189_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 13
}
if (con == 13 && (!d_ex_ch1()))
{
    global.fe = 2
    with (s)
    {
        sprite_index = spr_susier_dark_ch1
        image_speed = 0.5
        hspeed = 14
    }
    sprite_index = spr_lancer_rt_ch1
    hspeed = 14
    global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_200_0")
    scr_lanface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_202_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 14
}
if (con == 14 && (!d_ex_ch1()))
{
    con = 15
    alarm[4] = 30
}
if (con == 16)
{
    with (s)
    {
        x = (__view_get((0 << 0), 0) + __view_get((2 << 0), 0))
        sprite_index = spr_susiel_dark_ch1
        hspeed = -12
    }
    hspeed = -12
    sprite_index = spr_lancer_lt_ch1
    x = ((__view_get((0 << 0), 0) + __view_get((2 << 0), 0)) + 50)
    con = 17
}
if (con == 17)
{
    if (s.x <= 380)
    {
        with (s)
            scr_halt_ch1()
        scr_halt_ch1()
        con = 18
        alarm[4] = 15
    }
}
if (con == 19)
{
    with (s)
        sprite_index = spr_susieu_dark_ch1
    sprite_index = spr_lancer_ut_ch1
    global.fc = 1
    global.fe = 0
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_suitspuzzle_event_slash_Step_0_gml_247_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 20
}
if (con == 20 && (!d_ex_ch1()))
{
    with (s)
    {
        sprite_index = spr_susier_dark_ch1
        image_speed = 0.5
        hspeed = 12
    }
    sprite_index = spr_lancer_rt_ch1
    hspeed = 12
    with (easel)
        hspeed = 12
    con = 21
    alarm[4] = 30
}
if (con == 22)
{
    with (global.cinstance[0])
        fun = false
    global.facing = 0
    global.interact = 0
    global.plot = 72
    con = 23
}
