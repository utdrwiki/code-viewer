scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
        con = 1;
    if (con == 1)
    {
        timer++;
        if (timer == 15)
            tenna.bounce = true;
        if (timer == 95)
        {
            tenna.bounce = true;
            con = 2;
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
            scr_pathfind_to_point("susie", 10, 5, 2);
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
    if (con > 1)
        con = 999;
}
