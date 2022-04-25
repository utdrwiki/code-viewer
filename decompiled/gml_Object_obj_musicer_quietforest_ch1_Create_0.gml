if (!snd_is_playing_ch1(global.currentsong[1]))
{
    global.currentsong[0] = snd_init_ch1("quiet_autumn.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.7, 1)
}
