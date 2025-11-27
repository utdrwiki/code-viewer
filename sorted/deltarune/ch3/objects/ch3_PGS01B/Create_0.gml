con = -1;
customcon = 0;
noskip = false;
if (global.plot < 20)
{
    con = 0;
    if (global.plot >= 10)
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("wind_highplace.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.5, 1);
        }
    }
}
