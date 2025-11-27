var bellsnd = 0;
var tspawn = 0;
if (!init)
{
    with (obj_trigger_interact)
    {
        if (extflag == "bell")
        {
            other.bellint = id;
            issolid = true;
            timer = 0;
            talked = 0;
        }
    }
    init = 1;
}
if (scr_debug())
{
    if ((keyboard_check(ord("W")) && keyboard_check_pressed(ord("1"))) || global.tempflag[90] == 1)
    {
        global.tempflag[90] = 0;
        var debugwarp = scr_heromarker("kr", "debugwarp1");
        if (i_ex(debugwarp[2]))
        {
            setxy(debugwarp[0], debugwarp[1], 1049);
            snd_free_all();
            con = 0;
            global.interact = 0;
        }
    }
    if ((keyboard_check(ord("W")) && keyboard_check_pressed(ord("2"))) || global.tempflag[90] == 2)
    {
        global.tempflag[90] = 0;
        var debugwarp = scr_heromarker("kr", "debugwarp");
        if (i_ex(debugwarp[2]))
        {
            setxy(debugwarp[0], debugwarp[1], 1049);
            snd_free_all();
            con = 5;
        }
    }
}
with (bellint)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        if (!talked)
        {
            myinteract = 3.001;
            scr_delay_var("myinteract", 4, 30);
        }
        else
        {
            myinteract = 4;
        }
        talked++;
    }
    if (myinteract == 4)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_church_waterfallroom_slash_Step_0_gml_81_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_church_waterfallroom_slash_Step_0_gml_82_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a wall made of bells. Climb it?)/", "obj_dw_church_waterfallroom_slash_Step_0_gml_87_0");
        msgnextloc("\\C2", "obj_dw_church_waterfallroom_slash_Step_0_gml_88_0");
        d_make();
        myinteract = 5;
    }
    if (myinteract == 5 && global.choice != -1)
    {
        if (global.choice == 0)
        {
            k_d(1);
            if (global.flag[23] == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* It's too slippery to climb..^1. If only you had something to help you climb./%", "obj_dw_church_waterfallroom_slash_Step_0_gml_101_0");
                d_make();
                myinteract = 999;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You climbed the wall of bells...)/%", "obj_dw_church_waterfallroom_slash_Step_0_gml_108_0");
                d_make();
                myinteract = 10;
                sndplay = 0;
            }
        }
        if (global.choice == 1)
        {
            k_d();
            global.interact = 0;
            myinteract = 0;
        }
    }
    if (myinteract == 10 && d_ex())
    {
        var trig = 0;
        if (!sndplay)
        {
            with (obj_writer)
            {
                if (halt)
                    trig = 1;
            }
            if (trig == 1)
            {
                bellsnd = 1;
                sndplay = 1;
            }
        }
    }
    if (myinteract == 10 && !d_ex())
    {
        myinteract = 11;
        scr_delay_var("myinteract", 12, 30);
    }
    if (myinteract == 12)
    {
        other.domove = 1;
        myinteract = 0;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
if (domove == 1)
{
    var krmove = scr_heromarker("kr", "climbed");
    var sumove = scr_heromarker("su", "climbed");
    var ramove = scr_heromarker("ra", "climbed");
    setxy(krmove[0], krmove[1], kris);
    setxy(sumove[0], sumove[1], susie);
    setxy(ramove[0], ramove[1], ralsei);
    scr_caterpillar_interpolate("all");
    if (!up_h() && !down_h() && !right_h() && !left_h())
        scr_fancy_ripple(obj_mainchara.x + 18, obj_mainchara.y + 72, 60, undefined, 192, 1, 15);
    domove = 2;
    global.interact = 0;
}
if (con == 0 && global.interact == 0)
{
    var trig = 0;
    with (obj_dw_church_glowtile)
    {
        if (extflag == "endswitch")
        {
            if (pressed)
            {
                trig = 1;
                instance_destroy();
            }
        }
    }
    if (trig)
    {
        global.interact = 1;
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        with (obj_church_piano_hint)
        {
            dotrig = true;
            mus_fade(global.currentsong[1], 60);
        }
    }
    if (timer > 15)
    {
        timer = 0;
        scr_speaker("susie");
        msgsetloc(0, "\\E7* Hey^1, we finally got to the end of this stupid room!/", "obj_dw_church_waterfallroom_slash_Step_0_gml_217_0");
        msgnextloc("\\EG* ..^1. huh?/%", "obj_dw_church_waterfallroom_slash_Step_0_gml_218_0");
        d_make();
        con = 2;
    }
}
if (con == 2 && d_ex())
{
    if (i_ex(obj_writer))
    {
        if (scr_getmsgno() >= 1)
        {
            tspawn = 2;
            con = 3;
        }
    }
}
if (con == 3 && !d_ex())
{
    con = 4;
    timer = 0;
}
if (con == 4)
{
    timer++;
    if (timer == 5)
        tspawn = 1;
    if (timer == 30)
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\EZ* Something..^1. Something's coming.../", "obj_dw_church_waterfallroom_slash_Step_0_gml_258_0");
        msgnextloc("\\EY* Run!!!!/%", "obj_dw_church_waterfallroom_slash_Step_0_gml_259_0");
        d_make();
        timer = 0;
        con = 5;
    }
}
if (con == 5 && !d_ex())
{
    instance_create(camerax() + 640 + 120, cameray() - 120, obj_dw_church_waterfallchaser);
    with (obj_dw_church_glowtile)
    {
        if (extflag != "endswitch")
            instance_destroy();
    }
    global.flag[7] = 1;
    mus_play_ext("creepychase.ogg", 1, 0.72, 0.8);
    global.interact = 0;
    con = 6;
}
if (con == 6)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "endseq")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        global.flag[7] = 0;
        with (obj_darkcontroller)
            charcon = 0;
        with (obj_dw_church_waterfallchaser)
            instance_destroy();
        mus_fade(global.currentsong[1], 60);
        global.interact = 1;
        scr_speaker("gerson");
        msgsetloc(0, "* Hey..^1. Wait a gosh darn minute.../%", "obj_dw_church_waterfallroom_slash_Step_0_gml_293_0");
        d_make(undefined, undefined, undefined, 1);
        con = 10;
        timer = 0;
    }
}
if (con == 10 && !d_ex())
{
    timer++;
    if (timer == 14)
    {
        with (obj_border_controller)
            show_border(1);
    }
    if (timer == 15)
    {
        snd_play(snd_noise);
        var xoff = 0;
        var yoff = 0;
        with (obj_trigger)
        {
            if (extflag == "endseq")
            {
                xoff = x;
                yoff = y;
            }
        }
        global.tempflag[50] = kris.x - xoff;
        global.tempflag[51] = kris.y - yoff;
        global.tempflag[52] = susie.x - xoff;
        global.tempflag[53] = susie.y - yoff;
        global.tempflag[54] = ralsei.x - xoff;
        global.tempflag[55] = ralsei.y - yoff;
        debug_message("krxy=" + string(global.tempflag[50]) + "|" + string(global.tempflag[51]));
        for (var i = 0; i < 8; i++)
            debug_message("global.tempflag[" + string(50 + i) + "]=" + string(global.tempflag[50 + i]));
        debug_message();
        room_goto(room_dw_church_waterfalltearoom);
    }
}
if (keyboard_check_pressed(ord("B")) && scr_debug())
    tspawn = 2;
