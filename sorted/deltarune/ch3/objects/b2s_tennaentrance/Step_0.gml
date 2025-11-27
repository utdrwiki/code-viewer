scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (sndpause == 0)
        {
            sndpause = 1;
            snd_pause(global.currentsong[1]);
            dungosound = snd_loop(dungoinit);
            snd_pitch(dungosound, 0.05);
            snd_volume(dungosound, 0, 0);
            snd_volume(dungosound, 0.25, 120);
        }
    }
}
