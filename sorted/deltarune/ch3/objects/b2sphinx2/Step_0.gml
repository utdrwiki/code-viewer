scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            scr_pathfind_to_point("susie", 10, 5, 2);
            suwalk = 1;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
