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
            if (susie.x < 355)
                scr_pathfind_to_point("susie", 10, 4, 0);
            else
                scr_pathfind_to_point("susie", choose(5, 6, 7), 5, 0);
            susie.sleepy = true;
            suwalk = 1;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
