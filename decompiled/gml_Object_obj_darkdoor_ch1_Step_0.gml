if (con > 0 && con < 40)
{
    if (con == 1)
        global.interact = 1
    if (con == 2)
    {
        with (k)
            scr_halt_ch1()
        with (s)
            scr_halt_ch1()
        con = 3
        alarm[4] = 30
    }
    if (con == 4)
    {
        global.typer = 10
        global.fc = 1
        global.fe = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_21_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_22_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 4.5
    }
    if (con == 4.5 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        snd_play_ch1(snd_locker_ch1)
        image_index = 1
        con = 5.5
        alarm[4] = 60
    }
    if (con == 6.5)
    {
        global.currentsong[0] = snd_init_ch1("creepydoor.ogg")
        mus_loop_ch1(global.currentsong[0])
        open = 1
        con = 6
        alarm[4] = 60
    }
    if (con == 7)
    {
        with (s)
        {
            vspeed = 0.5
            image_speed = 0.1
        }
        with (k)
        {
            vspeed = 0.5
            image_speed = 0.1
        }
        con = 8
        alarm[4] = 30
    }
    if (con == 9)
    {
        with (s)
            scr_halt_ch1()
        with (k)
            scr_halt_ch1()
        con = 10
        alarm[4] = 30
    }
    if (con == 11)
    {
        global.fe = 5
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_72_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_73_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_74_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (s)
            sprite_index = spr_susiel_ch1
        con = 12
    }
    if (con == 12 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        with (s)
            sprite_index = spr_susieu_ch1
        con = 13
        alarm[4] = 90
    }
    if (con == 14)
    {
        with (s)
            sprite_index = spr_susiel_ch1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_90_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 15
    }
    if (con == 15 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        with (k)
        {
            vspeed = 0.5
            image_speed = 0.1
        }
        con = 14.5
        alarm[4] = 30
    }
    if (con == 15.5)
    {
        with (k)
            scr_halt_ch1()
        con = 16
        alarm[4] = 60
    }
    if (con == 17)
    {
        with (s)
            sprite_index = spr_susiel_ch1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_117_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 18
    }
    if (con == 18 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        with (s)
            sprite_index = spr_susieu_ch1
        con = 19
        alarm[4] = 90
    }
    if (con == 20)
    {
        with (s)
            sprite_index = spr_susiel_ch1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_132_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 21
    }
    if (con == 21 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        with (s)
        {
            sprite_index = spr_susieu_ch1
            vspeed = -0.5
            image_speed = 0.1
        }
        with (k)
        {
            vspeed = -0.5
            image_speed = 0.1
        }
        con = 22
        alarm[4] = 30
    }
    if (con == 23)
    {
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        with (fade)
            fadespeed = 0.03
        con = 24
        alarm[4] = 34
    }
    if (con == 25)
    {
        con = 26
        global.plot = 5
        instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        room_goto(room_insidecloset_ch1)
    }
}
if (con >= 40)
{
    if (con == 40)
    {
        snd_free_all_ch1()
        global.currentsong[0] = snd_init_ch1("mus_birdnoise.ogg")
        global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.6, 0.7)
        global.interact = 1
        s = scr_marker_ch1(479, 92, spr_susiel_plain_ch1)
        with (s)
            scr_depth_ch1()
        with (obj_mainchara_ch1)
        {
            x = obj_markerD_ch1.x
            y = obj_markerD_ch1.y
        }
        con = 41
        alarm[4] = 45
    }
    if (con == 42)
    {
        global.typer = 10
        global.fc = 1
        global.fe = 0
        global.flag[29] = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_194_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_195_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 43
    }
    if (con == 43 && (!d_ex_ch1()))
    {
        k = scr_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisl_ch1)
        with (k)
            scr_depth_ch1()
        with (obj_mainchara_ch1)
            visible = false
        with (s)
            sprite_index = spr_susier_ch1
        con = 44
        alarm[4] = 30
    }
    if (con == 45)
    {
        global.fe = 2
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_215_0")
        con = 50
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 50 && (!d_ex_ch1()))
    {
        with (s)
        {
            hspeed = -2
            image_speed = 0.2
            sprite_index = spr_susiel_ch1
        }
        with (k)
        {
            hspeed = -2
            image_speed = 0.2
        }
        with (obj_mainchara_ch1)
            hspeed = -2
        con = 51
        alarm[4] = 100
    }
    if (con == 52)
    {
        with (s)
            scr_halt_ch1()
        with (k)
            scr_halt_ch1()
        with (obj_mainchara_ch1)
            scr_halt_ch1()
        with (s)
            sprite_index = spr_susieu_ch1
        with (k)
            sprite_index = spr_krisu_ch1
        con = 51.1
        alarm[4] = 60
    }
    if (con == 52.1)
    {
        global.fe = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_252_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 52.2
    }
    if (con == 52.2 && (!d_ex_ch1()))
    {
        con = 53
        alarm[4] = 30
    }
    if (con == 54)
    {
        with (s)
            sprite_index = spr_susier_plain_ch1
        with (k)
            sprite_index = spr_krisl_ch1
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_268_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_269_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_270_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 55
    }
    if (con == 55 && (!d_ex_ch1()))
    {
        with (k)
            sprite_index = spr_krisd_ch1
        with (s)
        {
            sprite_index = spr_susied_plain_ch1
            image_speed = 0.1
            vspeed = 0.5
        }
        con = 56
        alarm[4] = 60
    }
    if (con == 57)
    {
        with (s)
            scr_halt_ch1()
        con = 58
        alarm[4] = 30
    }
    if (con == 59)
    {
        global.fe = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_298_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_299_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_300_0")
        con = 60
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (d)
            side = 0
    }
    if (con == 60 && (!d_ex_ch1()))
    {
        with (s)
            sprite_index = spr_susier_plain_ch1
        con = 61
        alarm[4] = 30
    }
    if (con == 62)
    {
        with (s)
        {
            vspeed = -2
            hspeed = 0.75
            image_speed = 0.25
            sprite_index = spr_susieu_ch1
        }
        with (k)
            sprite_index = spr_krisl_ch1
        con = 63
        alarm[4] = 15
    }
    if (con == 64)
    {
        with (s)
        {
            scr_halt_ch1()
            sprite_index = spr_susier_plain_ch1
        }
        con = 65
        alarm[4] = 20
    }
    if (con == 66)
    {
        with (k)
            visible = false
        with (s)
        {
            sprite_index = spr_susie_krisshoulder_r_ch1
            image_speed = 0.2
        }
        con = 67
        alarm[4] = 20
    }
    if (con == 68)
    {
        with (s)
            image_speed = 0
        con = 69
        alarm[4] = 60
    }
    if (con == 70)
    {
        global.fe = 8
        global.flag[6] = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkdoor_slash_Step_0_gml_363_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (obj_writer_ch1)
            skippable = false
        with (d)
            skippable = false
        with (d)
            side = 0
        con = 70.1
    }
    if (con == 70.1 && (!d_ex_ch1()))
    {
        con = 69.2
        alarm[4] = 30
    }
    if (con == 70.2 && (!d_ex_ch1()))
    {
        with (s)
            image_speed = -0.24
        con = 69.3
        alarm[4] = 16
    }
    if (con == 70.3)
    {
        with (s)
            scr_halt_ch1()
        con = 72
        alarm[4] = 30
    }
    if (con == 73 && (!d_ex_ch1()))
    {
        with (k)
        {
            visible = true
            sprite_index = spr_krisd_ch1
        }
        with (s)
        {
            sprite_index = spr_susied_ch1
            image_speed = 0.2
            vspeed = 3
        }
        con = 74
        alarm[4] = 30
    }
    if (con == 75)
    {
        global.flag[6] = 0
        if (global.plot < 251)
            global.plot = 251
        con = 76
        global.interact = 0
        with (obj_mainchara_ch1)
            visible = true
        with (k)
            instance_destroy()
    }
}
