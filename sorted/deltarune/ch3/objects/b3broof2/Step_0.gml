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
            scr_pathfind_to_point("kris", 11, 5, 1);
        if (timer == 45)
            tenna.bounce = 1;
        if (timer == 55)
        {
            scr_pathfind_to_point("ralsei", 11, 5, 1);
            con++;
            timer = 0;
        }
    }
    if (con == 2)
    {
        if (scr_board_checklocation("kris", board_tilex(11), board_tiley(5), 2))
        {
            timer++;
            if (timer == 2)
            {
                with (obj_mainchara_board)
                    controlled = 0;
                kris.controlled = 1;
                global.interact = 1;
                obj_board_camera.shift = "right";
            }
        }
    }
}
else
{
}
