if (!colinit)
{
    var mycol = 16777215;
    if (color == "red")
        mycol = 3539199;
    if (color == "pink")
        mycol = 11703780;
    if (color == "green")
        mycol = 5632512;
    if (color == "blue")
        mycol = 15124796;
    image_blend = mycol;
    colinit = 1;
}
if (myinteract == 3)
{
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_church_warpflame_slash_Step_0_gml_22_0");
    global.choicemsg[1] = stringsetloc("#Do Not", "obj_dw_church_warpflame_slash_Step_0_gml_23_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("no_name");
    msgset(0, "* (invalid roomtarg...)/");
    if (roomtarg == 270)
    {
        msgsetloc(0, "* (A pink flame..^1. it glows hesitatingly.)/", "obj_dw_church_warpflame_slash_Step_0_gml_32_0");
        global.choicemsg[0] = stringsetloc("#Return to#beginning", "obj_dw_church_warpflame_slash_Step_0_gml_33_0");
    }
    if (roomtarg == 277)
    {
        if (instance_exists(obj_dw_churchc_prepretitan))
        {
            msgsetloc(0, "* (A red flame..^1. it glows hesitatingly.)/", "obj_dw_church_warpflame_slash_Step_0_gml_41_0");
            global.choicemsg[0] = stringsetloc("#Return to#save point", "obj_dw_church_warpflame_slash_Step_0_gml_42_0");
        }
        if (instance_exists(obj_dw_churchc_superprophecies))
        {
            msgsetloc(0, "* (A pink flame..^1. it glows hurriedly.)/", "obj_dw_church_warpflame_slash_Step_0_gml_48_0");
            global.choicemsg[0] = stringsetloc("#Return to#save point", "obj_dw_church_warpflame_slash_Step_0_gml_49_0");
        }
    }
    if (roomtarg == 280)
    {
        msgsetloc(0, "* (A red flame..^1. It glows with finality.)/", "obj_dw_church_warpflame_slash_Step_0_gml_55_0");
        global.choicemsg[0] = stringsetloc("#Go to#Fountain", "obj_dw_church_warpflame_slash_Step_0_gml_56_0");
    }
    if (roomtarg == 115)
    {
        msgsetloc(0, "* (A green flame..^1. It glows with knowledge.)/", "obj_dw_church_warpflame_slash_Step_0_gml_61_0");
        global.choicemsg[0] = stringsetloc("Go to#Old Man's#Study", "obj_dw_church_warpflame_slash_Step_0_gml_62_0");
    }
    if (roomtarg == 261)
    {
        msgsetloc(0, "* (A green flame..^1. It glows with anticipation.)/", "obj_dw_church_warpflame_slash_Step_0_gml_67_0");
        global.choicemsg[0] = stringsetloc("#Go to#Grand Door", "obj_dw_church_warpflame_slash_Step_0_gml_68_0");
    }
    if (color == "blue")
    {
        if (roomtarg == 181)
        {
            musfade = true;
            msgsetloc(0, "* (The Blue Flame flickers with the vision of a battle unfinished...)/", "obj_dw_church_warpflame_slash_Step_0_gml_76_0");
            global.choicemsg[0] = stringsetloc("#Return to Dark", "obj_dw_church_warpflame_slash_Step_0_gml_77_0");
        }
        if (roomtarg == 295)
        {
            musfade = true;
            msgsetloc(0, "* (The Blue Flame flickers with the vision of a battle unfinished...)/", "obj_dw_church_warpflame_slash_Step_0_gml_81_0");
            global.choicemsg[0] = stringsetloc("#Return to#Shadow", "obj_dw_church_warpflame_slash_Step_0_gml_82_0");
        }
    }
    msgnext("\\C2 ");
    d_make();
    myinteract = 5;
}
if (myinteract == 5 && global.choice != -1)
{
    if (global.choice == 0)
    {
        k_d();
        if (roomtarg == 181)
        {
        }
        if (roomtarg == 295)
            global.plot = 239.99;
        myinteract = 6;
    }
    if (global.choice == 1)
    {
        k_d();
        myinteract = 0;
        global.interact = 0;
    }
}
if (myinteract == 6 && !d_ex())
{
    var fadecol = merge_color(image_blend, c_white, 0.9);
    timer++;
    var fadetime = 24;
    if (timer == 1)
    {
        snd_play(snd_ghostappear);
        if (musfade)
            snd_volume(global.currentsong[1], 0, fadetime);
        fadeout = scr_marker_ext(camerax(), cameray(), spr_pxwhite, 640, 480, undefined, undefined, image_blend, -99, undefined, 0);
        with (fadeout)
        {
            scr_lerp_imageblend(id, image_blend, fadecol, fadetime, 4, "in");
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, round(fadetime * 0.75), 2, "out");
        }
    }
    if (timer == (1 + fadetime))
    {
        if (musfade)
        {
            snd_free(global.currentsong[0]);
            snd_stop_all();
        }
        global.facing = 0;
        with (instance_create(0, 0, obj_persistentfadein))
            image_blend = fadecol;
        global.interact = 3;
        global.entrance = entrance;
        room_goto(roomtarg);
    }
}
