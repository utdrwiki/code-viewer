scr_board_populatevars();
scr_gameshow_populatevars();
scr_depth_board();
var favflag = global.flag[1017];
if (init == 0)
{
    sprite_index = idle;
    init = 1;
}
if (myinteract == 3)
{
    if (favflag == 0)
    {
        scr_speaker("elnina");
        var string2 = stringsetloc("THEY SAY WHEN TWO TRUE LOVERS STAND SIDE BY SIDE HERE...", "obj_board_overlookfriendo_slash_Step_0_gml_10_0");
        if (talk == 0)
        {
            msgsetloc(0, "OH^1, OH^1, TENNA TOLD ME TO WAIT HERE AT LOVER'S PEAK.../", "obj_board_overlookfriendo_slash_Step_0_gml_13_0");
            msgnext(string2 + "/");
        }
        else
        {
            msgset(0, string2 + "/");
        }
        msgnextloc("THE RAINBOWED BRIDGE TO ATLANTIS WILL APPEAR./", "obj_board_overlookfriendo_slash_Step_0_gml_21_0");
        msgnextloc("BUT..^1. I DON'T THINK ANYONE'S COMING HERE FOR ME.../%", "obj_board_overlookfriendo_slash_Step_0_gml_22_0");
    }
    else
    {
        scr_speaker("lanino");
        var string2 = stringsetloc("THEY SAY WHEN TWO TRUE LOVERS STAND SIDE BY SIDE HERE...", "obj_board_overlookfriendo_slash_Step_0_gml_32_0");
        if (talk == 0)
        {
            msgsetloc(0, "OH^1, OH^1, TENNA TOLD ME TO WAIT HERE AT LOVER'S PEAK.../", "obj_board_overlookfriendo_slash_Step_0_gml_35_0");
            msgnext(string2 + "/");
        }
        else
        {
            msgset(0, string2 + "/");
        }
        msgnextloc("THE RAINBOWED BRIDGE TO ATLANTIS WILL APPEAR./", "obj_board_overlookfriendo_slash_Step_0_gml_43_0");
        msgnextloc("BUT..^1. I DON'T THINK ANYONE'S COMING HERE FOR ME.../%", "obj_board_overlookfriendo_slash_Step_0_gml_44_0");
    }
    var d = bw_make();
    d.side = 1;
    myinteract = 3.1;
    d.stay = 1;
    talk++;
}
if (myinteract == 3.1 && !bw_ex())
{
    myinteract = 0;
    buffer = 6;
    global.interact = 0;
    if (spoke == 0)
        spoke = 1;
}
if (dopose > 0)
{
    sprite_index = pose;
    dopose--;
}
else
{
    sprite_index = idle;
}
