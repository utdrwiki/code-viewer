scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (talked == 0 && obj_board_camera.con == 0)
    {
        talked = 1;
        talktimer = 0;
    }
    if (talked == 1)
    {
        talktimer++;
        if (talktimer == 5)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Feast your wallets on our bustling commercial district!", "obj_b3center_slash_Step_0_gml_28_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (talktimer == 85)
        {
            var ratalk = stringsetloc("It's one door...", "obj_b3center_slash_Step_0_gml_33_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (talktimer == 115)
        {
            talktimer = 0;
            talked = 999;
        }
    }
    if (talked == 999)
    {
        if (bustletalk == 1 && !bw_ex())
            bustletalk = 2;
        if (bustletalk == 2)
        {
            talktimer++;
            if (talktimer == 1)
            {
                var sutalk = stringsetloc("He says the same thing.", "obj_b3center_slash_Step_0_gml_53_0");
                scr_couchtalk(sutalk, "susie", 2, 60);
            }
            if (talktimer == 61)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("NO HE DOESNT.", "obj_b3center_slash_Step_0_gml_59_0");
                scr_couchtalk(tetalk, "tenna", 2, 60);
                bustletalk = 3;
                talktimer = 0;
            }
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
        {
            suwalk = 1;
            scr_pathfind_to_point("susie", choose(5, 6), choose(4, 5), 0);
        }
    }
}
else
{
    if (bustletalk > 0)
        bustletalk = 99;
    if (talked > 0)
        talked = 999;
    talktimer = 0;
    suwalktimer = 0;
    suwalk = 0;
}
