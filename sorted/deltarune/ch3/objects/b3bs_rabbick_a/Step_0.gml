if (i_ex(knockdoor))
{
    with (knockdoor)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            global.msc = -99;
            global.choice = -1;
            global.choicemsg[0] = stringsetloc("#Yes", "obj_b3bs_rabbick_a_slash_Step_0_gml_14_0");
            global.choicemsg[1] = stringsetloc("#No", "obj_b3bs_rabbick_a_slash_Step_0_gml_15_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            scr_speaker("no_name");
            msgsetloc(0, "* The sign on the door reads \"knock for assistance.\"/", "obj_b3bs_rabbick_a_slash_Step_0_gml_19_0");
            msgnextloc("* Knock?/", "obj_b3bs_rabbick_a_slash_Step_0_gml_20_0");
            msgnext("\\C2 ");
            d_make();
            myinteract = 4;
        }
        if (myinteract == 4 && global.choice != -1)
        {
            k_d(1);
            if (global.choice == 0)
            {
                other.con = 1;
                myinteract = 10;
            }
            if (global.choice == 1)
            {
                myinteract = 0;
                global.interact = 0;
            }
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 3)
    {
        endy = obj_mainchara.bbox_bottom - 80 - 57;
        snd_play(snd_knock);
    }
    if (timer == 15)
    {
        zap = scr_marker_ext(obj_mainchara.x - 30, cameray() - 200, spr_zapper_jump_noshadow, -2, 2, 0, 5);
        zap.gravity = 2;
        snd_play(snd_fall);
        scr_limitval_upper(zap, "y", endy);
        scr_depth(zap);
    }
    if (timer > 15)
    {
        if (zap.y >= endy)
        {
            con = -1;
            timer = 0;
            scr_delay_var("con", 2, 1);
        }
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        global.facing = 3;
        snd_play(snd_noise);
        zap.image_index = 6;
    }
    if (timer == 2)
        zap.image_index = 7;
    if (timer == 4)
        zap.image_index = 8;
    if (timer == 15)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* I'm here to assist youse./%", "obj_b3bs_rabbick_a_slash_Step_0_gml_89_0");
        d_make();
        con = 3;
        timer = 0;
    }
}
if (con == 3 && !d_ex())
{
    timer++;
    if (timer == 5)
    {
        change = instance_create(x, y, obj_tvturnoff_manager);
        change.kind = 1;
        change.roomtarg = 181;
        con++;
    }
}
