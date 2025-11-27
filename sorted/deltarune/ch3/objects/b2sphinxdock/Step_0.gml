scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat == true && boated == false)
        boated = true;
    if (kris.boat == false && boated == true)
    {
        boated = false;
        suwalktimer = 0;
        suwalk = 0;
    }
    if (suwalk == 0 && obj_board_camera.con == 0 && kris.boat == false)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
            scr_pathfind_to_point("susie", 9, 1, 0);
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
