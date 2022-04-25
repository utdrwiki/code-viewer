if (con == 1)
{
    global.interact = 1
    con = 2
    alarm[4] = 10
}
if (con == 2)
    global.interact = 1
if (con == 3)
{
    global.typer = 12
    global.fc = 3
    global.fe = 4
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_15_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_16_0")
    scr_rudface_ch1(2, 0)
    global.msg[3] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_18_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_19_0")
    scr_noeface_ch1(5, 2)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_21_0")
    scr_rudface_ch1(7, 7)
    global.msg[8] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_23_0")
    con = 4
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 4 && (!d_ex_ch1()))
{
    sprite_index = spr_rudy_laugh_ch1
    snd_play_ch1(snd_rudylaugh_ch1)
    image_speed = 0.25
    con = 5
    alarm[4] = 30
}
if (con == 6)
{
    image_index = 0
    snd_stop_ch1(snd_rudylaugh_ch1)
    sprite_index = spr_rudy_cough_ch1
    snd_play_ch1(snd_rudycough_ch1)
    con = 7
    alarm[4] = 30
}
if (con == 8)
{
    global.typer = 12
    global.fc = 3
    global.fe = 4
    sprite_index = spr_rudy_l_ch1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_53_0")
    scr_rudface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_55_0")
    scr_noeface_ch1(3, 4)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_57_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_58_0")
    scr_rudface_ch1(6, 4)
    global.msg[7] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_60_0")
    global.msg[8] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_61_0")
    scr_noeface_ch1(9, 7)
    global.msg[10] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_63_0")
    scr_rudface_ch1(11, 7)
    global.msg[12] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_65_0")
    scr_noeface_ch1(13, 8)
    global.msg[14] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_67_0")
    global.msg[15] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_68_0")
    global.msg[16] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_69_0")
    scr_rudface_ch1(17, 4)
    global.msg[18] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_71_0")
    global.msg[19] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_72_0")
    scr_noeface_ch1(20, 3)
    global.msg[21] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_74_0")
    scr_rudface_ch1(22, 6)
    global.msg[23] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_76_0")
    scr_noeface_ch1(24, 4)
    global.msg[25] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_78_0")
    scr_rudface_ch1(26, 7)
    global.msg[27] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_80_0")
    scr_noeface_ch1(28, 8)
    global.msg[29] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_82_0")
    scr_rudface_ch1(30, 2)
    global.msg[31] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_84_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 9
}
if (con == 9 && (!d_ex_ch1()))
{
    with (n)
    {
        sprite_index = spr_noelle_d_ch1
        vspeed = 2
        image_speed = 0.25
    }
    con = 10
}
if (con == 10)
{
    if (n.y >= 150)
    {
        sprite_index = spr_rudy_d_ch1
        with (n)
        {
            sprite_index = spr_noelle_r_ch1
            hspeed = 2
            vspeed = 0
            image_speed = 0.25
        }
        con = 11
    }
}
if (con == 11)
{
    if (n.x >= 160)
    {
        with (n)
        {
            sprite_index = spr_noelle_dt_ch1
            hspeed = 0
            vspeed = 0
            image_speed = 0
            image_index = 0
        }
        con = 12
        alarm[4] = 30
    }
}
if (con == 13)
{
    global.typer = 12
    global.fc = 3
    global.fe = 4
    global.msg[0] = scr_84_get_lang_string_ch1("obj_rudy_slash_Step_0_gml_140_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 14
    kcon = 0
}
if (con == 14 && (!d_ex_ch1()))
{
    with (n)
    {
        vspeed = 3
        image_speed = 0.25
        sprite_index = spr_noelle_d_ch1
    }
    con = 15
    kcon = 1
    alarm[4] = 30
}
if (con == 15)
{
    with (obj_mainchara_ch1)
    {
        if (x > 140)
            x -= 1
    }
}
if (con == 16)
{
    instance_create_ch1(x, y, obj_npc_room_ch1)
    global.facing = 0
    global.flag[255] = 1
    global.interact = 0
    instance_destroy()
    con = 17
}
