if (myinteract == 3)
{
    scr_speaker("no_name");
    msgsetloc(0, "A FLOWER..^1. HALF OF THE PETALS ARE MISSING./", "obj_board_b2tornflower_slash_Step_0_gml_6_0");
    msgnextloc("HALF OF THE STEM IS MISSING./", "obj_board_b2tornflower_slash_Step_0_gml_7_0");
    msgnextloc("HALF OF THE MIDDLE IS MISSING./", "obj_board_b2tornflower_slash_Step_0_gml_8_0");
    msgnextloc("YET^1, IT STANDS./%", "obj_board_b2tornflower_slash_Step_0_gml_9_0");
    bw_make();
    global.interact = 1;
    myinteract = 4;
}
if (myinteract == 4 && !bw_ex())
{
    global.interact = 0;
    myinteract = 0;
}
