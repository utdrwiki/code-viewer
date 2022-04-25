if (global.plot < 30)
{
    if (!snd_is_playing_ch1(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init_ch1("creepydoor.ogg")
        global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 1, 1)
    }
}
else if (!snd_is_playing_ch1(global.currentsong[1]))
{
    global.currentsong[0] = snd_init_ch1("castletown_empty.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 1, 1)
}
