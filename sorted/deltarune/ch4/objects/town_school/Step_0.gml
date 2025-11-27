if (con == 0 && obj_mainchara.x >= 360 && obj_mainchara.x < 400 && obj_mainchara.y < 135 && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    obj_mainchara.y += 6;
    if (scr_flag_get(770) == 0)
    {
        scr_flag_set(770, 1);
        scr_speaker("susie");
        msgsetloc(0, "\\EV* ..^1.  it's late./", "obj_town_school_slash_Step_0_gml_18_0");
        msgnextloc("\\EV* Why don't we just..^1. go home?/%", "obj_town_school_slash_Step_0_gml_19_0");
    }
    else
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EV* .../%", "obj_town_school_slash_Step_0_gml_23_0");
    }
    d_make();
}
if (con == 1 && !d_ex())
{
    con = 0;
    global.interact = 0;
}
