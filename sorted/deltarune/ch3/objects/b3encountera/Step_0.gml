scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
        ralsei.follow = 1;
    if (suwalk == 0 && obj_board_camera.con == 0 && !i_ex(obj_chaseenemy_board))
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            suwalk = 1;
            if (susie.x < 360)
                scr_pathfind_to_point("susie", choose(4, 5), choose(5, 6), 0);
            else
                scr_pathfind_to_point("susie", choose(8, 9, 10), 5, 0);
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
