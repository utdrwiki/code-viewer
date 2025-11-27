if (init == 0)
    init = 1;
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
            setxy(1640, 2840, kris);
            global.flag[1502] = 1;
            debug_print("global.flag[1502]=1");
            safe_delete(endarea);
        }
    }
}
var makerip = 0;
riptime++;
if ((riptime % 15) == 0)
    makerip = 1;
with (wafer)
{
    if (!talked)
    {
        if (makerip)
            scr_fancy_ripple((x + 40) - 8 - 8, y - 20 - 24, 60, 10810621, 70, 1, 5);
    }
    marker.image_index += 0.25;
    if (myinteract == 3)
    {
        playsnd = false;
        if (global.flag[1502] == 0)
        {
            global.flag[1502] = 1;
            safe_delete(other.endarea);
            playsnd = true;
        }
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Should be up there..^1. up North./%", "obj_dw_church_rippleworship_slash_Step_0_gml_61_0");
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
        if (playsnd)
        {
            playsnd = false;
            snd_play(snd_acquire_lancer, 1, 0.7);
        }
        myinteract = 0;
        global.interact = 0;
    }
}
if (con == 0)
{
    var trig = 0;
    with (obj_dw_church_glowtile)
    {
        if (pushonce)
        {
            if (pressed)
                trig = 1;
        }
    }
    if (trig)
    {
        global.flag[1502] = 2;
        event_user(0);
    }
}
for (var i = 0; i < array_length(organik); i++)
{
    with (organik[i])
    {
        if (myinteract == 3)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You hear whispering...)/%", "obj_dw_church_rippleworship_slash_Step_0_gml_115_0");
            if (global.flag[1502] >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Its expression is frozen in worship...)/%", "obj_dw_church_rippleworship_slash_Step_0_gml_120_0");
            }
            d_make();
            global.interact = 1;
            myinteract = 4;
        }
        if (myinteract == 4 && !d_ex())
        {
            myinteract = 0;
            global.interact = 0;
        }
    }
}
