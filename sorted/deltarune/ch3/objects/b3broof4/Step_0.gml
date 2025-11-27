scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (scr_debug())
        {
        }
        kris.controlled = 0;
        susie.controlled = 1;
        ralsei.follow = 0;
        con = 1;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 20)
            scr_pathfind_to_point("kris", 7.5, 5, 2);
        if (timer == 45)
            scr_pathfind_to_point("ralsei", 6.5, 5, 1);
        if (timer == 1)
            tenna.bounce = 1;
        if (timer == 70)
            tenna.bounce = 1;
        if (timer == 150)
        {
            scr_play_recording("kris", "0U0U0U0U0U0U0U");
            safe_delete(obj_couchwriter);
        }
        if (timer == 160)
        {
            snd_play(snd_board_escaped);
            scr_quickwarp(2432, 1856, 2608, 2080);
            con++;
        }
    }
}
else
{
}
