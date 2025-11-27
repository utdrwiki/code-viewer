if (!init)
    init = true;
if (con < 0)
    exit;
if (con == 0 && global.interact == 0 && !d_ex() && obj_mainchara.x >= 960)
{
    con = -1;
    global.interact = 1;
    show_convo("ralsei");
}
if (con == 1 && !d_ex() && global.interact == 0)
{
    con = 100;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a statue.)/%", "obj_room_castle_tv_zone_1_slash_Step_0_gml_22_0");
    d_make();
}
if (con == 5)
{
    con = 100;
    global.interact = 1;
    global.flag[1689] = 1;
    scr_speaker("ralsei");
    msgsetloc(0, "\\E4* Umm..^1. a-are we supposed to be in here...?/", "obj_room_castle_tv_zone_1_slash_Step_0_gml_37_0");
    msgnextloc("\\E5* The door was locked.../", "obj_room_castle_tv_zone_1_slash_Step_0_gml_38_0");
    scr_anyface_next("susie", 10);
    msgnextloc("\\EA* What^1, aren't you curious who the hell Mike is?/", "obj_room_castle_tv_zone_1_slash_Step_0_gml_40_0");
    msgnextloc("\\EK* He sure got mentioned a hell of a lot.../", "obj_room_castle_tv_zone_1_slash_Step_0_gml_41_0");
    scr_anyface_next("ralsei", 22);
    msgnextloc("\\EM* M..^1. maybe just a peek...?/%", "obj_room_castle_tv_zone_1_slash_Step_0_gml_43_0");
    d_make();
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 11;
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Pet it", "obj_room_castle_tv_zone_1_slash_Step_0_gml_57_0");
    global.choicemsg[1] = stringsetloc("#Don't", "obj_room_castle_tv_zone_1_slash_Step_0_gml_58_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a statue..^1. It has cat ears.)/", "obj_room_castle_tv_zone_1_slash_Step_0_gml_63_0");
    msgnext("\\C2 ");
    d_make();
}
if (con == 11 && global.choice != -1)
{
    con = 100;
    k_d(1);
    if (global.choice == 0)
    {
        con = 15;
        global.flag[1690] = 1;
    }
    if (global.choice == 1)
    {
        con = 100;
        global.flag[1691] = 2;
        if (!solo_mode)
        {
            var su_text = stringsetloc("Hands off,\ndumbass!", "obj_room_castle_tv_zone_1_slash_Step_0_gml_88_0");
            scr_smallface(0, "susie", 5, "right", "bottom", su_text);
            scr_speaker("no_name");
            msgsetloc(0, "* (You pet Ralsei and Susie instead.)\\f0/%", "obj_room_castle_tv_zone_1_slash_Step_0_gml_92_0");
            d_make();
        }
    }
}
if (con == 15)
{
    con = 16;
    alarm[0] = 30;
    with (statue_cat)
    {
        act = 1;
        meow = snd_play(snd_meow);
        sound_pitch(meow, random_range(0.5, 1.5));
        image_index = 1;
    }
}
if (con == 17)
{
    con = 100;
    remove_cat();
}
if (con == 100 && !d_ex())
{
    con = -1;
    if (global.flag[1689] == 0 && !solo_mode)
        con = 0;
    global.interact = 0;
}
