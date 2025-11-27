var str_left = stringsetloc("Left", "obj_dw_churchb_gersonchase_slash_Step_0_gml_5_0");
var str_right = stringsetloc("Right", "obj_dw_churchb_gersonchase_slash_Step_0_gml_6_0");
var str_up = stringsetloc("Up", "obj_dw_churchb_gersonchase_slash_Step_0_gml_7_0");
var str_down = stringsetloc("Down", "obj_dw_churchb_gersonchase_slash_Step_0_gml_8_0");
var str_hisound = stringsetloc("Church Bell", "obj_dw_churchb_gersonchase_slash_Step_0_gml_10_0");
var str_losound = stringsetloc("Violin", "obj_dw_churchb_gersonchase_slash_Step_0_gml_11_0");
var str_dogcat = stringsetloc("Drum", "obj_dw_churchb_gersonchase_slash_Step_0_gml_12_0");
var str_laser = stringsetloc("Guitar", "obj_dw_churchb_gersonchase_slash_Step_0_gml_13_0");
if (!init)
{
    var prevy = -1;
    if (global.tempflag[51] != 0)
    {
        with (obj_mainchara)
        {
            prevy = y;
            debug_print(string(global.tempflag[51]));
            var offset = findspriteinfo(spr_debug_cameraregionpreview, "DEBUG_ASSETS").y;
            y = global.tempflag[51] + offset;
            global.tempflag[51] = 0;
        }
        var moveddist = prevy - obj_mainchara.y;
        with (obj_caterpillarchara)
        {
            for (var i = 0; i < array_length(remx); i++)
                remy[i] += moveddist;
        }
    }
    var pos = scr_heromarker(undefined, "notgerson1");
    germark1 = scr_marker_ext(pos[0], pos[1], spr_gerson_walk_armor_left, 2, 2, 0, 0, undefined, undefined, 1);
    germark1.image_blend = c_black;
    germark1.con = 0;
    germark1.timer = 14;
    pos = scr_heromarker(undefined, "notgerson2");
    germark2 = scr_marker_ext(pos[0], pos[1], spr_gerson_walk_armor_left, 2, 2, 0, 0, undefined, undefined, 1);
    germark2.image_blend = c_black;
    germark2.con = 0;
    germark2.timer = 14;
    init = 1;
    if (global.tempflag[90] == 43)
    {
        global.tempflag[90] = 0;
        pos = scr_heromarker("kris", "debugwarp1");
        setxy(pos[0], pos[1], 1049);
        setxy(pos[0], pos[1], 93);
        scr_caterpillar_interpolate("all");
        con = 11;
    }
    if (global.tempflag[90] == 44)
    {
        global.tempflag[90] = 0;
        pos = scr_heromarker("kris", "debugwarp1");
        setxy(pos[0], pos[1], 1049);
        setxy(pos[0], pos[1], 93);
        scr_caterpillar_interpolate("all");
        qcon = 41;
        timer = 0;
        global.interact = 1;
    }
}
var makesoltrig = -4;
if (con == 0)
{
    if (scr_trigcheck("seeger1"))
    {
        with (obj_trigger)
        {
            if (extflag == "seeger1_blackout")
                makesoltrig = id;
        }
        with (germark1)
        {
            image_speed = 0.125;
            con = 1;
            vspeed = -6;
            scr_doom(id, 140);
        }
        con = 3;
    }
}
if (con == 3)
{
    if (scr_trigcheck("seeger2"))
    {
        with (obj_trigger)
        {
            if (extflag == "seeger2_blackout")
                makesoltrig = id;
        }
        darkcount++;
        with (germark2)
        {
            con = 1;
            image_speed = 0.125;
            hspeed = -6;
            friction = -0.1;
            scr_doom(id, 140);
        }
        con = 4;
        scr_speaker("susie");
        msgsetloc(0, "\\Ee* Hey^1! Slow the hell down^1, old man!/", "obj_dw_churchb_gersonchase_slash_Step_0_gml_107_0");
        msgnextloc("\\Ed* We're trying to talk to you!/%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_108_0");
        d_make(undefined, undefined, undefined, 1);
        global.interact = 1;
    }
}
if (con == 4 && !d_ex())
{
    global.interact = 0;
    con = 6;
}
if (con == 6)
{
    if (scr_trigcheck("darker1"))
    {
        with (obj_trigger)
        {
            if (extflag == "darker1_blackout")
                makesoltrig = id;
        }
        darkcount++;
        con++;
    }
}
if (con == 7)
{
    var trigtocheck = "darker2";
    if (scr_trigcheck(trigtocheck))
    {
        with (obj_trigger)
        {
            if (extflag == (trigtocheck + "_blackout"))
                makesoltrig = id;
        }
        darkcount++;
        con++;
    }
}
if (con == 8)
{
    var trigtocheck = "darker3";
    if (scr_trigcheck(trigtocheck))
    {
        with (obj_trigger)
        {
            if (extflag == (trigtocheck + "_blackout"))
                makesoltrig = id;
        }
        darkcount++;
        con++;
    }
}
if (con == 9)
{
    var trigtocheck = "darker4";
    if (scr_trigcheck(trigtocheck))
    {
        with (obj_trigger)
        {
            if (extflag == (trigtocheck + "_blackout"))
                makesoltrig = id;
        }
        darkcount++;
        con++;
    }
}
if (con == 10)
{
    var trigtocheck = "darker5";
    if (scr_trigcheck(trigtocheck))
    {
        with (obj_trigger)
        {
            if (extflag == (trigtocheck + "_blackout"))
                makesoltrig = id;
        }
        darkcount++;
        con++;
    }
}
if (con == 11)
{
    if (scr_trigcheck("end"))
    {
        darkcount = 6;
        global.interact = 1;
        blackout = scr_marker_ext(camerax() - 20, cameray() - 20, spr_pxwhite, 680, 520, undefined, undefined, c_black, 5000, undefined, undefined, 0);
        with (blackout)
        {
            var lifetime = 90;
            if (button3_h() || button2_h())
                lifetime = 30;
            scr_lerpvar("image_alpha", -1, 1.1, lifetime, 2, "out");
        }
        scr_speaker("susie");
        msgsetloc(0, "\\EV* Damn^1, can't see anything in here.../%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_220_0");
        d_make(undefined, undefined, undefined, 1);
        snd_volume(global.currentsong[1], 0, 120);
        pitch = 0;
        con = 12;
    }
}
if (con == 12)
{
    if (!d_ex() && blackout.image_alpha >= 1)
    {
        with (obj_church_ripple)
            instance_destroy();
        with (obj_fancy_ripples)
            instance_destroy();
        with (obj_fancy_ripples_alt)
            instance_destroy();
        safe_delete(blackout);
        setxy(room_width / 2, room_height / 2, 1049);
        layer_set_visible("TILES_WALL", 0);
        with (obj_solidblock)
            instance_destroy();
        global.interact = 0;
        with (obj_caterpillarchara)
        {
            setxy(obj_mainchara.x + 90, obj_mainchara.y - 16);
            scr_caterpillar_interpolate();
        }
        qcon = 1;
        qplay = 1;
        qtimer = 0;
        qx = obj_mainchara.x;
        qy = obj_mainchara.y;
        con = 13;
    }
}
if (i_ex(makesoltrig))
{
    with (makesoltrig)
    {
        var sol = instance_create(x, y, obj_solidblocksized);
        sol.sprite_index = spr_pxwhite;
        scr_sizeexact(sprite_width, sprite_height, sol);
        sol.visible = true;
        sol.depth = 12000;
        sol.image_alpha = 0;
        with (sol)
            scr_lerpvar("image_alpha", -1, 1, 120, 2, "out");
        sol.image_blend = c_black;
    }
}
darkindex = clamp(darkcount / 7, 0, 1);
if (qplay == 1 || qplay == 2)
{
    qtimer++;
    if ((qtimer % 90) == 0)
    {
        if (qplay == 1)
            snd_play(correctsnd1);
        if (qplay == 2)
            snd_play(correctsnd2);
    }
}
if (qcon == 1)
{
    if (qtimer == 1)
        global.flag[7] = 1;
    if (qtimer == 105)
        global.interact = 1;
    if (qtimer > 180 && !d_ex())
    {
        qcon = 2;
        qx = obj_mainchara.x;
        qy = obj_mainchara.y;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Hear it", "obj_dw_churchb_gersonchase_slash_Step_0_gml_318_0");
        global.choicemsg[1] = stringsetloc("#I can't#hear it", "obj_dw_churchb_gersonchase_slash_Step_0_gml_319_0");
        scr_speaker("susie");
        msgsetloc(0, "\\E0* Hey Kris^1, wait a sec./", "obj_dw_churchb_gersonchase_slash_Step_0_gml_322_0");
        msgnextloc("\\E1* Do you hear that noise...?/", "obj_dw_churchb_gersonchase_slash_Step_0_gml_323_0");
        msgnext("\\C2 ");
        d_make(undefined, undefined, undefined, 1);
        qcon = 1.1;
    }
}
if (qcon == 1.1 && global.choice != -1)
{
    k_d(1);
    if (global.choice == 0)
        qcon = 2;
    if (global.choice == 1)
    {
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("Honestly,#I can", "obj_dw_churchb_gersonchase_slash_Step_0_gml_343_0");
        global.choicemsg[1] = stringsetloc("Honestly,#I can't", "obj_dw_churchb_gersonchase_slash_Step_0_gml_344_0");
        msgsetloc(0, "\\EC* ..^1. what? You honestly can't hear it?/", "obj_dw_churchb_gersonchase_slash_Step_0_gml_346_0");
        msgnext("\\C2 ");
        d_make();
        qcon = 1.2;
    }
}
if (qcon == 1.2 && global.choice != -1)
{
    k_d(1);
    if (global.choice == 0)
        qcon = 2;
    if (global.choice == 1)
    {
        qplay = 0;
        scr_speaker("susie");
        msgsetloc(0, "\\EK* ..^1. huh. Well^1, I can.../%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_364_0");
        d_make(undefined, undefined, 5);
        qcon = 1.3;
    }
}
if (qcon == 1.3 && !d_ex())
    qcon = 41;
