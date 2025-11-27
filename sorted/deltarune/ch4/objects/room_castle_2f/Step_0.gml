if (con < 0)
    exit;
if (con == 0 && obj_mainchara.y < 360 && obj_mainchara.x >= 216)
{
    con = 1;
    global.interact = 1;
    scr_speaker("ralsei");
    msgsetloc(0, "\\E2* Umm..^1. I have a surprise for you two!/", "obj_room_castle_2f_slash_Step_0_gml_11_0");
    msgnextloc("\\E1* If we could go in your rooms.../%", "obj_room_castle_2f_slash_Step_0_gml_12_0");
    d_make();
}
if (con == 1 && !d_ex())
{
    con = -1;
    global.interact = 0;
    scr_flag_set(1516, 1);
}
