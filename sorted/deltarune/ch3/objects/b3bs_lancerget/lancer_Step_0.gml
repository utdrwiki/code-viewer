if (talked)
    sprite_index = spr_lancer_dt;
else
    sprite_index = spr_lancer_ut;
if (x < (camerax() - 72))
    talked = 0;
if (global.plot >= 280)
{
    sprite_index = spr_lancer_stone;
    if (x > (camerax() - 20))
        global.flag[1254] = 1;
}
if (buffer > 0)
    buffer--;
if (con == 1)
{
    global.interact = 1;
    global.choice = -1;
    global.msc = -99;
    global.choicemsg[0] = stringsetloc("#What are#you doing?", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_17_0");
    global.choicemsg[1] = stringsetloc("#Tips &#Tricks", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_18_0");
    global.choicemsg[2] = stringsetloc("Nothing", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_19_0");
    if (global.flag[1099] > 0)
        global.choicemsg[2] = stringsetloc("Return controllers", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_21_0");
    global.choicemsg[3] = stringset("");
    scr_speaker("lancer");
    msgsetloc(0, "\\E1* Ho ho ho^1! What's up^1, my gang?/", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_26_0");
    msgnext("\\E1\\C3 ");
    con = 2;
    if (global.plot >= 280)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (..^1. stone.)/%", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_45_0");
        con = 99;
    }
    d_make();
}
if (con == 2 && global.choice != -1)
{
    k_d(2);
    if (global.choice == 0)
    {
        scr_speaker("lancer");
        msgsetloc(0, "\\E2* I lost my controller^1, so they gave me a fresh one!/", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_40_0");
        msgnextloc("\\E1* Repeat several times^1, and voil-o^1! Fun is had./%", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_41_0");
        d_make();
        con = 99;
    }
    if (global.choice == 1)
    {
        scr_speaker("lancer");
        msgsetloc(0, "\\E3* Oh-ho^1! You want some treats of the trade!?/", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_48_0_b");
        msgnextloc("\\E2* To be me^1, first find an X on the ground./", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_49_0");
        msgnextloc("\\E1* Go on it and..^1. dig^1! I don't know which button!/", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_50_0_b");
        msgnextloc("\\E3* I just press all of them down with my tongue./", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_51_0_b");
        msgnextloc("\\E6* Eventually your controller will break./", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_52_0");
        msgnextloc("\\E2* A father figure will give you a new one./", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_53_0");
        msgnextloc("\\E1* Say \"aaaaa\" when he checks your mouth for illness./", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_54_0");
        msgnextloc("\\E3* Then^1, just gargle^1, rinse^1, and repeat^1! Have fun^1, team!/%", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_55_0");
        d_make();
        con = 99;
    }
    if (global.choice == 2)
    {
        if (global.flag[1099] > 0)
        {
            scr_keyitemremove(19);
            scr_speaker("lancer");
            msgsetloc(0, "\\E8* Hokey-dokey. Smush those babies back in.../%", "obj_b3bs_lancerget_lancer_slash_Step_0_gml_60_0");
            d_make();
            con = 98;
        }
        else
        {
            con = 99;
        }
    }
}
if (con == 98 && !d_ex())
{
    snd_play(snd_reverse_splat);
    with (obj_b3bs_lancerget_console)
        insert = 1;
    global.flag[1099] = 0;
    con = 99;
}
if (con == 99 && !d_ex())
{
    con = 0;
    global.interact = 0;
    buffer = 3;
}
