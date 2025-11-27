if (con == 0)
{
    tenna.image_speed = lerp(tenna.image_speed, 2, 0.05);
    tenna.sprite_index = spr_tenna_dance_cabbage;
    if (trig.myinteract == 3)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Ready", "obj_dw_tv_curtain_tennanpc_slash_Step_0_gml_21_0");
    global.choicemsg[1] = stringsetloc("#Not Ready", "obj_dw_tv_curtain_tennanpc_slash_Step_0_gml_22_0");
    scr_speaker("tenna");
    msgsetloc(0, "* Everyone got their snacks and drinks?/", "obj_dw_tv_curtain_tennanpc_slash_Step_0_gml_27_0");
    msgnextloc("* Once the show starts there will be NO bathroom breaks!/", "obj_dw_tv_curtain_tennanpc_slash_Step_0_gml_28_0");
    msgnextloc("* Are we all ready to begin the show?!/", "obj_dw_tv_curtain_tennanpc_slash_Step_0_gml_29_0");
    msgnext("\\C2 ");
    con = 2;
    if (talked)
    {
        tenna.preset = 21;
        scr_speaker("tenna");
        msgsetloc(0, "* Are we ready now?/", "obj_dw_tv_curtain_tennanpc_slash_Step_0_gml_37_0");
        msgnext("\\C2 ");
        con = 5;
    }
    with (d_make())
        side = 1;
}
if (con == 2)
{
    timer++;
    if (scr_getmsgno_d() == 0 || timer > 5)
    {
        timer = 0;
        tenna.bounce = 1;
        tenna.preset = 21;
        con = 3;
    }
}
if (con == 3)
{
    if (scr_getmsgno_d() == 1 || timer > 5)
    {
        timer = 0;
        tenna.bounce = 1;
        tenna.preset = 8;
        tenna.sprite_index = spr_tenna_tie_adjust_a;
        con = 4;
    }
}
if (con == 4)
{
    if (scr_getmsgno_d() == 2 || timer > 5)
    {
        tenna.preset = 22;
        timer = 0;
        con = 5;
    }
}
if (con == 5 && i_ex(obj_choicer_neo))
{
    talked = 1;
    tenna.preset = 3;
    con = 6;
}
if (con == 6 && global.choice != -1)
{
    if (global.choice == 0)
        k_d(1);
    else
        k_d();
    if (global.choice == 0)
        con = 72;
    if (global.choice == 1)
    {
        con = 0;
        trig.myinteract = 0;
        global.interact = 0;
        tenna.preset = 0;
        tenna.image_speed = 0;
        tenna.bounce = 1;
    }
}
if (con == 72)
{
    tenna.preset = 34;
    scr_speaker("tenna");
    msgsetloc(0, "* Great^1! Mike^1, hit it!/%", "obj_dw_tv_curtain_tennanpc_slash_Step_0_gml_116_0");
    with (d_make())
        side = 1;
    con = 73;
    timer = 0;
}
if (con == 73 && !d_ex())
{
    timer++;
    if (timer == 15)
    {
        snd_free_all();
        snd_play(snd_impact);
        snd_play(snd_locker);
        room_goto(room_ch3_gameshowroom);
    }
}
