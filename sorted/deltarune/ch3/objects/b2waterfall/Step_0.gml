scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
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
            var randx = irandom_range(176, 408);
            scr_pathfind_to_point("susie", randx, 192, 0);
            susie.sleepy = true;
            suwalk = 1;
        }
    }
    if (rockcon == 0 && obj_board_camera.con == 0)
        rockcon = 1;
    if (rockcon == 1)
    {
        timer++;
        if (global.flag[1124] == 1)
        {
            if (timer == 5)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Sorry kids, no falling rocks today.", "obj_b2waterfall_slash_Step_0_gml_42_0");
                scr_couchtalk(tetalk, "tenna", 2, 80);
            }
        }
        if (global.flag[1124] == 2)
        {
            if (timer == 5)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Sorry kids, no falling peaches. They expired.", "obj_b2waterfall_slash_Step_0_gml_39_0");
                scr_couchtalk(tetalk, "tenna", 2, 80);
            }
            if (timer == 85)
            {
                var ratalk = stringsetloc("I thought they were rocks.", "obj_b2waterfall_slash_Step_0_gml_44_0");
                scr_couchtalk(ratalk, "ralsei", 2, 80);
            }
            if (timer == 145)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Those also expired.", "obj_b2waterfall_slash_Step_0_gml_51_0");
                scr_couchtalk(tetalk, "tenna", 2, 80);
                rockcon = 20;
            }
        }
    }
}
else
{
    if (rockcon == 1)
        rockcon = 20;
    suwalktimer = 0;
    suwalk = 0;
    timer = 0;
}
