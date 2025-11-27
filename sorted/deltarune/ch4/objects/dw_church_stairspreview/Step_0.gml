if (!init)
{
    with (obj_roomglow)
        create_highlight(other.npc2.marker, true, true, -16);
    init = 1;
}
var prophecyactive = scr_trigcheck("prop");
roomglow.active = prophecyactive;
prophecy.active = prophecyactive;
with (npc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* The Lightners' service has never gone on without me^1, ka-ka!/", "obj_dw_church_stairspreview_slash_Step_0_gml_26_0");
        msgnextloc("* I must be the most important of all^1, ka-ka!/%", "obj_dw_church_stairspreview_slash_Step_0_gml_27_0");
        if (global.plot < 225)
            global.flag[867] = 1;
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
        if (!i_ex(obj_writer))
            trig = 1;
        if (!trig)
            siner++;
        else
            siner = 0;
        marker.image_angle = lerp(marker.image_angle, sin(siner / 3) * 8, 0.5);
    }
    if (myinteract == 999 && !d_ex())
    {
        marker.image_angle = 0;
        siner = 0;
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
with (npc2)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* That guy is the fire extinguisher./%", "obj_dw_church_stairspreview_slash_Step_0_gml_78_0");
        if (talked)
            msgsetloc(0, "* Not that that's not important./%", "obj_dw_church_stairspreview_slash_Step_0_gml_81_0");
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
