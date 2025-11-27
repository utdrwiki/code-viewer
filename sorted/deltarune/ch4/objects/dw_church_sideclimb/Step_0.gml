siner++;
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("2")))
        {
            var pos = scr_heromarker("kr", "debugwarp2");
            setxy(pos[0], pos[1], 1049);
            with (obj_caterpillarchara)
                setxy(pos[0], pos[1]);
            scr_caterpillar_interpolate("all");
            global.flag[1524] = 999;
            global.flag[1525] = 999;
            event_user(1);
        }
    }
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("3")))
        {
            var pos = scr_heromarker("kr", "debugwarp3");
            setxy(pos[0], pos[1], 1049);
            with (obj_caterpillarchara)
                setxy(pos[0], pos[1]);
            scr_caterpillar_interpolate("all");
            global.flag[1524] = 999;
            global.flag[1525] = 999;
            event_user(1);
            defendercon = 6;
        }
    }
}
var time1 = 300;
var time2 = 415;
if (init == 0)
{
    for (var i = 0; i < array_length(stufftomove); i++)
    {
        with (all)
        {
            if (object_index == other.stufftomove[i])
            {
                var domove = true;
                if (variable_instance_exists(id, "dontmove"))
                {
                    if (dontmove)
                        domove = false;
                }
                if (domove)
                    x += (room_width * 4);
            }
        }
    }
    init = 1;
}
var playswitchsnd = false;
if (con == 0)
{
    var trig = 0;
    if (i_ex(obj_climb_kris) && obj_climb_kris.fallingcon == 0)
    {
        with (obj_trigger)
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                if (extflag == "starttrig")
                    trig = 1;
                if (extflag == "starttrig2")
                    trig = 2;
            }
        }
    }
    if (trig)
    {
        for (var i = 0; i < array_length(stufftomove); i++)
        {
            with (all)
            {
                if (object_index == other.stufftomove[i])
                    x = xstart;
            }
        }
        if (trig == 1)
        {
            playswitchsnd = true;
            timber = time1;
            canceltimer = 0;
        }
        if (trig == 2)
        {
            playswitchsnd = true;
            timber = time2;
            canceltimer = 0;
        }
        with (obj_lerpvar)
        {
            if (variable_instance_exists(id, "fadeout"))
                instance_destroy();
        }
        with (obj_dw_church_sideclimb_glowclimb)
            scr_lerpvar("image_alpha", 0, 1, 5 + irandom(5), 2, "out");
        var snd = snd_play_complex(0, 0, -1);
        snd_add_complex(snd, 0, 410, 1.4, 0.7, 0, -1, 0);
        snd_add_complex(snd, 1, 410, 1.6, 0.7, 0, -1, 0);
        canceltimer = 0;
        con = 1;
    }
}
wallswitch[0].image_index = 0;
wallswitch[1].image_index = 0;
if (con == 1)
{
    wallswitch[0].image_index = 1;
    wallswitch[1].image_index = 1;
    timber--;
    if (global.flag[1524] != 0 && global.flag[1525] != 0)
    {
        if (!instance_exists(obj_tutorial_text))
            instance_create(0, 0, obj_tutorial_text);
        if (button2_h())
            canceltimer++;
        else
            canceltimer = 0;
        if (scr_trigcheck_ext("nohud", 27))
            canceltimer = 0;
        if (canceltimer == 30 || !instance_exists(obj_climb_kris))
            timber = 0;
    }
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "starttrig" || extflag == "starttrig2")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                if (extflag == "starttrig")
                    trig = 1;
                if (extflag == "starttrig2")
                    trig = 2;
            }
        }
    }
    if (trig == 1)
    {
        if (timber < (time1 - 1))
            playswitchsnd = true;
        timber = time1;
    }
    if (trig == 2)
    {
        if (timber < (time2 - 1))
            playswitchsnd = true;
        timber = time2;
    }
    with (obj_trigger)
    {
        if (extflag == "r1end")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                var newtime = time1 - other.timber;
                debug_print("climb 1  Time Taken = " + string(newtime));
                var writetime = false;
                if (global.flag[1524] == 0)
                {
                    writetime = true;
                    with (other)
                        event_user(1);
                }
                if (!writetime)
                {
                    if (global.flag[1524] > newtime)
                        writetime = true;
                }
                if (writetime == true)
                {
                    debug_print("climb 1 new highscore: " + string(newtime));
                    snd_play(snd_won);
                    global.flag[1524] = newtime;
                }
                other.timber = 0;
                other.forcefall = 1;
            }
        }
        if (extflag == "r2end")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                var newtime = time2 - other.timber;
                debug_print("climb 2 Time Taken = " + string(newtime));
                var writetime = false;
                if (global.flag[1525] == 0)
                    writetime = true;
                if (!writetime)
                {
                    if (global.flag[1525] > newtime)
                        writetime = true;
                }
                if (writetime == true)
                {
                    debug_print("climb 2 new highscore: " + string(newtime));
                    snd_play(snd_won);
                    global.flag[1525] = newtime;
                }
                other.timber = 0;
                other.forcefall = 1;
            }
        }
    }
    var tickrate = 10;
    if (timber < 320)
        tickrate = 8;
    if (timber < 160)
        tickrate = 6;
    if (timber < 80)
        tickrate = 4;
    if (timber < 40)
        tickrate = 2;
    if (timber < 15)
        tickrate = 1;
    if (((timber - 1) % tickrate) == 0)
    {
        tickcount++;
        var pitch = 0.75;
        if ((tickcount % 2) == 0)
            pitch = 1;
        snd_play(snd_menumove, 0.7, pitch);
    }
    if (timber <= 0)
    {
        con = 2;
        var snd = snd_play_complex(0, 0, -1);
        snd_add_complex(snd, 0, 410, 0.9, 0.7, 0, -1, 0);
        snd_add_complex(snd, 1, 410, 1.3, 0.7, 0, -1, 0);
        var dofall = false;
        with (obj_climb_kris)
        {
            var climber = instance_place(x, y, obj_climb_climbable);
            if (!i_ex(climber))
                dofall = true;
            else if (climber.dontmove == false)
                dofall = true;
        }
        with (obj_dw_church_sideclimb_glowclimb)
        {
            with (scr_lerpvar("image_alpha", 1, 0, 30 + irandom(30), -1, "out"))
                fadeout = true;
        }
        if (dofall)
            forcefall = 1;
    }
}
if (playswitchsnd == true)
{
    var snd = snd_play_complex(0, 0, -1);
    snd_add_complex(snd, 0, 267, 0.85, 1, 0, -1, 0);
    snd_add_complex(snd, 1, 336, 1.3, 1, 0, -1, 0);
}
if (con == 2)
{
    var trig = 0;
    with (obj_climb_kris)
    {
        if (climbcon == 0)
            trig = 1;
    }
    if (!i_ex(obj_climb_kris))
        trig = 1;
    if (trig)
    {
        init = 0;
        with (obj_climb_kris)
        {
            if (fallingcon == 0)
            {
                if (other.forcefall == 1)
                {
                    other.forcefall = 0;
                    neutralcon = 999;
                    fallingcon = 1;
                    fallingtimer = 99999;
                    jumpchargecon = 0;
                    jumpchargeamount = 0;
                    jumpchargetimer = 0;
                    snd_stop(snd_chargeshot_charge);
                    jumping = 0;
                    climbcon = 0;
                    neutralcon = 0;
                    slipcon = 0;
                    image_blend = c_white;
                }
            }
        }
        con = 0;
    }
}
if (defendercon == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "defender1" && place_meeting(x, y, obj_mainchara))
            trig = 1;
    }
    if (trig == 1)
    {
        global.interact = 1;
        global.facing = 1;
        defendercon = 1;
        gentimer = 0;
    }
}
if (defendercon == 1)
{
    gentimer++;
    if (gentimer == 1)
    {
        defender1 = scr_marker_ext(camerax() + 640 + 40, 446, spr_npc_cup_walk, -2, 2, 0.2);
        var targtime;
        with (defender1)
        {
            targtime = round((((x - camerax()) + 640) - 120) / 30);
            scr_lerpvar("x", x, (camerax() + 640) - 120, targtime);
            scr_delay_var("image_speed", 0, targtime + 1);
            with (other)
                scr_delay_var("defendercon", 2, targtime + 1);
            scr_depth();
        }
        mus_volume(global.currentsong[1], 0, targtime + 1);
    }
}
if (defendercon == 2)
{
    scr_speaker("no_name");
    msgsetloc(0, "* You dare awaken m'lady from her peaceful slumber...!?/", "obj_dw_church_sideclimb_slash_Step_0_gml_359_0");
    msgnextloc("* If you shall press further..^1. then we shall have no choice...//", "obj_dw_church_sideclimb_slash_Step_0_gml_360_0");
    msgnextloc("* ..^1. but to duel for her honor!/", "obj_dw_church_sideclimb_slash_Step_0_gml_361_0");
    msgnextloc("* En-guarde!/%", "obj_dw_church_sideclimb_slash_Step_0_gml_362_0");
    d_make();
    global.flag[1526] = 1;
    defendercon++;
}
if (defendercon == 3 && !d_ex())
{
    global.interact = 0;
    defender1.hspeed = -4;
    defender1.image_speed = 0.25;
    defendercon = 4;
    snd_free_all();
    global.currentsong[0] = snd_songpreview_knockdown;
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 0.5);
}
if (defendercon == 4)
{
    var docontinue = false;
    with (defender1)
    {
        if (place_meeting(x + 14, y, obj_mainchara))
        {
            with (scr_marker_ext(x, y, sprite_index, -2, 2, 0, undefined, undefined, undefined, 1))
            {
                hspeed = 12;
                gravity = 1;
                vspeed = -8 - random(8);
                scr_lerpvar("image_alpha", image_alpha, 0, 30, 2, "in");
                scr_doom(id, 30);
                snd_play(snd_smallcar_yelp, 0.75, 0.6);
            }
            docontinue = true;
            instance_destroy();
        }
    }
    if (docontinue == true)
    {
        defendercon = 4.9;
        snd_volume(global.currentsong[1], 0, 45);
    }
}
if (defendercon == 4.9)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "startmusicbackup")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        snd_free_all();
        global.currentsong[0] = snd_init(music);
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
        snd_volume(global.currentsong[1], 0, 0);
        snd_volume(global.currentsong[1], 0.7, 40);
        defendercon = 5;
    }
}
if (defendercon == 5)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "defender2" && place_meeting(x, y, obj_mainchara))
            trig = 1;
    }
    if (trig)
    {
        snd_volume(global.currentsong[1], 0, 15);
        scr_speaker("no_name");
        msgsetloc(0, "* Our lady...!!!/%", "obj_dw_church_sideclimb_slash_Step_0_gml_437_0");
        d_make();
        defendercon = 5.5;
        global.interact = 1;
    }
}
if (defendercon == 5.5 && !d_ex())
{
    snd_free_all();
    global.currentsong[0] = snd_songpreview_knockdown;
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 0.6);
    global.interact = 0;
    defendercon = 6;
    gentimer = 3;
}
if (defendercon == 6)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "defender3" && place_meeting(x, y, obj_mainchara))
        {
            trig = 2;
            debug_print("hi");
        }
        if (trig == 0)
        {
            if (extflag == "defender2" && place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        gentimer++;
        if ((gentimer % 2) == 0 && choose(0, 1) == 1)
        {
            var xloc = 0;
            var xwid = 0;
            with (obj_trigger)
            {
                if (extflag == "defender2")
                {
                    xloc = x;
                    xwid = sprite_width;
                }
            }
            var spawnx = clamp((camerax() - 20) + random(60), xloc, xloc + xwid) + scr_even(random_range(-80, 30));
            instance_create(spawnx, y, obj_dw_church_bravewarrior);
        }
    }
    if (trig == 2)
    {
        debug_print("hi");
        defendercon = 7;
        global.interact = 1;
        gentimer = 0;
        global.facing = 3;
    }
}
if (defendercon < 7)
{
    with (mizzle)
        y = scr_even(ystart + (sin(other.siner / 15) * 8));
}
if (defendercon == 7)
{
    with (mizzle)
        y = lerp(y, ystart, 0.125);
    global.interact = 1;
    obj_mainchara.cutscene = 1;
    camx = camerax();
    camy = cameray();
    camcontrol = true;
    scr_lerpvar("camx", camx, 1080, 30);
    var trig = 0;
    defendercon = 7.01;
    scr_delay_var("defendercon", 7.05, 30);
    mus_volume(global.currentsong[1], 0, 30);
    failsafetime = 0;
}
if (defendercon == 7.05)
{
    var trig;
    with (obj_dw_church_bravewarrior)
    {
        if (con != 99)
            trig = 1;
    }
    failsafetime++;
    if (failsafetime >= 5)
    {
        trig = 0;
        with (obj_dw_church_bravewarrior)
        {
            if (con != 99)
                instance_destroy();
        }
    }
    if (trig == 0)
    {
        defendercon = 7.1;
        gentimer = 0;
    }
}
if (defendercon == 7.1)
{
    gentimer++;
    if (gentimer == 1)
    {
        with (obj_dw_church_bravewarrior)
        {
            image_xscale = -2;
            x += 58;
            x = scr_even(x);
            y = scr_even(y);
        }
    }
    if (gentimer == 10)
    {
        snd_play(snd_wing);
        mizzle.sprite_index = spr_holywater_alarm;
        scr_shakeobj(mizzle);
        with (obj_dw_church_bravewarrior)
        {
        }
    }
    if (gentimer == 15)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Water you guys doing? You woke me up!/%", "obj_dw_church_sideclimb_slash_Step_0_gml_564_0");
        d_make();
        defendercon = 8;
        gentimer = 0;
    }
}
if (defendercon == 8 && !d_ex())
{
    gentimer++;
    if (gentimer == 4)
    {
        snd_play(snd_wing, undefined, 1.2);
        with (obj_dw_church_bravewarrior)
            scr_shakeobj();
    }
    if (gentimer == 15)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Well^1, we.../%", "obj_dw_church_sideclimb_slash_Step_0_gml_585_0");
        d_make(undefined, undefined, 2);
        defendercon = 9;
        gentimer = 0;
    }
}
if (defendercon == 9 && !d_ex())
{
    scr_shakeobj(mizzle);
    scr_speaker("no_name");
    msgsetloc(0, "* I told you not to wake me up^1! What is this^1, the fifth time?!/%", "obj_dw_church_sideclimb_slash_Step_0_gml_596_0");
    d_make();
    defendercon = 10;
    gentimer = 0;
}
if (defendercon == 10 && !d_ex())
{
    gentimer++;
    if (gentimer == 15)
    {
        with (obj_dw_church_bravewarrior)
        {
            sprite_index = spr_npc_cup_climb;
            scr_delay_var("con", 2, 1 + irandom(30));
        }
    }
    if (gentimer > 15 && !i_ex(obj_dw_church_bravewarrior))
    {
        defendercon = 11;
        gentimer = 0;
    }
}
if (defendercon == 11)
{
    mizzle.image_xscale = 2;
    mizzle.x -= 102;
    scr_speaker("no_name");
    msgsetloc(0, "* ...Ahh^1, I can't stand this place.../%", "obj_dw_church_sideclimb_slash_Step_0_gml_624_0");
    d_make();
    defendercon = 12;
}
if (defendercon == 12 && !d_ex())
{
    with (mizzle)
    {
        scr_lerpvar("image_alpha", 1, 0, 30);
        gravity = -0.35;
        scr_doom(id, 40);
    }
    var roomw = room_width;
    var roomh = room_height;
    var vieww = view_wport[0];
    var viewh = view_hport[0];
    var camx1 = clamp((obj_mainchara.x - floor((vieww / 2) - (obj_mainchara.initwd / 2))) + obj_mainchara.nudgex, 0, roomw - vieww);
    var camy1 = clamp((obj_mainchara.y - floor((viewh / 2) - (obj_mainchara.initht / 2))) + obj_mainchara.nudgey, 0, roomh - viewh);
    scr_lerpvar("camx", camx, camx1, 40);
    defendercon = 99;
    scr_delay_var("defendercon", 13, 41);
    snd_stop_all();
    snd_free_all();
    global.currentsong[0] = snd_init(music);
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    snd_volume(global.currentsong[1], 0, 0);
    snd_volume(global.currentsong[1], 0.7, 41);
    event_user(2);
}
if (defendercon == 13)
{
    obj_mainchara.cutscene = false;
    camcontrol = false;
    global.interact = 0;
    global.facing = 0;
    global.flag[1526] = 2;
    scr_tempsave();
    defendercon = 14;
}
if (global.flag[1526] == 2)
{
    var trig = 0;
    if (camerax() >= 1216)
        trig = 1;
    if (trig)
    {
        global.flag[1526] = 3;
        event_user(4);
    }
}
if (camcontrol)
{
    camerax_set(camx);
    cameray_set(camy);
}
with (npc1)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Charging up the biggest jump..^1. That's the secret to going the fastest!/", "obj_dw_church_sideclimb_slash_Step_0_gml_705_0");
        msgnextloc("* But I keep..^1. bumping...^1! I must not..^1. Bump^1! For my lady!/%", "obj_dw_church_sideclimb_slash_Step_0_gml_706_0");
        if (global.flag[1526] >= 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I heard some noise up there..^1. My lady^1, is she in trouble?/", "obj_dw_church_sideclimb_slash_Step_0_gml_711_0");
            msgnextloc("* I must hasten to climb up..^1. I must charge my jump.../%", "obj_dw_church_sideclimb_slash_Step_0_gml_712_0");
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
with (npc2)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        debug_print(string(global.flag[1524]));
        var timeFrames = global.flag[1524];
        var seconds = timeFrames / 30;
        var milliseconds = (timeFrames % 30) / 3;
        var secstring = string(floor(seconds));
        speedtime = secstring + "." + string(floor(milliseconds));
        msgsetsubloc(0, "* Incredible climbing speed^1! Your fastest time for the first lap is ~1 seconds!/%", speedtime, "obj_dw_church_sideclimb_slash_Step_0_gml_746_0");
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
with (npc3)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        debug_print(string(global.flag[1525]));
        var timeFrames = global.flag[1525];
        var seconds = timeFrames / 30;
        var milliseconds = (timeFrames % 30) / 3;
        var secstring = string(floor(seconds));
        speedtime = secstring + "." + string(floor(milliseconds));
        msgsetsubloc(0, "* Incredible climbing speed^1! Your fastest time for the second lap is ~1 seconds!/%", speedtime, "obj_dw_church_sideclimb_slash_Step_0_gml_779_0");
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
with (obj_trigger)
{
    if (extflag == "shoveright")
    {
        var su = instance_place(x, y, obj_caterpillarchara);
        if (i_ex(su))
        {
            su.x = x + 26;
            su.y -= 18;
            with (su)
                scr_caterpillar_interpolate_old();
        }
    }
}
with (_trophy)
{
    if (!variable_instance_exists(id, "setinplace"))
    {
        setinplace = true;
        xstart = x;
    }
    var won = false;
    if (global.flag[1524] <= 182 && global.flag[1524] != 0 && global.flag[1525] <= 302 && global.flag[1525] != 0)
        won = true;
    x = (xstart + room_width) - (won * room_width);
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (It's an exclusive trophy. You feel a sense of \\cYachievement\\cW.)/", "obj_dw_church_sideclimb_slash_Step_0_gml_829_0");
        msgnextloc("* (...)/", "obj_dw_church_sideclimb_slash_Step_0_gml_830_0");
        msgnextloc("* (But..^1. it wasn't actually an \\cYachievement\\cW.)/%", "obj_dw_church_sideclimb_slash_Step_0_gml_831_0");
        d_make();
        myinteract = 999;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
