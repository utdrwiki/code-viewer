scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (obj_b2s_tennaentrance.sndpause == 1)
    {
        with (obj_b2s_tennaentrance)
        {
            sndpause = 0;
            snd_stop(dungosound);
            snd_resume(global.currentsong[1]);
        }
    }
}
