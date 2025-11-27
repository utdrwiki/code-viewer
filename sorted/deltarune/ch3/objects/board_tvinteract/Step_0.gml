buffer--;
if (myinteract == 3)
{
    timer++;
    if (timer == 1)
    {
        global.flag[1150] = 1.5;
        global.interact = 1;
        snd_play(snd_board_shine_get);
    }
    if (timer == 10)
        scr_board_instawarp(2304, 1376, 2368, 1472);
}
