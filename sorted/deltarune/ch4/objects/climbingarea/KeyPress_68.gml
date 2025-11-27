if (scr_debug())
{
    snd_play(snd_magicsprinkle);
    if (global.flag[23] == 0)
        global.flag[23] = 1;
    else
        global.flag[23] = 0;
    room_restart();
}
