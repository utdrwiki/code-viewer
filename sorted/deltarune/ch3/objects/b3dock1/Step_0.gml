scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat == true)
        boated = true;
    if (boated)
    {
        suwalk = 1;
        supickgrass = false;
        supickgrasstimer = 0;
        targx = 0;
        targy = 0;
    }
    if (boated == true && kris.boat == false && susie.canfreemove == true)
    {
        boated = false;
        supickgrass = true;
    }
    if (supickgrass == true)
    {
        if (supickgrasstimer == 0)
        {
            var targ = 0;
            var targfound = 0;
            with (obj_board_grabbablegrass)
            {
                if (active && !targfound)
                {
                    targfound = true;
                    targ = id;
                }
            }
            if (i_ex(targ) && global.flag[1052] == 0)
            {
                targx = targ.x;
                targy = targ.y - 10;
                scr_pathfind_to_point("susie", targx, targy, 0);
                supickgrasstimer = 1;
            }
            else
            {
                debug_print("no more grass");
                scr_pathfind_to_point("susie", 7, 5, 0);
                supickgrasstimer = 999;
            }
        }
        if (supickgrasstimer == 1)
        {
            if (scr_board_checklocation("susie", targx, targy, 1))
            {
                scr_pathfind_end("susie");
                scr_play_recording("susie", "0101");
                supickgrasstimer = -1;
                scr_delay_var("supickgrasstimer", 0, 15);
            }
        }
    }
    if (!kris.boat && suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = 1;
        if (suwalktimer == 15)
            scr_pathfind_to_point("susie", choose(1, 2, 3, 8, 9, 10), 1, 0);
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
