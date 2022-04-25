if (!snd_is_playing_ch1(global.currentsong[1]))
{
    global.currentsong[0] = snd_init_ch1("mus_birdnoise.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 1, 1)
}
dk = snd_loop_ch1(snd_smile_ch1)
snd_volume_ch1(dk, 0, 0)
snd_pitch_ch1(dk, 0.15)
scr_depth_ch1()
