scr_board_populatevars();
if (kris.boat == true)
    depth = 100000;
else
    scr_depth_board();
if (active)
{
    if (!kris.boat)
    {
        if (place_meeting(x, y, kris))
        {
            with (obj_b2loverbridge)
                stoptalk = 1;
            scr_quickwarp(2432, 64, 2592, 192);
            snd_play(snd_board_escaped);
            active = false;
        }
    }
}
