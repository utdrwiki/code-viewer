scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (kris.boat == true)
        suwalk = 1;
    if (kris.boat == true && boattalk == 0 && tennahere())
    {
        with (obj_actor_tenna)
            bounce = 1;
        tetalk = stringsetloc("RAFT forth! UNKNOWN MYSTERIES await you!", "obj_b2riversouth_slash_Step_0_gml_23_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        boattalk = 1;
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (scr_board_checklocation("susie", 256, 64, 8))
                scr_pathfind_to_point("susie", 4, 6, 0);
            if (scr_board_checklocation("susie", 128, 252, 8))
                scr_pathfind_to_point("susie", 4, 6, 0);
            if (susie.x == 128 && susie.y < 212)
                scr_pathfind_to_point("susie", 2.5, 2, 0);
            if (scr_board_checklocation("susie", 192, 128, 2))
                scr_pathfind_to_point("susie", 0.5, 2, 0);
            if (susie.x > 320)
                scr_pathfind_to_point("susie", 7, 6, 0);
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