if (qcon == 2)
{
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetsubloc("#~1", str_left, "obj_dw_churchb_gersonchase_slash_Step_0_gml_378_0");
    global.choicemsg[1] = stringsetsubloc("#~1", str_right, "obj_dw_churchb_gersonchase_slash_Step_0_gml_379_0");
    global.choicemsg[2] = str_up;
    global.choicemsg[3] = str_down;
    scr_speaker("susie");
    if (quizindex == 0)
    {
        msgsetloc(0, "\\E1* It sounds like it was coming from.../", "obj_dw_churchb_gersonchase_slash_Step_0_gml_385_0");
    }
    else
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E0* Another noise..^1. sounded like it was coming from.../", "obj_dw_churchb_gersonchase_slash_Step_0_gml_389_0");
    }
    msgnext("\\C4 ");
    var runcheck = 0;
    if (quizindex == 1)
        runcheck = 1;
    d_make(undefined, undefined, undefined, runcheck);
    qcon = 2.1;
}
if (qcon == 2.1 && global.choice != -1)
{
    var correctanswer = -1;
    var correctstring = "";
    var correctdir = correctdir1;
    if (quizindex == 1)
        correctdir = correctdir2;
    switch (correctdir)
    {
        case 0:
            correctanswer = 0;
            correctstring = str_left;
            break;
        case 1:
            correctanswer = 1;
            correctstring = str_right;
            break;
    }
    k_d(1);
    if (global.choice == correctanswer)
    {
        qcon = 3;
        correctscore++;
    }
    else
    {
        qplay = 0;
        scr_speaker("susie");
        msgsetsubloc(0, "\\EK* Huh? No^1, it was ~1^1, right?/%", correctstring, "obj_dw_churchb_gersonchase_slash_Step_0_gml_423_0");
        d_make(undefined, undefined, 1);
        qcon = 5.1;
    }
}
if (qcon == 3)
{
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetsubloc("#~1", str_hisound, "obj_dw_churchb_gersonchase_slash_Step_0_gml_434_0");
    global.choicemsg[1] = stringsetsubloc("#~1", str_losound, "obj_dw_churchb_gersonchase_slash_Step_0_gml_435_0");
    global.choicemsg[2] = str_dogcat;
    global.choicemsg[3] = str_laser;
    scr_speaker("susie");
    msgsetloc(0, "\\EA* Yeah^1! It totally sounds like.../", "obj_dw_churchb_gersonchase_slash_Step_0_gml_440_0");
    msgnext("\\C4 ");
    d_make();
    qcon = 3.1;
}
if (qcon == 3.1 && global.choice != -1)
{
    k_d(1);
    var correctanswer = -1;
    var correctsnd = correctsnd1;
    if (quizindex == 1)
        correctsnd = correctsnd2;
    var correctstring;
    switch (correctsnd)
    {
        case 80:
        case 20:
            correctanswer = 0;
            correctstring = str_hisound;
            break;
        case 164:
        case 144:
            correctanswer = 1;
            correctstring = str_losound;
            break;
    }
    if (global.choice == correctanswer)
    {
        correctscore++;
        if (quizindex == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EA* Yeah^1, this way!/%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_467_0");
            d_make();
            qcon = 3.9;
            timer = 0;
        }
        else
        {
            qplay = 0;
            qcon = 40;
            timer = 0;
            qx = obj_mainchara.x;
            qy = obj_mainchara.y;
        }
    }
    else
    {
        qplay = 0;
        scr_speaker("susie");
        msgsetsubloc(0, "\\EK* Huh? No^1, it was ~1..^1. right?/%", correctstring, "obj_dw_churchb_gersonchase_slash_Step_0_gml_486_0");
        d_make();
        qcon = 5.1;
    }
}
if (qcon == 3.9)
{
    timer++;
    if (timer == 1)
    {
        qplay = 0;
        qtimer = 0;
    }
    if (timer == 15)
    {
        obj_caterpillarchara.visible = false;
        sumark = scr_marker_ext(obj_caterpillarchara.x, obj_caterpillarchara.y, spr_susie_walk_right_dw, 2, 2, undefined, 0.125, c_black, undefined, 1);
        if (correctdir1 == 0)
        {
            sumark.sprite_index = spr_susie_walk_left_dw;
            sumark.hspeed = -8;
            sumark.image_speed = 0.25;
        }
        else
        {
            sumark.hspeed = 8;
            sumark.image_speed = 0.25;
        }
    }
    if (timer >= 15)
    {
        if ((timer % 15) == 0)
        {
            darkind = darkindex;
            with (sumark)
            {
                scr_fancy_ripple(x + (sprite_width / 2), (y + sprite_height) - 12, 60, 15292879, 140, 1, 12, 1999000, clamp(hspeed * 1.05, -8, 8), 0, 0.1);
                var step1 = 25;
                var step2 = 504;
                if (other.correctdir1 == 1)
                {
                    step1 = 493;
                    step2 = 4;
                }
                var snd = step1;
                if ((other.timer - 1) == 0)
                    snd = step2;
                var ind = round(4 - (other.timer / 18)) / 4;
                snd_play(snd, ind);
            }
        }
        if (sumark.x < (camerax() - 80) || (sumark.x > (camerax() + 640 + 40) && !d_ex()))
        {
            sumark.image_speed = 0;
            sumark.hspeed = 0;
            sumark.image_index = 0;
            sumark.visible = false;
            timer = 0;
            global.interact = 0;
            qplay = 2;
            qtimer = 0;
            qcon = 10;
            qx = obj_mainchara.x;
            qy = obj_mainchara.y;
        }
    }
}
if (qcon == 5.1 && !d_ex())
    qcon = 41;
