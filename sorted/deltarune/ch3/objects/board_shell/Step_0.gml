buffer--;
if (con == 1)
{
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("LISTEN", "obj_board_shell_slash_Step_0_gml_12_0");
    global.choicemsg[1] = stringsetloc("DO NOT", "obj_board_shell_slash_Step_0_gml_13_0");
    scr_speaker("no_name");
    msgsetloc(0, "A CRACKED CONCH^1, SURROUNDED BY WASHED UP GLASS./", "obj_board_shell_slash_Step_0_gml_16_0");
    msgnextloc("NOT A PERSON SEEMED TO WANT IT./", "obj_board_shell_slash_Step_0_gml_17_0");
    msgnextloc("LISTEN TO IT?/", "obj_board_shell_slash_Step_0_gml_18_0");
    msgnext("\\C2 ");
    with (bw_make())
        stay = 4;
    con = 2;
}
if (con == 2 && global.choice != -1)
{
    with (obj_writer)
        instance_destroy();
    if (global.choice == 0)
    {
        msgsetloc(0, "THE SOUND OF THE OCEAN.../", "obj_board_shell_slash_Step_0_gml_28_0");
        msgnextloc("A PITY^1, IT WAS JUST REPEATING ALL IT KNEW./%", "obj_board_shell_slash_Step_0_gml_29_0");
    }
    if (global.choice == 1)
        msgsetloc(0, "BUT YOU COULD STILL HEAR THE SOUND OF THE OCEAN./%", "obj_board_shell_slash_Step_0_gml_33_0");
    with (bw_make())
        skip = true;
    con = 3;
}
if (con == 3 && !bw_ex())
{
    global.interact = 0;
    con = 0;
    buffer = 3;
}
