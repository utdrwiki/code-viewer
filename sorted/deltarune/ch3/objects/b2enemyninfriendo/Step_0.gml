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
        if (suwalktimer == 15)
        {
            if (susie.x < 320)
            {
                if (i_ex(obj_chaseenemy_board))
                    scr_pathfind_to_point("susie", 2, 2, 0);
                else
                    scr_pathfind_to_point("susie", 5, 3, 0);
            }
            else if (i_ex(obj_chaseenemy_board))
            {
                scr_pathfind_to_point("susie", 10, 2, 0);
            }
            else
            {
                scr_pathfind_to_point("susie", 5, 3, 0);
            }
            suwalk = 1;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
