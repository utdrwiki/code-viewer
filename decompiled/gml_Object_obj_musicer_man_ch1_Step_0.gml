timer += 1
if (timer == 1)
{
    with (obj_caterpillarchara_ch1)
        instance_destroy()
    global.flag[32] = 1
}
if (timer == 2)
    snd_free_all_ch1()
if (timer == 3)
{
    if (!snd_is_playing_ch1(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init_ch1("man.ogg")
        global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 1, 1)
    }
}
if (timer == 4)
    instance_destroy()
