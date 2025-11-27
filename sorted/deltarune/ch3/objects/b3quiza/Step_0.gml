scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        talktimer++;
        if (talktimer >= 15)
        {
            if (talk == 0)
            {
                talk = 1;
                var tetalk = stringsetloc("A quiz! But it's shy!", "obj_b3quiza_slash_Step_0_gml_20_0");
                scr_couchtalk(tetalk, "tenna", 2, 70);
            }
        }
    }
    if (obj_board_camera.con == 0)
        ralsei.follow = 1;
    if (suwalk == 0 && !i_ex(obj_board_q3quizgraylegs) && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 15)
        {
            if (susie.x == 480)
                scr_pathfind_to_point("susie", choose(4, 5), 1, 0);
            else
                scr_pathfind_to_point("susie", 10, choose(4, 5), choose(0, 0, 0, 0, 3));
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