if (qcon == 5.5)
{
    qx = obj_mainchara.x;
    qy = obj_mainchara.y;
    qcon = 10;
    qplay = 2;
    global.interact = 0;
}
if (qcon == 10)
{
    var dist = 600;
    if (qtimer == 105)
        global.interact = 1;
    if (qtimer > 180 && !d_ex())
    {
        global.interact = 1;
        qcon = 2;
        quizindex = 1;
        qx = obj_mainchara.x;
        qy = obj_mainchara.y;
    }
}
if (qcon == 40)
{
    global.interact = 0;
    timer = 0;
    qx = obj_mainchara.x;
    qy = obj_mainchara.y;
    qcon = 41;
}
if (qcon == 41)
{
    timer++;
    if (timer == 1)
    {
        with (obj_caterpillarchara)
            visible = false;
    }
    if (timer == 60)
    {
        global.interact = 1;
        snd_play(correctsnd2);
        snd_play(correctsnd2, 0.6, 0.4);
    }
    if (timer == 70)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E6* Hey^1! I heard something again!/%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_638_0");
        msgnextloc("\\EA* Quick^1, over here!/%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_639_0");
        d_make(undefined, undefined, undefined, 1);
        timer = 0;
        qcon = 42;
    }
}
if (qcon == 42 && !d_ex())
{
    timer++;
    if (timer == 10)
    {
        var step1 = 25;
        var step2 = 504;
        if (correctdir2 == 1)
        {
            step1 = 493;
            step2 = 4;
        }
        var timedelay = 8;
        var count = 0;
        snd_play(step1);
        count++;
        snd_play_delay(step2, count * timedelay, 1 - (count / 9));
        count++;
        snd_play_delay(step1, count * timedelay, 1 - (count / 9));
        count++;
        snd_play_delay(step2, count * timedelay, 1 - (count / 9));
        count++;
        snd_play_delay(step1, count * timedelay, 1 - (count / 9));
        count++;
        snd_play_delay(step2, count * timedelay, 1 - (count / 9));
        count++;
        snd_play_delay(step1, count * timedelay, 1 - (count / 9));
        count++;
        snd_play_delay(step2, count * timedelay, 1 - (count / 9));
        count++;
        snd_play_delay(step1, count * timedelay, 1 - (count / 9));
        count++;
        count++;
        count++;
        qcon = 42.1;
        scr_delay_var("qcon", 42.2, count * timedelay);
        timer = 0;
    }
}
if (qcon == 42.2)
{
    timer++;
    if (timer == 15)
    {
        var surprise = 123;
        if (correctdir2 == 1)
            surprise = 18;
        snd_play(surprise);
    }
    if (timer == 75)
    {
        var impact = 527;
        if (correctdir2 == 1)
            impact = 120;
        snd_play(impact);
        snd_play_delay(impact, 2, 1/3);
        snd_play_delay(impact, 4, 0.16666666666666666);
    }
    if (timer == 135)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EV* D-dammit.../", "obj_dw_churchb_gersonchase_slash_Step_0_gml_703_0");
        msgnextloc("\\El* Kris^1, I slipped and fell down somewhere!/", "obj_dw_churchb_gersonchase_slash_Step_0_gml_704_0");
        msgnextloc("\\El* Stay there^1, okay? I'm gonna look for a way back.../%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_705_0");
        d_make();
        qcon = 42.3;
        timer = 0;
        qx = obj_mainchara.x;
        qy = obj_mainchara.y;
    }
}
if (qcon == 42.3 && !d_ex())
{
    timer++;
    if (timer == 15)
    {
        var step1 = 25;
        var step2 = 504;
        if (correctdir2 == 1)
        {
            step1 = 493;
            step2 = 4;
        }
        var timedelay = 15;
        var count = 0;
        snd_play(step1, 0.5);
        count++;
        snd_play_delay(step2, count * timedelay, 0.5 - (count / 9));
        count++;
        snd_play_delay(step1, count * timedelay, 0.5 - (count / 9));
        count++;
        snd_play_delay(step2, count * timedelay, 0.5 - (count / 9));
        count++;
        snd_play_delay(step1, count * timedelay, 0.5 - (count / 9));
        count++;
    }
    if (timer == 90)
    {
        global.flag[7] = 1;
        darkcount = 6.9;
        global.interact = 0;
    }
    if (timer >= 300 || point_distance(qx, qy, obj_mainchara.x, obj_mainchara.y) >= 600)
    {
        global.interact = 1;
        global.flag[7] = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (Left in complete darkness...)/", "obj_dw_churchb_gersonchase_slash_Step_0_gml_752_0");
        msgnextloc("* (Seems there's nothing left to do but close your eyes.)/", "obj_dw_churchb_gersonchase_slash_Step_0_gml_753_0");
        msgnextloc("* (And think about how Susie is doing now.)/%", "obj_dw_churchb_gersonchase_slash_Step_0_gml_754_0");
        d_make(undefined, undefined, undefined, 1);
        qcon = 42.4;
        timer = 0;
    }
}
if (qcon == 42.4 && !d_ex())
{
    global.tempflag[57] = correctscore;
    debug_message("global.tempflag[57]=" + string(global.tempflag[57]) + "| <--- How Many Right out of 4, to use in battle");
    snd_free_all();
    room_goto(room_dw_churchb_nongerson);
    global.flag[7] = 0;
    qcon = 50;
}
var darkind = darkindex;
var ripstepregularity = 15;
var ripcount = 5;
if (i_ex(germark1))
{
    with (germark1)
    {
        if (con == 1)
        {
            timer++;
            if ((timer % ripstepregularity) == 0)
            {
                var targx = x + 40;
                var targy = y + 76;
                scr_fancy_ripple(targx, targy, 60, 16776960, 120, 1, 12, 1999000, clamp(hspeed * 1.05, -8, 8), clamp(vspeed * 1.05, -8, 8), 0.1);
                var snd = 348;
                if ((other.timer - 1) == 0)
                    snd = 349;
                var ind = round(ripcount - (timer / ripstepregularity)) / ripcount;
                snd_play(snd, ind);
            }
            var trig = 0;
            with (obj_trigger)
            {
                if (extflag == "killger")
                {
                    if (place_meeting(x, y, other))
                        trig = 1;
                }
            }
            if (trig)
                instance_destroy();
        }
    }
}
if (i_ex(germark2))
{
    with (germark2)
    {
        if (con == 1)
        {
            timer++;
            if ((timer % ripstepregularity) == 0)
            {
                var targx = x + 40;
                var targy = y + 76;
                scr_fancy_ripple(targx, targy, 60, 16776960, 120, 1, 12, 1999000, clamp(hspeed * 1.05, -8, 8), 0, 0.1);
                var snd = 348;
                if ((other.timer - 1) == 0)
                    snd = 349;
                var ind = round(ripcount - (timer / ripstepregularity)) / ripcount;
                snd_play(snd, ind);
            }
        }
    }
}
if (pitch > 0)
{
    playdist = point_distance(obj_mainchara.x, obj_mainchara.y, endx, endy);
    var newpitch = lerp(0.54, 0.05, clamp(1 - (playdist / 1587), 0, 1));
    if (newpitch < pitch)
        pitch = lerp(pitch, newpitch, 0.02);
    audio_sound_pitch(global.currentsong[1], pitch);
}
with (obj_fancy_ripples)
    image_alpha = 1 - other.darkindex;
with (obj_fancy_ripples_alt)
    image_alpha = 1 - other.darkindex;
