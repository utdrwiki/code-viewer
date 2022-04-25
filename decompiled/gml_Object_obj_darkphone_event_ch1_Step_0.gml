if (con == 0)
{
    con = 1
    alarm[4] = 40
}
if (con == 1)
    global.interact = 1
if (con == 2)
{
    sndplay = false
    if snd_is_playing_ch1(global.currentsong[1])
    {
        sndplay = true
        snd_pause_ch1(global.currentsong[1])
    }
    snd_play_ch1(snd_smile_ch1)
    con = 3
    alarm[4] = 200
}
if (con == 4)
{
    with (obj_dialoguer_ch1)
        instance_destroy()
    with (obj_writer_ch1)
        instance_destroy()
    con = 7
}
if (con == 7)
{
    snd_stop_ch1(snd_smile_ch1)
    if (sndplay == true)
        snd_resume_ch1(global.currentsong[1])
    global.msg[0] = scr_84_get_lang_string_ch1("obj_darkphone_event_slash_Step_0_gml_42_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 5
    global.interact = 6
    instance_destroy()
}
