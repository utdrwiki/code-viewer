if (con == 1)
{
    if (obj_mainchara_ch1.x >= x && global.interact == 0)
    {
        global.interact = 1
        con = 2
        global.facing = 1
        with (obj_caterpillarchara_ch1)
        {
            sprite_index = rsprite
            fun = true
        }
    }
}
if (con == 2)
{
    darkfade = scr_marker_ch1(-10, -10, spr_pixel_white_ch1)
    darkfade.image_xscale = 700
    darkfade.image_yscale = 400
    darkfade.image_alpha = 0
    darkfade.depth = 800000
    darkfade.image_blend = c_black
    fade = 0
    con = 3
}
if (con == 3)
{
    snd_free_all_ch1()
    with (obj_caterpillarchara_ch1)
        image_index = 0
    scr_pan_ch1(4, 0, 40)
    fade += 0.02
    darkfade.image_alpha = fade
    if (fade >= 0.6)
    {
        con = 4
        alarm[4] = 11
    }
}
if (con == 5)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_45_0")
    global.typer = 42
    instance_create_ch1((__view_get((0 << 0), 0) + 120), 50, obj_writer_ch1)
    con = 6
}
if (con == 6 && (!instance_exists(obj_writer_ch1)))
{
    appear = instance_create_ch1((__view_get((0 << 0), 0) + 420), (__view_get((1 << 0), 0) + 160), obj_rurus_appear_ch1)
    snd_play_ch1(snd_rurus_appear_ch1)
    con = 14
    rurus = scr_dark_marker_ch1(appear.x, appear.y, spr_rurus_idle_ch1)
    rurus.visible = false
    alarm[4] = 60
}
if (con == 15)
{
    with (rurus)
        visible = true
    with (appear)
        instance_destroy()
    con = 16
    alarm[4] = 21
}
if (con == 16)
{
    with (darkfade)
    {
        image_alpha -= 0.05
        if (image_alpha <= 0)
            image_alpha = 0
    }
}
if (con == 17)
{
    global.currentsong[0] = snd_init_ch1("ruruskaado.ogg")
    global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
    global.fc = 18
    global.fe = 0
    global.typer = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_88_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_89_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_90_0")
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.side = 1
    con = 18
}
if (con == 18 && (!d_ex_ch1()))
{
    with (rurus)
        hspeed = 7
    con = 19
    alarm[4] = 15
}
if (con == 20)
{
    with (rurus)
        scr_halt_ch1()
    snd_play_ch1(snd_rurus_appear_ch1)
    checkerappear = instance_create_ch1((__view_get((0 << 0), 0) + 380), (__view_get((1 << 0), 0) + 120), obj_rurus_appear_ch1)
    with (checkerappear)
        type = 1
    checker = scr_dark_marker_ch1(checkerappear.x, checkerappear.y, spr_checkers_idle_ch1)
    with (checker)
        visible = false
    con = 21
    alarm[4] = 60
}
if (con == 22)
{
    with (checker)
        visible = true
    with (checkerappear)
        instance_destroy()
    global.smalarm[0] = 5
    global.smyy[0] = 70
    global.smxx[0] = 170
    global.smdir[0] = 180
    global.smspeed[0] = 10
    global.smtype[0] = 3
    global.smsprite[0] = spr_face_s6_ch1
    global.smcolor[0] = c_white
    global.smstring[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_133_0")
    global.smalarm[1] = 5
    global.smyy[1] = 70
    global.smxx[1] = 170
    global.smdir[1] = 180
    global.smspeed[1] = 10
    global.smtype[1] = 3
    global.smsprite[1] = spr_face_s7_ch1
    global.smcolor[1] = c_white
    global.smstring[1] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_143_0")
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_145_0")
    scr_ralface_ch1(1, 3)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_147_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_148_0")
    global.msg[4] = "%%"
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 23
}
if (con == 23 && (!d_ex_ch1()))
{
    global.typer = 6
    global.fc = 18
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_161_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_162_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 24
}
if (con == 24 && (!d_ex_ch1()))
{
    snd_play_ch1(snd_impact_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    with (checker)
        image_index = 4
    con = 25
    alarm[4] = 30
}
if (con == 26)
{
    global.fc = 2
    global.fe = 3
    global.typer = 31
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_181_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_182_0")
    global.msg[2] = "%%"
    con = 27
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 27 && (!d_ex_ch1()))
{
    global.fc = 18
    global.typer = 6
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_194_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_195_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_196_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 28
}
if (con == 28 && (!d_ex_ch1()))
{
    with (rurus)
        hspeed = 10
    snd_free_all_ch1()
    global.encounterno = 27
    scr_encountersetup_ch1(global.encounterno)
    global.flag[9] = 1
    global.batmusic[0] = snd_init_ch1("checkers.ogg")
    global.specialbattle = 3
    instance_create_ch1(0, 0, obj_encounterbasic_ch1)
    depth = 4000
    with (checker)
        scr_move_to_point_over_time_ch1(global.monstermakex[0], global.monstermakey[0], 20)
    con = 29
    alarm[4] = 20
}
if (con == 30)
{
    with (checker)
        speed = 0
    con = 31
    alarm[4] = 5
}
if (con == 32)
{
    with (checker)
        instance_destroy()
    con = 35
    alarm[4] = 30
    victimer = 0
}
if (con == 36)
{
    if (!instance_exists(obj_battlecontroller_ch1))
    {
        rurus.x = (__view_get((0 << 0), 0) + 660)
        with (rurus)
            hspeed = -12
        con = 37
    }
}
if (con == 37)
{
    if (rurus.x <= (__view_get((0 << 0), 0) + 420))
    {
        with (rurus)
            scr_halt_ch1()
        con = 38
        alarm[4] = 20
    }
}
if (con == 39)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_260_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_261_0")
    global.fc = 18
    global.typer = 6
    global.fe = 6
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 39.1
}
if (con == 39.1 && (!d_ex_ch1()))
{
    global.currentsong[0] = snd_init_ch1("ruruskaado.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.7, 0.9)
    global.fe = 5
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_274_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_275_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_276_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_277_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_278_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_279_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 40
}
if (con == 40 && (!d_ex_ch1()))
{
    snd_free_all_ch1()
    con = 41
    alarm[4] = 30
}
if (con == 42)
{
    global.fc = 2
    global.fe = 6
    global.typer = 31
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_296_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 43
}
if (con == 43 && (!d_ex_ch1()))
{
    global.fc = 18
    global.fe = 3
    global.typer = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rurus_checker_event_slash_Step_0_gml_306_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 44
    with (rurus)
        hspeed = 24
}
if (con == 44 && (!d_ex_ch1()))
{
    with (obj_caterpillarchara_ch1)
        fun = false
    global.facing = 0
    global.plot = 175
    global.interact = 0
    con = 45
    instance_destroy()
}
