scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat && !tennahere() && ralseiquestion == 0 && obj_board_camera.con == 0)
    {
        ralseiquestion = 1;
        var ratalk = stringsetloc("Where are we going...?", "obj_b2southwest_slash_Step_0_gml_19_0");
        scr_couchtalk(ratalk, "ralsei", 2, 120);
        ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (friendtalk == 0 && obj_board_inventory.ninfriendo == true && tennahere())
        {
            friendtalk = 1;
            tenna.bounce = 1;
            var tetalk = stringsetloc("The end is close! Back to LOVER'S PEAK!", "obj_b2southwest_slash_Step_0_gml_28_0");
            scr_couchtalk(tetalk, "tenna", 2, 140);
        }
    }
    if (boated == false && kris.boat == true)
    {
        boated = true;
        suwalk = 1;
    }
    if (boated == true && kris.boat == false)
    {
        boated = false;
        suwalk = 0;
        suwalktimer = 0;
    }
    if (suwalk == 0 && obj_board_camera.con == 0 && kris.boat == false)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (susie.x > 304)
            {
                if (susie.y < 180)
                    scr_pathfind_to_point("susie", 9, 2, 0);
                else
                    scr_pathfind_to_point("susie", choose(9, 10), 6, 0);
            }
            else
            {
                scr_pathfind_to_point("susie", 1.5, 4, 0);
            }
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
