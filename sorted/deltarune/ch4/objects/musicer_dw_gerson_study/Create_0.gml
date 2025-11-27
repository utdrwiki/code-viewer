if (global.plot == 180 && scr_flag_get(847) == 1)
    exit;
if (global.tempflag[90] == 400)
    exit;
if (!snd_is_playing(global.currentsong[1]))
{
    if (global.plot < 242)
    {
        global.currentsong[0] = snd_init("church_dark_study.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    else
    {
        global.currentsong[0] = snd_init("gerson_defeated.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 0.75);
    }
}
