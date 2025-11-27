scr_populatechars();
if (!init)
{
    if (global.flag[891] == 1)
    {
        with (obj_church_piano_hint)
        {
            alpha = 1;
            active = 1;
            scr_depth();
            depth -= 100;
        }
    }
    init = 1;
}
if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
    {
        global.flag[891] = 0;
        var loc = scr_heromarker("kris", "debugwarp");
        if (i_ex(loc[2]))
        {
            scr_populatechars();
            setxy(loc[0], loc[1], kris);
            setxy(loc[0], loc[1], susie);
            setxy(loc[0], loc[1], ralsei);
            scr_caterpillar_interpolate("all");
        }
    }
}
if (cutscene == 0)
{
    with (obj_floorswitch)
    {
        if (extflag == "1315" && pressed)
        {
            other.cutscene = 1;
            other.timer = 0;
            global.interact = 1;
        }
    }
}
if (cutscene == 1)
{
    timer++;
    if (timer >= 15)
    {
        global.flag[850] = 1;
        obj_ch4_DCA08A.con = 1;
        cutscene = 3;
        timer = 0;
    }
}
if (trcon == 0)
{
    var trig = 0;
    with (obj_treasure_room)
    {
        if (myinteract == 3)
            trig = 1;
    }
    if (trig == 1)
    {
        scr_shakescreen();
        safe_delete(solidblock);
        layer_set_visible("Tiles_addedwalkway", 1);
        layer_set_visible("tiles_hiddenpole", 1);
        with (instance_create(hiddenlightx, hiddenlighty, obj_lantern_shrinking))
        {
            r_littlesize = 64;
            r_bigsize = 240;
            r_maxtimer = 80;
            r_timebuffer = 0;
            extflag = "light";
            nointeract = true;
        }
        with (instance_create(hiddentilex, hiddentiley, obj_dw_church_glowtile))
            extflag = "light";
        trcon = 999;
    }
}
if (warpcon == 0)
{
    var trig = 0;
    with (obj_floorswitch)
    {
        if (extflag == "end")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        global.interact = 1;
        global.tempflag[50] = kris.x;
        global.tempflag[51] = kris.y;
        global.tempflag[52] = susie.x;
        global.tempflag[53] = susie.y;
        global.tempflag[54] = ralsei.x;
        global.tempflag[55] = ralsei.y;
        global.tempflag[56] = 1;
        debug_message("krxy=" + string(global.tempflag[50]) + "|" + string(global.tempflag[51]));
        for (var i = 0; i < 8; i++)
            debug_message("global.tempflag[" + string(50 + i) + "]=" + string(global.tempflag[50 + i]));
        room_goto(room_dw_church_pianopiece_left_b);
    }
}
if (global.interact == 0)
{
    with (obj_trigger)
    {
        if (extflag == "nomenu")
        {
            if (place_meeting(x, y, obj_mainchara))
            {
                with (obj_darkcontroller)
                    charcon = 0;
            }
        }
    }
}
