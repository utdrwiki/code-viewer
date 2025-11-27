with (zap)
{
    if (myinteract == 3)
    {
        myinteract = 4;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Stay Here", "obj_dw_b3bs_jail1_slash_Step_0_gml_15_0");
        global.choicemsg[1] = stringsetloc("#Near the#Keycard Area", "obj_dw_b3bs_jail1_slash_Step_0_gml_16_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("zapper");
        msgsetloc(0, "* Did ya wanna go somewhere?/", "obj_dw_b3bs_jail1_slash_Step_0_gml_20_0");
        msgnext("\\C2 ");
        d_make();
    }
    if (myinteract == 4 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            myinteract = 0;
            global.interact = 0;
        }
        if (global.choice == 1)
        {
            scr_speaker("zapper");
            msgsetloc(0, "* You got it^1, boss./%", "obj_dw_b3bs_jail1_slash_Step_0_gml_36_0");
            d_make();
            myinteract = 5;
            timer = 0;
        }
    }
    if (myinteract == 5 && !d_ex())
    {
        timer++;
        if (timer == 5)
        {
            change = instance_create(x, y, obj_tvturnoff_manager);
            change.kind = 1;
            change.roomtarg = 217;
        }
    }
}
with (tail)
{
    if (myinteract == 3)
    {
        if (!variable_instance_exists(id, "talked"))
            talked = 0;
        global.interact = 1;
        scr_speaker("Goulden Sam's Tail");
        msgsetloc(0, "* (Nobody talks to the tail.)/%", "obj_dw_b3bs_jail1_slash_Step_0_gml_61_0");
        if (talked)
            msgsetloc(0, "* (Are you listening?)/%", "obj_dw_b3bs_jail1_slash_Step_0_gml_64_0");
        d_make();
        myinteract = 4;
        talked++;
    }
    if (myinteract == 4 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
