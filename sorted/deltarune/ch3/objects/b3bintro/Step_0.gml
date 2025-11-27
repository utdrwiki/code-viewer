scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0.5 && obj_board_camera.con == 0)
    {
        if (scr_debug())
        {
        }
        kris.controlled = 0;
        susie.controlled = 1;
        ralsei.follow = 0;
        ralsei.x = kris.x - 32;
        con = 1;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
        }
        if (timer == 15)
            scr_pathfind_to_point("kris", 0, 4, 3, 0);
        if (timer == 40)
            scr_pathfind_to_point("ralsei", 0, 4, 3, 0);
        if (timer == 80)
        {
            timer = 0;
            con = 2;
            tenna.bounce = 1;
        }
    }
    if (con == 2)
    {
        if (scr_board_checklocation("kris", board_tilex(0), board_tiley(4), 2))
        {
            timer++;
            if (timer == 2)
            {
                with (obj_mainchara_board)
                    controlled = 0;
                kris.controlled = 1;
                global.interact = 1;
                obj_board_camera.shift = "left";
            }
        }
    }
}
else
{
}
