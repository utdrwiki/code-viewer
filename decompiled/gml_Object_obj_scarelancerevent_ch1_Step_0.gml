if (con == 1)
{
    if (obj_mainchara_ch1.x >= tx && global.interact == 0)
    {
        global.interact = 1
        global.facing = 1
        with (obj_caterpillarchara_ch1)
            visible = false
        s = scr_dark_marker_ch1(global.cinstance[1].x, global.cinstance[1].y, spr_susier_dark_ch1)
        r = scr_dark_marker_ch1(global.cinstance[0].x, global.cinstance[0].y, spr_ralseir_ch1)
        k = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisr_dark_ch1)
        with (obj_mainchara_ch1)
            visible = false
        with (s)
        {
            scr_depth_ch1()
            scr_move_to_point_over_time_ch1((obj_mainchara_ch1.x - 120), ((obj_mainchara_ch1.y + obj_mainchara_ch1.sprite_height) - sprite_height), 15)
        }
        with (r)
        {
            scr_depth_ch1()
            scr_move_to_point_over_time_ch1((obj_mainchara_ch1.x - 60), ((obj_mainchara_ch1.y + obj_mainchara_ch1.sprite_height) - sprite_height), 15)
        }
        with (k)
            scr_depth_ch1()
        con = 2
        alarm[4] = 30
        instance_create_ch1((x + 20), (y - 10), obj_excblcon_ch1)
        sprite_index = spr_lancer_lt_ch1
        snd_free_all_ch1()
    }
}
if (con == 3)
{
    con = 4
    global.currentsong[0] = snd_init_ch1("lancer.ogg")
    alarm[4] = 15
}
if (con == 5)
{
    global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
    global.fe = 3
    global.fc = 5
    global.typer = 32
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_49_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_50_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_51_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_52_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_53_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_54_0")
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.side = 0
    con = 6
}
if (con == 6 && d_ex_ch1() == 0)
{
    snd_free_all_ch1()
    global.fc = 1
    global.fe = 0
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_66_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_67_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_68_0")
    scr_lanface_ch1(3, 6)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_70_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_71_0")
    scr_susface_ch1(6, 1)
    global.msg[7] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_73_0")
    scr_lanface_ch1(8, 7)
    global.msg[9] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_75_0")
    scr_susface_ch1(10, 2)
    global.msg[11] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_77_0")
    con = 7
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.side = 0
}
if (con == 7 && d_ex_ch1() == 0)
{
    oy = obj_mainchara_ch1.y
    obj_mainchara_ch1.cutscene = true
    scr_pan_ch1(2, 0, 60)
    global.currentsong[0] = snd_init_ch1("s_neo.ogg")
    with (s)
    {
        depth = 100
        image_speed = 0.2
        hspeed = 2
    }
    con = 8
}
if (con == 8)
{
    if (abs((s.x - (r.x - 20))) < 6)
    {
        with (r)
        {
            sprite_index = spr_ralseid_ch1
            y -= 1
        }
    }
    if (abs((s.x - (obj_mainchara_ch1.x - 20))) < 6)
    {
        with (k)
        {
            sprite_index = spr_krisd_dark_ch1
            y -= 1
        }
    }
    if (s.x > (obj_mainchara_ch1.x + 60))
    {
        with (s)
            scr_halt_ch1()
        con = 9
        global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
    }
}
if (con == 9)
{
    global.facing = 1
    with (r)
        sprite_index = spr_ralseir_ch1
    with (k)
        sprite_index = spr_krisr_dark_ch1
    global.fe = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_134_0")
    scr_lanface_ch1(1, 4)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_136_0")
    scr_susface_ch1(3, 0)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_138_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_139_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_140_0")
    con = 10
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.side = 0
}
if (con == 10 && d_ex_ch1() == 0)
{
    with (s)
    {
        hspeed = 1
        image_speed = 0.1
    }
    con = 11
    alarm[4] = 20
}
if (con == 12)
{
    with (s)
        scr_halt_ch1()
    global.fe = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_163_0")
    scr_lanface_ch1(1, 5)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_165_0")
    scr_susface_ch1(3, 1)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_167_0")
    con = 13
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.side = 0
}
if (con == 13 && d_ex_ch1() == 0)
{
    with (s)
    {
        hspeed = 2
        vspeed = ((((obj_scarelancerevent_ch1.y - y) + obj_scarelancerevent_ch1.sprite_height) - sprite_height) / 30)
        image_speed = 0.2
    }
    hspeed = 1
    con = 15
    alarm[4] = 30
}
if (con == 16)
{
    with (s)
        scr_halt_ch1()
    visible = false
    with (s)
        sprite_index = spr_susie_grablancer_ch1
    hspeed = 0
    con = 16.1
    alarm[4] = 30
}
if (con == 17.1)
{
    s.image_index += 0.25
    if (s.image_index == 1)
        snd_play_ch1(snd_noise_ch1)
    if (s.image_index >= 3)
    {
        con = 17
        alarm[4] = 30
    }
}
if (con == 18)
{
    visible = false
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_215_0")
    con = 19
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.side = 0
}
if (con == 19 && d_ex_ch1() == 0)
{
    s.image_index += 0.25
    if (s.image_index >= 7)
        con = 20
    alarm[4] = 30
}
if (con == 21)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_234_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_235_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 22
}
if (con == 22 && d_ex_ch1() == 0)
{
    with (s)
    {
        sprite_index = spr_susie_laughlancer_ch1
        image_speed = 0.25
        image_index = 0
    }
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_249_0")
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.skippable = false
    d.skip = false
    con = 23
}
if (con == 23 && d_ex_ch1() == 0)
{
    con = 26
    alarm[4] = 30
}
if (con == 27 && d_ex_ch1() == 0)
{
    snd_free_all_ch1()
    with (s)
        sprite_index = spr_susie_finelancer_ch1
    global.fe = 3
    global.fc = 5
    global.typer = 32
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_270_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_271_0")
    scr_susface_ch1(2, "A")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_273_0")
    scr_lanface_ch1(4, 3)
    global.msg[5] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_275_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_276_0")
    scr_susface_ch1(7, 7)
    global.msg[8] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_278_0")
    scr_lanface_ch1(9, 2)
    global.msg[10] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_280_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 28
    global.encounterno = 8
    scr_encountersetup_ch1(global.encounterno)
}
if (con == 28 && d_ex_ch1() == 0)
{
    instance_create_ch1((s.x + 20), (s.y - 10), obj_excblcon_ch1)
    with (s)
    {
        sprite_index = spr_susier_dark_ch1
        image_index = 0
        image_speed = 0
    }
    visible = true
    y -= 14
    snd_play_ch1(snd_noise_ch1)
    hspeed = 8
    vspeed = 2
    con = 29
    alarm[4] = 5
}
if (con == 30)
{
    hspeed = 0
    vspeed = 0
    con = 30.1
    alarm[4] = 10
}
if (con == 31.1)
{
    for (i = 0; i < 3; i += 1)
    {
        cc[i] = scr_dark_marker_ch1((__view_get((0 << 0), 0) + 700), (y - 20), spr_jigsawry_idle_ch1)
        with (cc[i])
        {
            scr_move_to_point_over_time_ch1((global.monstermakex[0] + 60), y, 30)
            depth = 50000
        }
    }
    con = 31
    alarm[4] = 30
}
if (con == 32)
{
    for (i = 0; i < 3; i += 1)
    {
        with (cc[i])
            hspeed = 0
    }
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_328_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_329_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 33
}
if (con == 33 && d_ex_ch1() == 0)
{
    hspeed = 16
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_340_0")
    con = 34
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 34 && d_ex_ch1() == 0)
{
    scr_pan_to_obj_ch1(obj_mainchara_ch1, 20)
    con = 35
    for (i = 0; i < 3; i += 1)
    {
        with (cc[i])
            hspeed = -4
    }
    with (k)
        scr_move_to_point_over_time_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, 20)
    with (s)
        scr_move_to_point_over_time_ch1(global.cinstance[1].x, global.cinstance[1].y, 20)
    with (r)
        scr_move_to_point_over_time_ch1(global.cinstance[0].x, global.cinstance[0].y, 20)
    alarm[4] = 30
}
if (con == 36)
{
    for (i = 0; i < 3; i += 1)
    {
        with (cc[i])
        {
            depth = 0
            hspeed = 0
        }
    }
    with (obj_caterpillarchara_ch1)
        visible = true
    with (obj_mainchara_ch1)
        visible = true
    with (s)
        instance_destroy()
    with (r)
        instance_destroy()
    with (k)
        instance_destroy()
    global.fe = 0
    global.fc = 1
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_scarelancerevent_slash_Step_0_gml_374_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 37
}
if (con == 37 && d_ex_ch1() == 0)
{
    global.currentsong[0] = snd_init_ch1("field_of_hopes.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.7, 1)
    snd_pause_ch1(global.currentsong[1])
    instance_create_ch1(0, 0, obj_battleback_ch1)
    global.encounterno = 22
    scr_encountersetup_ch1(global.encounterno)
    global.specialbattle = 0
    global.flag[9] = 1
    global.batmusic[0] = snd_init_ch1("battle.ogg")
    instance_create_ch1(0, 0, obj_encounterbasic_ch1)
    for (i = 0; i < 3; i += 1)
    {
        if instance_exists(cc[i])
        {
            cc[i].i = i
            with (cc[i])
                scr_move_to_point_over_time_ch1(global.monstermakex[i], global.monstermakey[i], 25)
        }
    }
    con = 38
    if (global.plot < 45)
        global.plot = 45
    alarm[4] = 25
}
if (con == 39)
{
    with (cc[0])
        visible = false
    with (cc[1])
        visible = false
    with (cc[2])
        visible = false
    con = 40
    alarm[4] = 15
}
