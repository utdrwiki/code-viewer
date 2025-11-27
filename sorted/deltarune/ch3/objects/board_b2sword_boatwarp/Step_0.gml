scr_gameshow_populatevars();
scr_board_populatevars();
if (con == 0)
{
    if (place_meeting(x, y, obj_board_boat))
    {
        snd_play(snd_link_secret_bad);
        global.interact = 1;
        timer = 0;
        con = 1;
        scr_quickwarp(3968, 2112, 4192, 2240);
    }
}
if (con == 1)
{
    with (obj_board_transition)
    {
        if (con == 3)
        {
            with (obj_board_boat)
            {
                if (engaged)
                    instance_destroy();
            }
            with (obj_mainchara_board)
            {
                setxy_board(4192, 2240);
                facing = 0;
            }
            other.con++;
        }
    }
}
