scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat == true)
        suwalk = 1;
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer >= 15)
        {
            if (!i_ex(obj_chaseenemy_board))
            {
                scr_pathfind_to_point("susie", choose(6, 7, 8), choose(3, 4, 5, 6), 0);
                susie.sleepy = true;
                suwalk = 1;
            }
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
