if (con < 0)
    exit;
if (con == 5 && !d_ex() && global.interact == 0)
{
    con = 6;
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Pet it", "obj_room_castle_tv_zone_2_slash_Step_0_gml_14_0");
    global.choicemsg[1] = stringsetloc("#Don't", "obj_room_castle_tv_zone_2_slash_Step_0_gml_15_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a very tall statue..^1. It has cat ears.)/", "obj_room_castle_tv_zone_2_slash_Step_0_gml_20_0");
    msgnext("\\C2 ");
    d_make();
}
if (con == 6 && global.choice != -1)
{
    con = 100;
    k_d(1);
    if (global.choice == 0)
    {
        con = 100;
        scr_speaker("no_name");
        msgsetloc(0, "* (..^1. Surprisingly^1, you can't reach!)/%", "obj_room_castle_tv_zone_2_slash_Step_0_gml_35_0");
        d_make();
    }
    if (global.choice == 1)
    {
        con = 100;
        if (!solo_mode)
        {
            var ra_text = stringsetloc("Yo--sh!", "obj_room_castle_tv_zone_2_slash_Step_0_gml_45_0");
            scr_smallface(0, "ralsei", 17, "right", "bottom", ra_text);
            scr_speaker("no_name");
            msgsetloc(0, "* (You pet Ralsei and Susie instead.)\\f0/%", "obj_room_castle_tv_zone_2_slash_Step_0_gml_49_0");
            d_make();
        }
    }
}
if (con == 100 && !d_ex())
{
    con = -1;
    global.interact = 0;
}
