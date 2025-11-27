scr_populatechars();
if (!init)
{
    with (obj_doorAny)
    {
        if (doorRoom == room_dw_churchb_bookshelf)
            other.door1 = id;
        if (doorRoom == room_dw_churchb_man)
            other.door2 = id;
        if (global.plot >= 242)
        {
            if (doorRoom == room_dw_churchb_rotatingtower)
                doorRoom = room_dw_churchc_angelprophecy_encounter;
            with (obj_hsv_shifter)
                instance_destroy();
        }
    }
    if (i_ex(door1) && i_ex(door2))
        init = 1;
}
if (con == 0)
{
    if (scr_trigcheck("leave"))
    {
        con = 1;
        global.flag[1573]++;
        var doortogo = door1;
        if (global.flag[1573] == 8)
            doortogo = door2;
        with (doortogo)
            setxy(obj_mainchara.x, obj_mainchara.bbox_top);
    }
}
for (var i = 0; i < array_length(npc); i++)
{
    with (npc[i])
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* What do you call a man with one eye?/%", "obj_dw_churchb_windows_slash_Step_0_gml_64_0");
            if (i == 1)
                msgsetloc(0, "* Why does the angel make its cry?/%", "obj_dw_churchb_windows_slash_Step_0_gml_65_0");
            if (i == 2)
                msgsetloc(0, "* Who will call the girl who snows?/%", "obj_dw_churchb_windows_slash_Step_0_gml_66_0");
            if (i == 3)
                msgsetloc(0, "* I don't know..^1. ha ha ha..^1. I don't know!/%", "obj_dw_churchb_windows_slash_Step_0_gml_67_0");
            d_make();
            myinteract = 999;
        }
        if (myinteract > 3 && d_ex())
        {
            var trig = 0;
            if (!i_ex(obj_writer))
                trig = 1;
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
}
with (moss)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Eat", "obj_dw_churchb_windows_slash_Step_0_gml_99_0");
        global.choicemsg[1] = stringsetloc("#Do Not", "obj_dw_churchb_windows_slash_Step_0_gml_100_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* (It's sacred moss.)/", "obj_dw_churchb_windows_slash_Step_0_gml_105_0");
        msgnextloc("* (Eat it?)/", "obj_dw_churchb_windows_slash_Step_0_gml_106_0");
        msgnext("\\C2 ");
        d_make();
        myinteract = 5;
    }
    if (myinteract == 5 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_12);
            snd_play(snd_moss_fanfare);
            scr_speaker("no_name");
            msgsetloc(0, "* (The moss was consumed with gusto!)/%", "obj_dw_churchb_windows_slash_Step_0_gml_120_0");
            d_make();
            global.flag[1592] = 1;
            myinteract = 999;
            setxy(room_width, room_height);
        }
        if (global.choice == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You left the moss for the next person. Pass it on...)/%", "obj_dw_churchb_windows_slash_Step_0_gml_130_0");
            d_make();
            myinteract = 999;
            global.flag[1592] = 2;
        }
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_12 = 12
}
