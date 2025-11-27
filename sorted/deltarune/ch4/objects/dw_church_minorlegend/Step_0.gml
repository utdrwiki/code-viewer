var prophecyactive = 0;
with (obj_triggervolume)
{
    if (place_meeting(x, y, obj_mainchara))
        prophecyactive = 1;
}
if (!init)
{
    var loadmeinpops = npc.marker;
    with (obj_roomglow)
    {
        create_highlight(loadmeinpops, true, true);
        create_highlight(obj_treasure_room, true, true);
    }
    with (obj_floorshadow)
    {
        if (target == other.npc.marker)
            yoff = -18;
    }
    init = 1;
}
roomglow.active = prophecyactive;
prophecy.active = prophecyactive;
with (npc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Come five o'clock^1, the shadow will grow./", "obj_dw_church_minorlegend_slash_Step_0_gml_46_0");
        msgnextloc("* ..^1. So sayeth our ancestors./%", "obj_dw_church_minorlegend_slash_Step_0_gml_47_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* The truth is written in glass./%", "obj_dw_church_minorlegend_slash_Step_0_gml_51_0");
        }
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
