scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat == 1)
        suwalk = 1;
    if (kris.boat && atlantalk == 0 && obj_board_camera.con == 0 && tennahere())
    {
        atlantalk = 1;
        tenna.bounce = 1;
        var tetalk = stringsetloc("Atlantis sure is beautiful this time of year!", "obj_b2atlantisentrance_slash_Step_0_gml_21_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
    }
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
            scr_pathfind_to_point("susie", 7.5, 3.5, 3);
            suwalk = 1;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
