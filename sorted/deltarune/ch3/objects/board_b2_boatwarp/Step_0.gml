scr_gameshow_populatevars();
scr_board_populatevars();
if (active)
{
    if (con == 0)
    {
        if (place_meeting(x, y, obj_board_boat))
        {
            global.interact = 1;
            timer = 0;
            con = 1;
            scr_quickwarp(1664, 3136, 1856, 3296);
        }
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
                    setxy(board_tilex(6), board_tiley(5));
            }
            other.con++;
        }
    }
}
