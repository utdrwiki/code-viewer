scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (boated == false && kris.boat == true)
        boated = true;
    if (boated == true && kris.boat == false)
    {
        suwalk = 0;
        suwalktimer = 0;
        boated = false;
    }
    if (suwalk == 0 && obj_board_camera.con == 0 && kris.boat == false)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (susie.x < 240)
                scr_pathfind_to_point("susie", 320, 112, 2);
            else
                scr_pathfind_to_point("susie", 176, 224, 0);
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