if (tspawn == 2)
{
    if (!button3_h())
    {
        snd_play(snd_tspawn, 0.5);
        snd_play_delay(snd_tspawn, 2, 0.2, 0.8);
        snd_play_delay(snd_tspawn, 4, 0.1, 0.6);
    }
    var target = 1049;
    var _hhsp = lengthdir_x(2, direction == point_direction(x, y, target.x + 40, target.y + 60));
    var _vvsp = lengthdir_y(2, direction == point_direction(x, y, target.x + 40, target.y + 60));
    scr_fancy_ripple_alt(camerax() + 640 + 40, cameray() - 40, 60, 255, 300, 1, 12, target.depth, _hhsp, _vvsp, 0);
}
if (tspawn == 1)
{
    snd_play(snd_tspawn, 1);
    snd_play_delay(snd_tspawn, 2, 0.5, 0.8);
    snd_play_delay(snd_tspawn, 4, 0.3, 0.6);
    snd_play_delay(snd_tspawn, 6, 0.1, 0.4);
    var target = 1049;
    var _hhsp = lengthdir_x(2, direction == point_direction(x, y, target.x + 40, target.y + 60));
    var _vvsp = lengthdir_y(2, direction == point_direction(x, y, target.x + 40, target.y + 60));
    scr_fancy_ripple_alt(camerax() + 640 + 40, cameray() - 40, 255, 30, 360, 1, 12, target.depth, _hhsp, _vvsp, 0);
}
if (bellsnd)
{
    var count = 0;
    var delay = 10;
    bellsnd = 136;
    snd_play(bellsnd);
    count++;
    snd_play_delay(bellsnd, delay * count, 0.7 - (count / 8), 1.17 - (count / 40));
    count++;
    snd_play_delay(bellsnd, delay * count, 0.7 - (count / 8), 0.97 - (count / 40));
    count++;
    snd_play_delay(bellsnd, delay * count, 0.7 - (count / 8), 1.17 - (count / 40));
    count++;
    snd_play_delay(bellsnd, delay * count, 0.7 - (count / 8), 0.97 - (count / 40));
    count++;
    snd_play_delay(bellsnd, delay * count, 0.7 - (count / 8), 1.17 - (count / 40));
    count++;
    snd_play_delay(bellsnd, delay * count, 0.7 - (count / 8), 0.97 - (count / 40));
    count++;
}
if (global.plot >= 242)
{
    with (blocker)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* (Something long and stringy is blocking the way.)/%", "obj_dw_church_waterfallroom_slash_Step_0_gml_418_0");
            d_make();
            myinteract = 999;
        }
        if (myinteract == 999 && !d_ex())
        {
            myinteract = 0;
            global.interact = 0;
        }
    }
}
