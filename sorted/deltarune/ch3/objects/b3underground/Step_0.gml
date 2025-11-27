scr_board_populatevars();
scr_gameshow_populatevars();
active = 0;
if (obj_b3undergroundleft.active == true || obj_b3undergroundright.active == true)
    active = 1;
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        con = 1;
        timer = 0;
    }
}
else
{
}
if (con == 1)
{
    timer++;
    if (timer == 15)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("Everyone having fun!?", "obj_b3underground_slash_Step_0_gml_34_0");
        scr_couchtalk(tetalk, "tenna", 2, 60);
    }
    if (timer == 75)
    {
        var ratalk = stringsetloc("It's fine!", "obj_b3underground_slash_Step_0_gml_39_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
        var sutalk = stringsetloc("Yeah, uh, sure.", "obj_b3underground_slash_Step_0_gml_42_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
    }
    if (timer == 135)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("Great! great!!", "obj_b3underground_slash_Step_0_gml_48_0");
        scr_couchtalk(tetalk, "tenna", 2, 60);
        con = 2;
    }
}
