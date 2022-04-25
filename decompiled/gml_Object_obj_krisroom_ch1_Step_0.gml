if (con > 0 && con < 50)
{
    if (con == 1 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        with (t)
        {
            image_index = 0
            image_speed = 0.25
            vspeed = -2
            sprite_index = spr_toriel_u_ch1
        }
        alarm[4] = 20
        con = 2
    }
    if (con == 3)
    {
        with (t)
        {
            image_index = 0
            image_speed = 0
            vspeed = 0
        }
        alarm[4] = 10
        con = 4
    }
    if (con == 5)
    {
        with (t)
        {
            image_speed = 0.25
            sprite_index = spr_toriel_windowopen_ch1
        }
        alarm[4] = 10
        con = 6
        with (wallwindow)
            image_index = 1
        snd_play_ch1(snd_wing_ch1)
    }
    if (con == 7)
    {
        with (t)
            image_speed = 0
        con = 8
        alarm[4] = 20
    }
    if (con == 9)
    {
        with (t)
        {
            sprite_index = spr_toriel_d_ch1
            image_index = 0
            image_speed = 0.25
            vspeed = 2
        }
        alarm[4] = 20
        con = 10
    }
    if (con == 11)
    {
        with (t)
        {
            image_index = 0
            image_speed = 0
            vspeed = 0
        }
        alarm[4] = 20
        con = 12
    }
    if (con == 13)
    {
        with (t)
            sprite_index = spr_toriel_rt_ch1
        alarm[4] = 20
        con = 14
    }
    if (con == 15)
    {
        global.fe = 0
        with (t)
            image_speed = 0.25
        global.msg[0] = scr_84_get_lang_string_ch1("obj_krisroom_slash_Step_0_gml_92_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 20
    }
    if (con == 20 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        with (t)
        {
            image_index = 0
            sprite_index = spr_toriel_d_ch1
            image_speed = 0.25
            vspeed = 3
        }
        alarm[4] = 90
        con = 21
    }
    if (con == 22)
    {
        snd_play_ch1(snd_wing_ch1)
        image_index = 1
        alarm[4] = 40
        con = 23
    }
    if (con == 24)
    {
        with (obj_mainchara_ch1)
        {
            fun = true
            image_speed = 0.25
            sprite_index = spr_krisl_ch1
            hspeed = -1
        }
        alarm[4] = 40
        if button2_h_ch1()
        {
            with (obj_mainchara_ch1)
            {
                fun = true
                image_speed = 0.25
                sprite_index = spr_krisl_ch1
                hspeed = -4
            }
            alarm[4] = 10
        }
        con = 25
    }
    if (con == 26)
    {
        global.facing = 3
        with (obj_mainchara_ch1)
        {
            image_index = 0
            hspeed = 0
            image_speed = 0
            fun = false
        }
        con = 27
        alarm[4] = 20
        if button2_h_ch1()
            alarm[4] = 5
    }
    if (con == 28)
    {
        global.flag[10] = 1
        global.facing = 0
        with (obj_mainchara_ch1)
        {
            image_index = 0
            hspeed = 0
            sprite_index = spr_krisd_ch1
            image_speed = 0
            fun = false
        }
        scr_depth_ch1()
        con = 30
        global.interact = 0
        scr_tempsave_ch1()
        if (global.plot < 1)
            global.plot = 1
    }
}
if (con >= 50 && con < 100)
{
    global.interact = 1
    global.facing = 1
    if (con == 50 && (!d_ex_ch1()))
    {
        _remfilechoice = global.filechoice
        global.filechoice += 3
        scr_save_ch1()
        global.filechoice = _remfilechoice
        mus_volume_ch1(global.currentsong[1], 0, 100)
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        with (fade)
            fadespeed = 0.01
        con = 51
        alarm[4] = 100
    }
    if (con == 52)
    {
        snd_free_all_ch1()
        con = 53
        alarm[4] = 150
    }
    if (con == 54)
    {
        scr_windowcaption_ch1(" ")
        room_goto(room_myroom_dark_ch1)
    }
}
if (con >= 100 && con < 150)
{
    global.interact = 1
    global.facing = 1
    if (con == 100 && (!d_ex_ch1()))
    {
        mus_volume_ch1(global.currentsong[1], 0, 50)
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        with (fade)
        {
            fadespeed = 0.02
            depth = 10000
        }
        con = 101
        alarm[4] = 50
    }
    if (con == 102)
    {
        snd_free_all_ch1()
        con = 103
        alarm[4] = 50
    }
    if (con == 104)
    {
        scr_windowcaption_ch1(" ")
        global.typer = 5
        global.fc = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_krisroom_slash_Step_0_gml_281_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 105
    }
    if (con == 105 && (!d_ex_ch1()))
    {
        instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        scr_windowcaption_ch1(scr_84_get_lang_string_ch1("obj_krisroom_slash_Step_0_gml_289_0"))
        global.plot = 10
        scr_become_dark_ch1()
        room_goto(room_dark1_ch1)
    }
}
