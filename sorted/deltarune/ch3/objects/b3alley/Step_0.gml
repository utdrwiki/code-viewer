scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
        con = 1;
    if (con == 1)
        timer++;
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (susie.x > 264)
                scr_pathfind_to_point("susie", choose(1, 2, 3), choose(4, 5), 0);
            else
                scr_pathfind_to_point("susie", choose(6, 7), choose(5, 6), 0);
            suwalk = 1;
        }
    }
}
else
{
    if (con > 0)
        con = 999;
    suwalk = 0;
    suwalktimer = 0;
}
