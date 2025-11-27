scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
}
else
{
}
if (convocon == 0)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "explore1")
        {
            if (active)
                trig = 1;
        }
    }
    if (trig == 1)
        convocon = 1;
}
if (convocon == 1)
{
    if (global.flag[1022] == 0)
    {
        var tetalk = stringsetloc("When I said EXPLORE, I didn't mean THIS MUCH! C'mon!", "obj_b2ferntalk_slash_Step_0_gml_38_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
        tenna.bounce = 1;
    }
    convocon = 2;
}
if (convocon == 2)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "explore2")
        {
            if (active)
                trig = 1;
        }
    }
    if (trig == 1)
        convocon = 3;
}
if (convocon == 3)
{
    if (global.flag[1022] == 0)
    {
        var tetalk = stringsetloc("You're really getting a kick out of this, huh?!", "obj_b2ferntalk_slash_Step_0_gml_59_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
        tenna.bounce = 1;
    }
    convocon = 4;
}
if (convocon == 4)
{
    if (active && obj_board_camera.con == 0)
    {
        timer = 0;
        convocon = 6;
    }
}
if (convocon == 6)
{
    timer++;
    if (timer == 1)
    {
        var sutalk = stringsetloc("Woah, what's in THERE?", "obj_b2ferntalk_slash_Step_0_gml_80_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
        if (global.flag[1022] == 1)
        {
            timer = 0;
            convocon = 7;
        }
    }
    if (timer == 61)
    {
        if (global.flag[1022] == 0)
        {
            var tetalk = stringsetloc("Nothing! Ignore that! It's just a leftover!", "obj_b2ferntalk_slash_Step_0_gml_92_0");
            scr_couchtalk(tetalk, "tenna", 2, 120);
            tenna.bounce = 1;
        }
        convocon = 7;
        timer = 0;
    }
}
if (convocon == 7)
{
    if (obj_board_camera.shift != "none")
        convocon = 8;
}
if (convocon == 8)
{
    if (obj_board_camera.shift == "none")
        convocon = 9;
}
if (convocon == 9)
{
    timer++;
    if (timer == 1)
    {
        if (global.flag[1022] == 0)
        {
            var sutalk = stringsetloc("... a leftover...?", "obj_b2ferntalk_slash_Step_0_gml_124_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        else
        {
            var sutalk = stringsetloc("Man, wish we could get in there.", "obj_b2ferntalk_slash_Step_0_gml_129_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
            instance_destroy();
            convocon = 999;
        }
    }
    if (timer == 61)
    {
        var tetalk = stringsetloc("Huh? I mean... uh... it's unfinished!", "obj_b2ferntalk_slash_Step_0_gml_137_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        tenna.bounce = 1;
        convocon = 10;
    }
}
if (convocon == 10)
{
    if (obj_board_camera.shift != "none")
        convocon = 11;
}
if (convocon == 11)
{
    if (obj_board_camera.shift == "none")
    {
        convocon = 12;
        timer = 0;
    }
}
if (convocon == 12)
{
    timer++;
    if (timer == 1)
    {
        var sutalk = stringsetloc("What was in it?", "obj_b2ferntalk_slash_Step_0_gml_166_0");
        scr_couchtalk(sutalk, "susie", 2, 70);
    }
    if (timer == 71)
    {
        var tetalk = stringsetloc("Nothing! It just goes back to...", "obj_b2ferntalk_slash_Step_0_gml_172_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
        tenna.bounce = 1;
        convocon = 13;
        timer = 0;
    }
}
if (convocon == 13)
{
    if (obj_board_camera.shift != "none")
        convocon = 14;
}
if (convocon == 14)
{
    if (obj_board_camera.shift == "none")
    {
        convocon = 15;
        var tetalk = stringsetloc("It doesn't matter! Let's get back to the game!", "obj_b2ferntalk_slash_Step_0_gml_192_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
        tenna.bounce = 1;
        timer = 0;
        instance_destroy();
    }
}
