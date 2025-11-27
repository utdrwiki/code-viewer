if (global.flag[flag] == 0)
{
    snd_play(snd_locker);
    scr_shakescreen();
    global.flag[flag] = 1;
}
