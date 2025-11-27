scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (boated == false && kris.boat == true)
        boated = true;
    if (boated == true && kris.boat == false)
    {
        suwalk = 0;
        suwalktimer = 0;
        boated = false;
    }
    if (suwalk == 0 && obj_board_camera.con == 0 && kris.boat == false)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            scr_pathfind_to_point("susie", 288, 256, 0);
            susie.sleepy = true;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
if (con == 1)
{
    if (global.flag[1022] == 0)
    {
        if (obj_board_camera.con != 0)
            con = 1.1;
    }
    else
    {
        con = 99;
    }
}
if (con == 1.1 && obj_board_camera.con == 0)
    con = 1.2;
if (con == 1.2 && obj_board_camera.con != 0)
    con = 1.3;
if (con == 1.3 && obj_board_camera.con == 0)
{
    tenna.bounce = 1;
    var tetalk = stringsetloc("So uh... the Tropic of Love...", "obj_b2heartisland_slash_Step_0_gml_53_0");
    scr_couchtalk(tetalk, "tenna", 2, 80);
    con = 2;
}
if (con == 2 && obj_board_camera.con != 0)
    con = 2.1;
if (con == 2.1 && obj_board_camera.con == 0)
{
    tenna.bounce = 1;
    var tetalk = stringsetloc("Anyone else think that was cool? Haha...", "obj_b2heartisland_slash_Step_0_gml_62_0");
    scr_couchtalk(tetalk, "tenna", 2, 80);
    con = 3;
}
if (con == 3 && obj_board_camera.con != 0)
    con = 3.1;
if (con == 3.1 && obj_board_camera.con == 0)
    con = 3.2;
if (con == 3.2 && obj_board_camera.con != 0)
    con = 3.3;
if (con == 3.3 && obj_board_camera.con == 0)
{
    tenna.bounce = 1;
    var tetalk = stringsetloc("Anyone?", "obj_b2heartisland_slash_Step_0_gml_73_0");
    scr_couchtalk(tetalk, "tenna", 2, 80);
    con = 99;
}
