scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("Oh! It's MAGIC RAFT!", "obj_b2raftget_slash_Step_0_gml_15_0");
        if (textpat == 1)
            tetalk = stringsetloc("You've unlocked a NEW RAFT!!!", "obj_b2raftget_slash_Step_0_gml_18_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
        con = 1;
    }
}
else
{
}
if (con == 1)
{
    var trig = 0;
    with (obj_board_b2_boatwarp)
    {
        if (con == 1)
            trig = 1;
    }
    if (trig == 1)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("With the MAGIC RAFT, the OCEAN is your OYSTER!", "obj_b2raftget_slash_Step_0_gml_37_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        con = 2;
    }
}
