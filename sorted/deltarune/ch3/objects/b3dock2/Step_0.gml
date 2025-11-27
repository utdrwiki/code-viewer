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
        if (susie.x < 350)
            supickgrass = true;
        else
            scr_pathfind_to_point("susie", 10, 6, 0);
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
                scr_pathfind_to_point("susie", 4, 5, 2);
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
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (talk == 0)
        {
            timer++;
            if (timer == 15)
            {
                timer = 0;
                tenna.bounce = 1;
                var tetalk = stringsetloc("The pier!#Like the ocean,#of the city!", "obj_b3dock2_slash_Step_0_gml_94_0");
                scr_couchtalk(tetalk, "tenna", 2, 60);
                talk = 1;
            }
        }
    }
    if (!kris.boat && suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = 1;
        if (suwalktimer == 15)
        {
            if (susie.x == 128)
                scr_pathfind_to_point("susie", 10, choose(3, 4, 5), 3);
            if (susie.x == 480)
                scr_pathfind_to_point("susie", choose(1, 2, 3), 1, 0);
            if (susie.y == 64)
            {
                var rand = choose(0, 1);
                if (rand)
                    scr_pathfind_to_point("susie", 10, choose(3, 4, 5), 3);
                else
                    scr_pathfind_to_point("susie", choose(1, 2, 3), 1, 0);
            }
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
