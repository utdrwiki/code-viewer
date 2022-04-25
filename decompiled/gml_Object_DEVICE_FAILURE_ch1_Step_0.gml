if (EVENT == 1)
{
    snd_free_all_ch1()
    global.currentsong[0] = snd_init_ch1("AUDIO_DRONE.ogg")
    global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
    global.typer = 667
    global.fc = 0
    global.msg[0] = scr_84_get_lang_string_ch1("DEVICE_FAILURE_slash_Step_0_gml_10_0")
    EVENT = 2
    W = instance_create_ch1(70, 80, obj_writer_ch1)
    if (global.tempflag[3] >= 1)
    {
        with (obj_writer_ch1)
            instance_destroy()
    }
}
if (EVENT == 0)
    EVENT = 1
if (EVENT == 2 && (!instance_exists(obj_writer_ch1)))
{
    JA_XOFF = 0
    if (global.lang == "ja")
        JA_XOFF = 44
    global.msg[0] = scr_84_get_lang_string_ch1("DEVICE_FAILURE_slash_Step_0_gml_28_0")
    if (global.tempflag[3] >= 1)
    {
        JA_XOFF = 0
        global.msg[0] = scr_84_get_lang_string_ch1("DEVICE_FAILURE_slash_Step_0_gml_32_0")
    }
    EVENT = 3
    alarm[4] = 30
    if (global.tempflag[3] >= 1)
        alarm[4] = 15
    W = instance_create_ch1((40 + JA_XOFF), 80, obj_writer_ch1)
}
if (EVENT == 4)
{
    choice = instance_create_ch1(100, 120, DEVICE_CHOICE_ch1)
    EVENT = 5
}
if (EVENT == 5)
{
    if (global.choice == 0)
    {
        with (obj_writer_ch1)
            instance_destroy()
        EVENT = 6
    }
    if (global.choice == 1)
    {
        with (obj_writer_ch1)
            instance_destroy()
        EVENT = 26
    }
}
if (EVENT == 6)
{
    snd_free_all_ch1()
    global.flag[6] = 1
    global.msg[0] = scr_84_get_lang_string_ch1("DEVICE_FAILURE_slash_Step_0_gml_68_0")
    W = instance_create_ch1(50, 80, obj_writer_ch1)
    EVENT = 7
    alarm[4] = 30
    if (global.tempflag[3] >= 1)
    {
        with (obj_writer_ch1)
            instance_destroy()
        alarm[4] = 1
    }
}
if (EVENT == 8)
{
    WHITEFADE = 1
    FADEUP = 0.01
    EVENT = 9
    alarm[4] = 120
    if (global.tempflag[3] >= 1)
    {
        FADEUP = 0.03
        alarm[4] = 45
    }
    global.tempflag[3] += 1
}
if (EVENT == 10)
{
    scr_windowcaption_ch1(scr_84_get_lang_string_ch1("DEVICE_FAILURE_slash_Step_0_gml_95_0"))
    scr_tempload_ch1()
    EVENT = 11
}
if (EVENT == 26)
{
    snd_free_all_ch1()
    global.msg[0] = scr_84_get_lang_string_ch1("DEVICE_FAILURE_slash_Step_0_gml_103_0")
    EVENT = 27
    W = instance_create_ch1(60, 80, obj_writer_ch1)
}
if (EVENT == 27 && (!instance_exists(obj_writer_ch1)))
{
    global.currentsong[0] = snd_init_ch1("AUDIO_DARKNESS.ogg")
    global.currentsong[1] = mus_play_ch1(global.currentsong[0])
    EVENT = 28
    DARK_WAIT = 0
}
if (EVENT == 28)
{
    DARK_WAIT += 1
    if (DARK_WAIT >= 2040)
        ossafe_game_end_ch1()
    if (!snd_is_playing_ch1(global.currentsong[1]))
        ossafe_game_end_ch1()
    if (os_type == os_ps4 || os_type == os_switch)
    {
        if (DARK_WAIT >= 90 && (!restart))
        {
            var i = 0
            while (i < array_length_1d(gamepad_controls))
            {
                if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gamepad_controls[i])
                {
                    if (gamepad_controls[i] == global.button0 || gamepad_controls[i] == global.button1 || gamepad_controls[i] == global.button2 || gamepad_controls[i] == gp_shoulderlb)
                    {
                        mus_volume_ch1(global.currentsong[1], 0, 80)
                        restart = true
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                else
                {
                    i++
                    continue
                }
            }
        }
        if restart
        {
            restart_timer++
            if (restart_timer >= 100)
                ossafe_game_end_ch1()
        }
    }
}
if (EVENT >= 0 && EVENT <= 4)
{
    if button2_h_ch1()
    {
        with (obj_writer_ch1)
        {
            if (pos < (length - 3))
                pos += 2
            if (specfade <= 0.9)
                specfade -= 0.1
            if (rate <= 1)
                rate = 1
        }
    }
}
