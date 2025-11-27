if (myinteract == 3)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (Perhaps if you play part of a bar^1, the bars will part.)/%", "obj_dw_church_steelstaff_slash_Step_0_gml_7_0");
    d_make();
    myinteract = 4;
}
if (myinteract == 4 && !d_ex())
{
    global.interact = 0;
    myinteract = 0;
}
