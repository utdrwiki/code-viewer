if (myinteract == 4)
    myinteract = 0;
if (myinteract == 400)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (It looks like you'd be able to climb this if you had the right tools.)/%", "obj_climbstartertrig_slash_Step_0_gml_15_0");
    d_make();
    myinteract = 401;
}
if (myinteract == 401 && !d_ex())
{
    global.interact = 0;
    myinteract = 0;
}
