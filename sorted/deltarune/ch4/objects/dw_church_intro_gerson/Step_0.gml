scr_populatechars();
if (!darkinit)
{
    darkness = instance_create(0, 0, obj_darkness_overlay);
    darkinit = 1;
}
if (gcon == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "gersontrig")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if ((gerson.bbox_left - 8) < (camerax() + 640) && gerson.bbox_bottom > cameray())
        gtime++;
    if (trig == 1 || gtime > 60)
    {
        global.flag[874] = 1;
        gerson.hspeed = 6;
        gerson.friction = -0.15;
        gerson.image_speed = 0.16666666666666666;
        scr_doom(gerson, 240);
        gcon = 1;
    }
}
with (npc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("follower");
        msgsetloc(0, "* The others here believe you will bring trouble to this place./", "obj_dw_church_intro_gerson_slash_Step_0_gml_64_0");
        msgnextloc("* They say^1, \"the knight with the blade casts a great shadow on the land...\"/", "obj_dw_church_intro_gerson_slash_Step_0_gml_65_0");
        msgnextloc("* I have no proof that's you. But don't be harsh to those that fight you./%", "obj_dw_church_intro_gerson_slash_Step_0_gml_66_0");
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract > 3 && d_ex())
    {
        var trig = 0;
        with (obj_writer)
        {
            if (halt)
                trig = 1;
        }
        if (!trig)
            marker.image_index += 0.25;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
with (tres)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (Huh...!? There's a hidden treasure chest here!)/", "obj_dw_church_intro_gerson_slash_Step_0_gml_101_0");
        msgnextloc("* (It contains..^1. some kind of strangely slippery gloves!)/", "obj_dw_church_intro_gerson_slash_Step_0_gml_102_0");
        msgnextloc("* (They're labeled^1, \"gloves that make you worse at climbing\".)/", "obj_dw_church_intro_gerson_slash_Step_0_gml_103_0");
        msgnextloc("* (...)/", "obj_dw_church_intro_gerson_slash_Step_0_gml_104_0");
        msgnextloc("* (You didn't take these.)/%", "obj_dw_church_intro_gerson_slash_Step_0_gml_105_0");
        if (global.flag[1617] == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You still didn't take the gloves.)/%", "obj_dw_church_intro_gerson_slash_Step_0_gml_110_0");
        }
        d_make();
        myinteract = 999;
        global.flag[1617] = 1;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("W")))
        setxy(1660, 800, 1049);
    if (keyboard_check_pressed(ord("E")))
        setxy(1760, 1080, 1049);
}
