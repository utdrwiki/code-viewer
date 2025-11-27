if (con == 1)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (Inside the trash...)/", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_7_0");
    msgnextloc("* (..^1. was a switch!)/%", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_8_0");
    d = d_make();
    con = 2;
}
if (con == 2)
    con = 3;
if (con == 3 && !d_ex())
{
    snd_play(snd_impact);
    scr_shakescreen();
    with (obj_dw__backstagelight)
        instance_destroy();
    con = 4;
    timer = 0;
    global.interact = 0;
    global.flag[1137] = 1;
    with (obj_dw_b3bs_zapper_a)
    {
        safe_delete(closeddoor);
        safe_delete(doortrig);
    }
}
if (con == 5)
{
    scr_speaker("no_name");
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("Climb#into the#trash", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_44_0");
    global.choicemsg[1] = stringsetloc("#Forget it", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_45_0_b");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    msgsetloc(0, "* (Inside the trash is a switch^1, but it's pressed down too far.)/", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_45_0");
    msgnextloc("* (Reaching it would mean climbing into the trash.)/", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_46_0");
    msgnextloc("* (Also^1, it would turn the lights back on.)/", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_47_0");
    msgnext("\\C2 ");
    d_make();
    con = 6;
}
if (con == 6 && global.choice != -1)
{
    k_d(1);
    if (global.choice == 0)
        con = 7;
    if (global.choice == 1)
    {
        con = 4;
        global.interact = 0;
        msgsetloc(0, "%%", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_64_0");
    }
}
if (con == 7)
{
    timer++;
    if (timer == 1)
    {
        blackout = scr_marker(camerax() - 10, cameray() - 10, spr_pxwhite);
        blackout.image_xscale = 999;
        blackout.image_yscale = 999;
        blackout.image_alpha = 0;
        blackout.image_blend = c_black;
        blackout.depth = 10;
        scr_lerpvar_instance(blackout, "image_alpha", 0, 1, 30);
        scr_speaker("no_name");
        msgsetloc(0, "* (Everyone climbed into the trash.)/%", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_81_0");
        d_make();
    }
    if (timer == 31)
    {
        timer = 0;
        con = 8;
    }
}
if (con == 8 && !d_ex())
{
    timer++;
    if (timer == 15)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (...)/", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_96_0");
        msgnextloc("* (..^1. there's no way to unpress the switch.)/%", "obj_dw_ch3_b3bs_zappera_trashswitch_slash_Step_0_gml_97_0");
        d_make();
        timer = 0;
        con++;
    }
}
if (con == 9)
{
    if (scr_getmsgno() == 1)
    {
        scr_lerpvar_instance(blackout, "image_alpha", 1, 0, 30);
        scr_doom(blackout, 31);
        con = -1;
        scr_delay_var("con", 10, 30);
    }
}
if (con == 10 && !d_ex())
{
    global.interact = 0;
    con = 11;
}
