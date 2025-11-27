scr_depth_board();
if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (i_ex(kris))
{
    if (kris.camera == true)
        instance_destroy();
}
buffer--;
if (myinteract == 3)
{
    global.interact = 1;
    msgsetloc(0, "YOU REQUIRE A CAMERA TO PROCEED/%", "obj_board_camerablocker_slash_Step_0_gml_15_0");
    bw_make();
    myinteract = 4;
}
if (myinteract == 4 && !bw_ex())
{
    global.interact = 0;
    myinteract = 0;
    buffer = 3;
}
