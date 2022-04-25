if (mcon == 2)
    mcon = 3
if (mcon == 1)
{
    global.currentsong[0] = snd_init_ch1("lancer_susie.ogg")
    mcon = 2
}
if (con == 1)
{
    snd_free_all_ch1()
    mm = 0.5
    image_blend = merge_color(c_white, c_black, mm)
    global.interact = 1
    sus = scr_dark_marker_ch1((obj_mainchara_ch1.x - 100), global.cinstance[1].y, spr_susier_dark_ch1)
    ral = scr_dark_marker_ch1((obj_mainchara_ch1.x - 50), global.cinstance[0].y, spr_ralseir_ch1)
    k = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisr_dark_ch1)
    r = ral
    s = sus
    with (obj_caterpillarchara_ch1)
        visible = false
    with (obj_mainchara_ch1)
        visible = false
    with (obj_marker_ch1)
    {
        hspeed = 6
        image_speed = 0.2
    }
    con = 2
    alarm[4] = 30
    mcon = 1
}
if (con == 2)
    global.interact = 1
if (con == 3)
{
    global.facing = 1
    con = 4
    with (obj_marker_ch1)
        scr_halt_ch1()
    obj_mainchara_ch1.x = k.x
    obj_mainchara_ch1.visible = true
    with (k)
        instance_destroy()
    alarm[4] = 30
}
if (con == 5)
{
    global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
    global.fc = 5
    global.fe = 1
    global.typer = 32
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_60_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_61_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_62_0")
    con = 6
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 6 && d_ex_ch1() == 0)
{
    sprite_index = spr_lancer_dt_ch1
    con = 7
    alarm[4] = 25
}
if (con == 8)
{
    sprite_index = spr_lancer_lt_ch1
    con = 9
    alarm[4] = 25
}
if (con == 10)
{
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_84_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_85_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_86_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 11
}
if (con == 11 && d_ex_ch1() == 0)
{
    sprite_index = spr_lancer_lt_laugh_ch1
    image_speed = 0.5
    bucket = scr_dark_marker_ch1((x + 20), y, spr_lancer_bucket_ch1)
    bucket.hspeed = -4
    bucket.depth = (depth + 10)
    snd_free_all_ch1()
    snd_play_ch1(snd_lancerlaugh_ch1)
    snd_play_ch1(snd_locker_ch1)
    lightning = scr_dark_marker_ch1(200, 0, spr_crappylightning_ch1)
    lightning.image_alpha = 3
    con = 12
    ctimer = 0
}
if (con == 12)
{
    if (mm > 0)
        mm -= 0.05
    else
        mm = 0
    image_blend = merge_color(c_white, c_black, mm)
    with (lightning)
        image_alpha -= 0.1
    ctimer += 1
    if (ctimer >= 20)
        bucket.hspeed = 0
    if (ctimer >= 60 && d_ex_ch1() == 0)
    {
        sprite_index = spr_lancer_lt_ch1
        image_speed = 0
        image_index = 0
        con = 13
        alarm[4] = 60
    }
}
if (con == 15)
{
    global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_137_0")
    scr_susface_ch1(1, 7)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_139_0")
    scr_lanface_ch1(3, 2)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_141_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_142_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 16
}
if (con == 14)
{
    con = 15
    global.currentsong[0] = snd_init_ch1("lancer.ogg")
}
if (con == 16 && d_ex_ch1() == 0)
{
    with (sus)
        sprite_index = spr_susiel_dark_ch1
    con = 17
    alarm[4] = 40
}
if (con == 18)
{
    with (sus)
    {
        sprite_index = spr_susier_dark_ch1
        hspeed = 6
        image_speed = 0.25
    }
    con = 19
    alarm[4] = 30
}
if (con == 20)
{
    with (sus)
        scr_halt_ch1()
    global.fc = 1
    global.typer = 30
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_181_0")
    scr_lanface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_183_0")
    scr_susface_ch1(3, 2)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_185_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_186_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_187_0")
    global.msg[7] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_188_0")
    global.msg[8] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_189_0")
    scr_lanface_ch1(9, 2)
    global.msg[10] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_191_0")
    scr_susface_ch1(11, 0)
    global.msg[12] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_193_0")
    scr_lanface_ch1(13, 6)
    global.msg[14] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_195_0")
    global.msg[15] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_196_0")
    scr_susface_ch1(16, 2)
    global.msg[17] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_198_0")
    con = 25
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 25)
{
    if instance_exists(obj_writer_ch1)
    {
        if (obj_writer_ch1.msgno == 4)
        {
            with (sus)
                sprite_index = spr_susied_dark_ch1
        }
        if (obj_writer_ch1.msgno == 5)
        {
            with (sus)
                sprite_index = spr_susier_dark_ch1
        }
        if (obj_writer_ch1.msgno == 6)
        {
            with (sus)
                sprite_index = spr_susied_dark_ch1
        }
        if (obj_writer_ch1.msgno == 8)
        {
            with (sus)
                sprite_index = spr_susier_dark_ch1
        }
    }
}
if (con == 25 && d_ex_ch1() == 0)
{
    with (sus)
        sprite_index = spr_susied_dark_ch1
    con = 26
    alarm[4] = 30
}
if (con == 27)
{
    with (sus)
        sprite_index = spr_susier_dark_ch1
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_226_0")
    scr_lanface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_228_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_229_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_231_0")
    con = 60
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 60 && d_ex_ch1() == 0)
{
    con = 61
    alarm[4] = 30
}
if (con == 62)
{
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_245_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_246_0")
    scr_ralface_ch1(2, 8)
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_248_0")
    scr_susface_ch1(4, 0)
    global.msg[5] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_250_0")
    scr_lanface_ch1(6, 1)
    global.msg[7] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_252_0")
    con = 63
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 63 && d_ex_ch1() == 0)
{
    fd = instance_create_ch1(0, 0, obj_fadeout_ch1)
    con = 64
    alarm[4] = 40
}
if (con == 65)
{
    snd_play_ch1(snd_noise_ch1)
    obj_mainchara_ch1.x = (bucket.x - 50)
    r.x = (bucket.x - 100)
    s.x = (bucket.x - 150)
    con = 66
    alarm[4] = 20
}
if (con == 66)
{
    with (fd)
        instance_destroy()
    fi = instance_create_ch1(0, 0, obj_fadein_ch1)
    con = 67
    alarm[4] = 30
}
if (con == 68)
{
    global.fe = 0
    global.msc = 175
    scr_text_ch1(global.msc)
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 28
}
if (con == 28 && d_ex_ch1() == 0)
{
    mus_volume_ch1(global.currentsong[1], 0, 30)
    hspeed = 16
    image_speed = 0.5
    with (bucket)
        hspeed = 16
    snd_play_ch1(snd_lancerlaugh_ch1)
    sprite_index = spr_lancer_lt_laugh_ch1
    con = 36
    alarm[4] = 60
}
if (con == 30)
{
    snd_free_ch1(global.currentsong[1])
    global.fe = 0
    global.fc = 1
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_311_0")
    con = 31
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 31 && (!d_ex_ch1()))
{
    with (sus)
    {
        sprite_index = spr_susiel_dark_ch1
        hspeed = -6
        image_speed = 0.25
    }
    con = 32
    alarm[4] = 30
}
if (con == 33)
{
    with (sus)
    {
        sprite_index = spr_susier_dark_ch1
        scr_halt_ch1()
    }
    con = 34
    alarm[4] = 30
}
if (con == 35)
{
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerscare2_slash_Step_0_gml_343_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 37
}
if (con == 37 && (!d_ex_ch1()))
{
    with (obj_savepoint_ch1)
        visible = true
    s = sus
    r = ral
    snd_free_all_ch1()
    scr_unmarkify_caterpillar_ch1()
    scr_caterpillar_facing_ch1(1)
    global.facing = 1
    con = 38
    global.interact = 0
    instance_destroy()
    if (global.plot <= 55)
        global.plot = 55
    scr_tempsave_ch1()
}
