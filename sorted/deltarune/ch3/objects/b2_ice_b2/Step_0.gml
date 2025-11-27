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
            var rand = choose(0, 1, 2);
            if (rand == 0)
                scr_pathfind_to_point("susie", 192, 144, 2);
            if (rand == 1)
                scr_pathfind_to_point("susie", 384, 112, 1);
            if (rand == 2)
                scr_pathfind_to_point("susie", 416, 256, choose(0, 3));
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
