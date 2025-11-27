if (myinteract == 3)
{
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* Text time!!/%", "obj_climb_interact_slash_Step_0_gml_8_0");
    d_make();
    myinteract = 4;
}
if (myinteract == 4 && !d_ex())
{
    global.interact = 0;
    myinteract = 5;
}
if (myinteract == 5)
{
    if (!place_meeting(x, y, obj_climb_kris))
        myinteract = 0;
}
