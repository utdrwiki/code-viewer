scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat == true)
    {
        suwalk = 1;
        boated = true;
    }
    else
    {
        susie.sleepy = true;
    }
    if (boated == true && kris.boat == false && susie.canfreemove == true)
    {
        boated = false;
        ralsei.follow = true;
        scr_pathfind_to_point("susie", 9, 4, 0);
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
        {
            scr_pathfind_end("ralsei");
            ralsei.follow = 1;
        }
        if (suwalktimer == 15)
        {
            if (susie.x < 230)
                scr_pathfind_to_point("susie", 1, 5, 0);
            else
                scr_pathfind_to_point("susie", 8, 3, 0);
            susie.sleepy = true;
            suwalk = 1;
        }
    }
}
else
{
    boated = false;
    suwalktimer = 0;
    suwalk = 0;
}
