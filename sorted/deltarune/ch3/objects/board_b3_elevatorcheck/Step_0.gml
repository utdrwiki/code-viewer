scr_board_populatevars();
scr_gameshow_populatevars();
buffer--;
if (myinteract == 3)
{
    buffer = 3;
    if (con == 0)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "THE ELEVATOR IS LOCKED WITH \\cYTHE MOONCLOUD KEY CARD\\cW./%", "obj_board_b3_elevatorcheck_slash_Step_0_gml_16_0");
        bw = bw_make();
        bw.side = 0;
        con = 1;
    }
}
if (con == 1 && !bw_ex() && !i_ex(obj_couchwriter))
{
    con = 2;
    global.interact = 0;
    timer = 0;
}
if (con == 2)
{
    timer++;
    if (timer == 1)
        kris.cantleave = true;
    if (timer == 5)
    {
        tenna.bounce = true;
        var tetalk = stringsetloc("Oh no! Looks like you need the key card first.", "obj_board_b3_elevatorcheck_slash_Step_0_gml_39_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
    }
    if (timer == 95)
    {
        tenna.bounce = true;
        var tetalk = stringsetloc("But don't worry... You can take the stairs!", "obj_board_b3_elevatorcheck_slash_Step_0_gml_45_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
    }
    if (timer == 105)
    {
        obj_b3elevator.delbanister = 1;
        kris.cantleave = false;
        con = 3;
        instance_destroy();
    }
}
