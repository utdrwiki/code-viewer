scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
        {
            suwalk = 1;
            if (susie.x < 320)
                scr_pathfind_to_point("susie", choose(6, 7, 8), choose(3, 4), 0);
            else
                scr_pathfind_to_point("susie", choose(2, 3), choose(1, 2, 3, 4), 0);
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
