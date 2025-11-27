depth = 5000;
if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("0")))
        room_goto(room_dw_churchb_moneyfountain);
}
if (!init)
{
    var _pos = scr_assetloc("DEBUG_ASSETS", "dspr_room_dw_church_moneyfountain_shine");
    shine = scr_marker_ext(_pos[0], _pos[1], spr_shine_white, 2, 2, 0.0625, undefined, undefined, undefined, 1);
    shine.siner = 0;
    if (global.flag[898] > 0 || global.plot >= 242)
        safe_delete(shine);
    _pos = scr_assetloc("DEBUG_ASSETS", "dspr_room_dw_church_moneyfountain_fountainpos");
    setxy(_pos[0], _pos[1], fountain);
    init = 1;
}
if (changedoor == 1)
{
    with (obj_doorAny)
    {
        if (init)
        {
            if (doorRoom == room_dw_church_waterfallroom)
            {
                doorRoom = room_dw_church_waterfalltearoom;
                other.changedoor = 2;
                debug_print("changed door");
            }
        }
    }
}
with (wafernpc)
{
    scr_size(3.9, 8);
    setxy((marker.xstart + markerxoffset) - 4, marker.ystart + markeryoffset);
    if (global.flag[1787] == 1)
    {
        if (global.plot > 240)
            x = room_width * 2;
    }
    if (myinteract == 3)
    {
        global.interact = 1;
        myinteract = 4;
        scr_speaker("no_name");
        msgsetloc(0, "* (It's some sort of statue.)/%", "obj_dw_church_moneyfountain_slash_Step_0_gml_66_0");
        if (global.plot >= 242)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* We are not accepting further donations at this time./", "obj_dw_church_moneyfountain_slash_Step_0_gml_71_0");
            msgnextloc("* Take our money^1, steal from us^1, beat us down!/%", "obj_dw_church_moneyfountain_slash_Step_0_gml_72_0");
        }
        d_make();
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
    if (myinteract == 4 && !d_ex())
    {
        marker.image_index = 0;
        global.interact = 0;
        myinteract = 0;
    }
}
with (fountain)
{
    if (myinteract == 3)
    {
        safe_delete(other.shine);
        mymony = global.gold;
        newmony = 0;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_church_moneyfountain_slash_Step_0_gml_110_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_church_moneyfountain_slash_Step_0_gml_111_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a pool..^1. throw money in?)/", "obj_dw_church_moneyfountain_slash_Step_0_gml_115_0");
        if (global.flag[898] > 0)
            msgsetsubloc(0, "* (There's $~1 in the fountain. Throw in more?)/", string(global.flag[898]), "obj_dw_church_moneyfountain_slash_Step_0_gml_119_0");
        msgnext("\\C2 ");
        myinteract = 4;
        if (global.plot >= 242)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The water glitters vacantly.)/%", "obj_dw_church_moneyfountain_slash_Step_0_gml_129_0");
            myinteract = 999;
        }
        d_make();
    }
    if (myinteract == 4 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            if (global.gold > 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (How much will you throw in?)", "obj_dw_church_moneyfountain_slash_Step_0_gml_144_0");
                d_make();
                myinteract = 5;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You don't have any money.)/%", "obj_dw_church_moneyfountain_slash_Step_0_gml_151_0");
                d_make();
                myinteract = 999;
            }
        }
        else
        {
            myinteract = 0;
            global.interact = 0;
        }
    }
    if (myinteract == 5)
    {
        var trig = 0;
        with (obj_writer)
        {
            if (pos >= length)
                trig = 1;
        }
        if (trig)
        {
            var remside = obj_dialoguer.side;
            numentry = instance_create(x, y, obj_numberentry);
            numentry.side = remside;
            numentry.maxnum = global.gold;
            numentry.biginc = 25;
            numentry.drawbox = false;
            numentry.yoff = -2;
            numentry.cancelbuffer = 10;
            myinteract = 6;
            numentry.showmoney = true;
            numentry.numinc = 10;
            numentry.biginc = 50;
        }
    }
    if (myinteract == 6)
    {
        if (numentry.result == -2 || numentry.result == 0)
        {
            k_d();
            myinteract = 0;
            global.interact = 0;
            safe_delete(numentry);
        }
        else if (numentry.result > 0)
        {
            k_d(1);
            newmony = numentry.result;
            myinteract = 7;
            safe_delete(numentry);
        }
    }
    if (myinteract == 7)
    {
        if (global.flag[898] == 0)
        {
            with (other.jokenpc)
                setxy(marker.xstart + markerxoffset, marker.ystart + markeryoffset);
        }
        global.flag[898] = newmony + global.flag[898];
        global.gold -= newmony;
        var _stay = 0;
        if (global.flag[898] >= 100 && global.flag[1500] == 0)
        {
            myinteract = 10;
            global.flag[1500] = 1;
            _stay = 2;
        }
        else
        {
            myinteract = 999;
        }
        scr_speaker("no_name");
        var monystring = stringsetloc("Dark Dollar", "obj_dw_church_moneyfountain_slash_Step_0_gml_230_0");
        if (newmony > 1)
            monystring = stringsetloc("Dark Dollars", "obj_dw_church_moneyfountain_slash_Step_0_gml_231_0");
        msgsetsubloc(0, "* (You threw ~1 ~2 into the fountain. The Fountain now holds $~3.)/%", string(newmony), monystring, string(global.flag[898]), "obj_dw_church_moneyfountain_slash_Step_0_gml_232_0");
        with (d_make())
            stay = _stay;
        snd_play_delay(snd_equip, 8);
        newmony = 0;
    }
    if (myinteract == 10 && !d_ex())
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (...? The money you threw split the stream of the waterfall!)/%", "obj_dw_church_moneyfountain_slash_Step_0_gml_243_0");
        d_make();
        myinteract = 10.1;
    }
    if (myinteract == 10.1 && !d_ex())
    {
        with (obj_dw_church_waterfall)
            dosep = 1;
        myinteract = 11;
    }
    if (myinteract == 11)
    {
        dosep = 0;
        myinteract = 999;
    }
    if (myinteract == 999 && !d_ex())
    {
        global.interact = 0;
        myinteract = 0;
    }
}
with (jokenpc)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Kinda weird that you'd throw dollars into a fountain. Didn't have any change?/%", "obj_dw_church_moneyfountain_slash_Step_0_gml_277_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* You..^1. don't happen to have any change^1, do you?/%", "obj_dw_church_moneyfountain_slash_Step_0_gml_282_0");
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (plack)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* When you \\cApass to the other side^1, a great donation\\cW will show your remembrance./%", "obj_dw_church_moneyfountain_slash_Step_0_gml_309_0");
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
