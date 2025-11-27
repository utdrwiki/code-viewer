scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("This goes to our entertainment district! Here our fun is stored!", "obj_b3entertainmentalley_slash_Step_0_gml_15_0");
        scr_couchtalk(tetalk, "tenna", 2, 80);
        con++;
    }
    if (suwalk == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (susie.x > 320)
                scr_pathfind_to_point("susie", 1, 4, 0);
            else
                scr_pathfind_to_point("susie", 10, 5, 0);
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
