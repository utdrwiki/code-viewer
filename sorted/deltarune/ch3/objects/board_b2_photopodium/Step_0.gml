scr_board_depth();
buffer--;
if (con == 1)
{
    global.interact = 1;
    scr_speaker("no_name");
    if (myflag == 0)
        msgsetloc(0, "A PODIUM FOR HOLDING A PHOTOGRAPH.\nA PHOTIUM./%", "obj_board_b2_photopodium_slash_Step_0_gml_14_0");
    if (myflag == 1041)
        msgsetloc(0, "A PHOTO OF A FLOWER TORN IN TWO./%", "obj_board_b2_photopodium_slash_Step_0_gml_18_0");
    if (myflag == 1042)
        msgsetloc(0, "A PHOTO OF A SPRING OF GREEN PERFUME./%", "obj_board_b2_photopodium_slash_Step_0_gml_22_0");
    if (myflag == 1043)
        msgsetloc(0, "A PHOTO OF THE SMITTEN CACTUS./%", "obj_board_b2_photopodium_slash_Step_0_gml_27_0");
    if (myflag == 1227)
        msgsetloc(0, "A PHOTO OF THE SCARLET ANTLION./%", "obj_board_b2_photopodium_slash_Step_0_gml_32_0");
    bw_make();
    con++;
}
if (con == 2 && !bw_ex())
{
    con = 0;
    global.interact = 0;
    buffer = 3;
}
