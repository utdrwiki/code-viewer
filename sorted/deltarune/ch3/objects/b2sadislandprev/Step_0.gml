scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat && !tennahere() && ralseiquestion == 0 && obj_board_camera.con == 0 && obj_b2iceregion.con >= 10)
    {
        ralseiquestion = 1;
        var sutalk = stringsetloc("Heh, I think I know where we're going.", "obj_b2sadislandprev_slash_Step_0_gml_19_0");
        scr_couchtalk(sutalk, "susie", 2, 120);
        su_real.sprite_index = spr_susie_walk_right_dw;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (kris.boat == true)
        suwalk = 1;
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
        {
            susie.sleepy = true;
            if (susie.x < 302)
                scr_pathfind_to_point("susie", 4, 5, 1);
            else if (susie.y < 204)
                scr_pathfind_to_point("susie", choose(7, 8), choose(5, 6), 0);
            else
                scr_pathfind_to_point("susie", choose(7, 8), choose(2, 3), 2);
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
    con = 0;
    if (visit != 0 && visit < 10)
    {
        visit = 10;
        timer = 0;
    }
}
