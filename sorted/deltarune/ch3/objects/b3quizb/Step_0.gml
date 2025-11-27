scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat == true)
        boated = true;
    if (boated == true && kris.boat == false && susie.canfreemove == true && obj_board_camera.con == 0)
    {
        boated = false;
        ralsei.follow = true;
        scr_pathfind_to_point("susie", 5, choose(4, 5), 0);
        suwalk = 1;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (suwalk == 0 && !boated)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer >= 15)
            {
                suwalk = 1;
                if (susie.x < 320)
                {
                    if (talk == 0)
                    {
                        talk = 1;
                        var tetalk = stringsetloc("A quiz! But it's, near the water!", "obj_b3quizb_slash_Step_0_gml_45_0");
                        scr_couchtalk(tetalk, "tenna", 2, 60);
                    }
                    scr_pathfind_to_point("susie", 5, choose(2, 3), 0);
                }
                else
                {
                    scr_pathfind_to_point("susie", 10, 1, 0);
                }
            }
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
    boated = false;
}
