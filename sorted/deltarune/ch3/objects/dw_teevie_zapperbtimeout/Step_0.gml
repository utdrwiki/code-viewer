if (con == 0 && i_ex(chainact))
{
    if (chainact.myinteract > 0)
    {
        con = 1;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_teevie_zapperbtimeout_slash_Step_0_gml_16_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_teevie_zapperbtimeout_slash_Step_0_gml_17_0");
        scr_speaker("no_name");
        msgsetloc(0, "* There's a chain stopping the way./", "obj_dw_teevie_zapperbtimeout_slash_Step_0_gml_20_0");
        msgnextloc("* Take it down?/", "obj_dw_teevie_zapperbtimeout_slash_Step_0_gml_21_0");
        msgnext("\\C2 ");
        d_make();
    }
}
if (con == 1 && global.choice != -1)
{
    if (global.choice == 0)
    {
        k_d(1);
        safe_delete(chainblock);
        global.flag[1243] = 2;
        chain.image_index = 1;
        snd_play(snd_item);
        scr_speaker("no_name");
        msgsetloc(0, "* You removed the flimsy chains./%", "obj_dw_teevie_zapperbtimeout_slash_Step_0_gml_40_0");
        d_make();
        con = 2;
    }
    else
    {
        k_d();
        chainact.myinteract = 0;
        con = 0;
        global.interact = 0;
    }
}
if (con == 2 && !d_ex())
{
    global.interact = 0;
    chain.image_index = 1;
    con++;
}
