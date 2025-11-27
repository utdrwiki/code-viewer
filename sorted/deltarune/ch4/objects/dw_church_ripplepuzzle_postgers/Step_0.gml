if (!init)
    init = 1;
if (global.plot >= 242)
{
    with (organik)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* You can't go in. Too crowded. There is a line just to get out./", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_18_0");
            msgnextloc("* Meanwhile^1, I'm in the line to get in./", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_19_0");
            msgnextloc("* ..^1. Between us^1, it is a deadlock./%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_20_0");
            if (talked)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Oh^1, standing still in a line. It's so exhilarating./", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_25_0");
                msgnextloc("* Even if I'm in a line by myself./%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_26_0");
            }
            d_make();
            myinteract = 999;
            talked++;
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
with (sparkle)
{
    siner++;
    marker.image_index += 0.125;
    marker.image_alpha = (sin(siner / 15) * 0.5) + 0.75;
    mask_index = spr_heart_centered;
    if (myinteract == 3)
    {
        if (myinteract == 3)
            global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Hug the wall", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_69_0");
        global.choicemsg[1] = stringsetloc("#Don't", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_70_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a wall..^1. It looks solid.)/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_75_0");
        msgnext("\\C2 ");
        d_make();
        myinteract = 4;
        marker.visible = false;
    }
    if (myinteract == 4 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            x += room_width;
            with (obj_mainchara)
            {
                snd_play(snd_bump);
                fun = 1;
                sprite_index = spr_kris_piano_loop_1;
                image_index = 1;
                image_speed = 0;
            }
            var small_text_a = stringsetloc("Kris?", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_97_0");
            var small_text_b = stringsetloc("Kris?", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_98_0_b");
            scr_speaker("no_name");
            msgsetloc(0, "* (You hug the wall...)\\f0\\f1 /%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_98_0");
            scr_smallface(0, "ralsei", 13, "mid", "bottom", small_text_a);
            scr_smallface(1, "susie", 12, "right", "bottom", small_text_b);
        }
        if (global.choice == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Too solid.)/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_105_0");
        }
        d_make();
        myinteract = 5;
    }
    if (myinteract == 5 && !d_ex())
    {
        marker.visible = true;
        obj_mainchara.fun = false;
        myinteract = 0;
        global.interact = 0;
    }
}
with (turtle)
{
    if (myinteract == 3)
    {
        myinteract = 4;
        timer = 0;
        pink = 0;
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* R e l a x.../%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_130_0");
        d_make();
        talked++;
        if (talked > 1)
            myinteract = 99;
    }
    if (myinteract == 4 && !d_ex())
    {
        var fadeintime = 15;
        var pausetime = 10;
        var col = 8019622;
        pink = scr_marker_ext(camerax() - 10, cameray() - 10, spr_pxwhite, 660, 500, undefined, undefined, col, 0, undefined, undefined, 0);
        with (pink)
            scr_lerpvar("image_alpha", 0, 1, fadeintime, 2, "out");
        snd_play_delay(snd_power, fadeintime);
        myinteract = 4.1;
        scr_delay_var("myinteract", 5, fadeintime + pausetime);
    }
    if (myinteract == 5)
    {
        myinteract = -1;
        var fadetime = 60;
        var delaytime = 15;
        with (scr_marker_ext(camerax() - 10, cameray() - 10, spr_pxwhite, 660, 500, undefined, undefined, c_white, 5, undefined, undefined, 1))
        {
            scr_lerpvar("image_alpha", 1, 0, fadetime, 2, "out");
            scr_doom(id, fadetime + 1);
        }
        with (pink)
        {
            scr_lerpvar("image_alpha", 1, 0, round(fadetime * 0.9), 2, "in");
            scr_doom(id, fadetime + 1);
        }
        scr_delay_var("myinteract", 6, fadetime + delaytime);
    }
    if (myinteract == 6)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Your TP was recovered!)/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_171_0");
        msgnextloc("* (..^1. But^1, because you're out of battle^1, it doesn't matter.)/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_172_0");
        d_make();
        myinteract = 99;
    }
    if (myinteract == 99 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
scr_populatechars();
if (lightint.myinteract == 3)
{
    lightint.myinteract = 4;
    scr_speaker("no_name");
    msgsetloc(0, "* (It appears to be a light switch.)/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_192_0");
    msgnextloc("* (..^1. It won't budge!)/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_193_0");
    msgnextloc("* (Seems it's actually a heavy switch.)/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_194_0");
    if (lightint.talked)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a heavy light switch.)/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_199_0");
    }
    if (scr_is_switch_os())
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It appears to be a light switch.)/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_205_0");
        msgnextloc("* (..^1. huh? There's a small red cup waving at you from atop the switch.)/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_206_0");
        msgnextloc("* (..^1. This must be what they mean by \"switch-exclusive content\".)/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_207_0");
        if (lightint.talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The cup bakes nine tense doughs. Exclusively on the switch.)/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_212_0");
        }
    }
    lightint.talked++;
    d_make();
    global.interact = 1;
}
if (lightint.myinteract == 4 && !d_ex())
{
    global.interact = 0;
    lightint.myinteract = 0;
}
if (global.plot >= 141)
    exit;
with (obj_doorAny)
{
    if (touched)
    {
        if (global.plot < 141)
            global.plot = 141;
    }
}
if (gercon < 99)
{
    gerint.x = gerson.x;
    gerint.y = gerson.y + 46;
    if (gerint.myinteract == 3)
    {
        memspeed = gerson.image_speed;
        gerson.image_speed = 0;
        gerson.image_index = 0;
        var skip = false;
        if (gercon == 0)
        {
            scr_speaker("gerson");
            msgsetloc(0, "* Don't let me slow ya down!/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_252_0");
            if (gerint.talked)
                msgsetloc(0, "* I'll be right behind ya!/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_255_0");
        }
        if (gercon < 99 && gercon > 0)
        {
            gerint.myinteract = 10;
            skip = true;
        }
        if (scr_checklocation(gerson, 1480, 1214))
        {
            gercon = 999;
            con = 42;
            timer = 0;
            global.interact = 1;
            scr_speaker("gerson");
            msgsetloc(0, "* Are y'all okay? You're moving kinda slow!/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_272_0");
            skip = false;
            gerint.myinteract = 99;
        }
        if (!skip)
        {
            d_make();
            gerint.talked++;
            global.interact = 1;
            gerint.myinteract++;
        }
    }
    if (gerint.myinteract == 4 && !d_ex())
    {
        global.interact = 0;
        gerint.myinteract = 0;
        gerson.image_speed = memspeed;
    }
    if (gerint.myinteract == 10)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        gerint.myinteract = 11;
        global.choicemsg[0] = stringsetloc("All#good", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_299_0");
        global.choicemsg[1] = stringsetloc("Speed#it up", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_300_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("gerson");
        msgsetloc(0, "* Did you need somethin'?/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_304_0");
        msgnext("\\C2 ");
        d_make();
    }
    if (gerint.myinteract == 11 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            gerint.myinteract = 0;
            global.interact = 0;
            gerson.image_speed = memspeed;
        }
        if (global.choice == 1)
        {
            scr_speaker("gerson");
            msgsetloc(0, "* Can do!/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_321_0");
            gerint.myinteract = 12;
        }
    }
    if (gerint.myinteract == 12 && !d_ex())
    {
        memspeed = clamp(memspeed + 0.05, 0, 0.5);
        gerson.image_speed = memspeed;
        gerint.myinteract = 0;
        global.interact = 0;
    }
}
if (con == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "cs1")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        gercon = 1;
        gerint.talked = 0;
        con = 1;
        timer = 0;
    }
}
var gersononscreen = false;
if (i_ex(gerson))
{
    if (gerson.x > (camerax() - 40) && gerson.x < ((camerax() + 640) - 40))
        gersononscreen = true;
}
if (con == 1)
{
    var killthis = false;
    var mygerson = gerson;
    with (obj_trigger)
    {
        if (extflag == "nogers")
        {
            if (place_meeting(x, y, mygerson))
                killthis = true;
        }
    }
    if (killthis)
    {
        debug_print("we're skipping susie's first thing");
        gertimer = -999;
        con = 999;
    }
    if (global.interact == 0 && gersononscreen)
        gertimer++;
    var gersecs = 10;
    if (gertimer >= (30 * gersecs))
    {
        gertimer = 0;
        global.interact = 1;
        memspeed = gerson.image_speed;
        if (i_ex(susie))
        {
            var sudir = point_direction(susie.x, susie.bbox_bottom, gerson.x, gerson.bbox_bottom);
            var _sufacing = scr_get_cardinal_direction(sudir);
            scr_caterpillar_facing_single("susie", _sufacing);
        }
        scr_speaker("susie");
        msgsetloc(0, "\\EK* Hey^1, if we're gonna have to watch you.../", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_395_0");
        msgnextloc("\\EH* ..^1. Can you walk ANY FASTER!?/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_396_0");
        with (d_make())
            stay = 2;
        con = 1.08;
    }
}
if (con == 1.08 && !d_ex())
{
    scr_speaker("gerson");
    msgsetloc(0, "* Of course^1, miss!/%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_405_0");
    d_make();
    con = 2;
}
if (con == 2 && !d_ex())
{
    global.interact = 0;
    gerson.image_speed = memspeed * 2;
    with (susie)
    {
        var _newfacing = scr_facing_letter_to_number(scr_get_cardinal_direction(point_direction(x, y, obj_mainchara.x, obj_mainchara.y)));
        facing[0] = _newfacing;
        for (_iaia = target; _iaia > 0; _iaia -= 1)
            facing[_iaia] = _newfacing;
    }
    con = 3;
}
if (con == 3)
{
    var killthis = false;
    var mygerson = gerson;
    with (obj_trigger)
    {
        if (extflag == "nogers")
        {
            if (place_meeting(x, y, mygerson))
                killthis = true;
        }
    }
    if (killthis)
    {
        gertimer = -999;
        con = 999;
    }
    if (global.interact == 0 && gersononscreen)
        gertimer++;
    if (gertimer >= 90)
    {
        gerson.image_speed = 0;
        gerson.image_index = 0;
        gercon = 999;
        with (obj_lerpvar)
        {
            debug_print("killed!!");
            instance_destroy();
        }
        scr_speaker("susie");
        msgsetloc(0, "\\E0* ..^1. know what?/", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_463_0");
        msgnextloc("\\E1* YOU GUYS handle the old man. I'm gone./%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_464_0");
        d_make(1);
        con = 4.01;
        global.interact = 1;
        gertimer = 0;
    }
}
if (con == 4.01 && !d_ex())
{
    var walkspeed = 8;
    var usprite = spr_susie_walk_up_dw;
    var lsprite = spr_susie_walk_left_dw_unhappy;
    var dsprite = spr_susie_walk_down_dw_unhappy;
    var rsprite = spr_susie_walk_right_dw_unhappy;
    if (sucon == 0)
    {
        suposlist = [];
        for (var i = 0; i < 5; i++)
        {
            var supos = scr_heromarker("susie", "subail" + string(i + 1));
            array_push(suposlist, supos);
        }
        debug_message(suposlist);
        debug_message(string(array_length(suposlist)));
        sucon = 1;
        susie.fun = 1;
        susie.image_speed = 0.25;
    }
    if (sucon < 6)
    {
        if (susie.x < (camerax() - 60))
        {
            sucon = 6;
            with (obj_script_delayed)
            {
                debug_message("kild");
                instance_destroy();
            }
        }
    }
    if (sucon == 1)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (susie.x > targx)
        {
            var dist = max(round(abs(targx - susie.x) / walkspeed), 1);
            with (susie)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            sucon = -1;
            susie.sprite_index = lsprite;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 2)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (susie.y < targy)
        {
            var dist = max(round(abs(targy - susie.y) / walkspeed), 1);
            with (susie)
                scr_lerpvar("y", y, targy, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            susie.sprite_index = dsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 3)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (susie.x > targx)
        {
            var dist = max(round(abs(targx - susie.x) / walkspeed), 1);
            with (susie)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            susie.sprite_index = lsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 4)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (susie.y > targy)
        {
            var dist = max(round(abs(targy - susie.y) / walkspeed), 1);
            with (susie)
                scr_lerpvar("y", y, targy, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            susie.sprite_index = usprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 5)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (susie.x > targx)
        {
            var dist = max(round(abs(targx - susie.x) / walkspeed), 1);
            with (susie)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            susie.sprite_index = lsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 6)
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\EQ* I^1, um..^1. should go follow her.../%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_610_0");
        d_make(1);
        sucon = 0;
        con = 4.02;
    }
}
if (con == 4.02 && !d_ex())
{
    var walkspeed = 8;
    var usprite = spr_ralsei_walk_up;
    var lsprite = spr_ralsei_walk_left_unhappy;
    var dsprite = spr_ralsei_walk_down_unhappy;
    var rsprite = spr_ralsei_walk_right_unhappy;
    if (sucon == 0)
    {
        for (var i = 0; i < 5; i++)
        {
            suposlist[i][0] += 4;
            suposlist[i][1] += 4;
        }
        debug_message("ralsei list");
        debug_message(suposlist);
        debug_message(string(array_length(suposlist)));
        sucon = 1;
        ralsei.fun = 1;
        ralsei.image_speed = 0.25;
    }
    if (sucon < 6)
    {
        if (ralsei.x < (camerax() - 60))
        {
            sucon = 6;
            with (obj_script_delayed)
            {
                debug_message("kild");
                instance_destroy();
            }
        }
    }
    if (sucon == 1)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (ralsei.x > targx)
        {
            var dist = max(round(abs(targx - ralsei.x) / walkspeed), 1);
            with (ralsei)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            sucon = -1;
            ralsei.sprite_index = lsprite;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 2)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (ralsei.y < targy)
        {
            var dist = max(round(abs(targy - ralsei.y) / walkspeed), 1);
            with (ralsei)
                scr_lerpvar("y", y, targy, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            ralsei.sprite_index = dsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 3)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (ralsei.x > targx)
        {
            var dist = max(round(abs(targx - ralsei.x) / walkspeed), 1);
            with (ralsei)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            ralsei.sprite_index = lsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 4)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (ralsei.y > targy)
        {
            var dist = max(round(abs(targy - ralsei.y) / walkspeed), 1);
            with (ralsei)
                scr_lerpvar("y", y, targy, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            ralsei.sprite_index = usprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 5)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (ralsei.x > targx)
        {
            var dist = max(round(abs(targx - ralsei.x) / walkspeed), 1);
            with (ralsei)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            ralsei.sprite_index = lsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 6)
    {
        scr_speaker("gerson");
        msgsetloc(0, "* ..^1. Gee^1, guess I better catch up^1, too./%", "obj_dw_church_ripplepuzzle_postgers_slash_Step_0_gml_746_0");
        d_make(1);
        sucon = 0;
        con = 4.03;
        scr_setparty(0);
    }
}
if (con == 4.03 && !d_ex())
{
    var walkspeed = 12;
    var usprite = spr_gerson_outfit_walk_up;
    var lsprite = spr_gerson_outfit_walk_cane;
    var dsprite = spr_gerson_outfit_walk_cane;
    var rsprite = spr_gerson_outfit_walk_cane_right;
    if (sucon == 0)
    {
        for (var i = 0; i < 5; i++)
        {
            suposlist[i][0] += -12;
            suposlist[i][1] += 6;
        }
        debug_message("gerson list");
        debug_message(suposlist);
        debug_message(string(array_length(suposlist)));
        sucon = 1;
        gerson.fun = 1;
        gerson.image_speed = 0.25;
    }
    if (sucon < 6)
    {
        if (gerson.x < (camerax() - 120))
        {
            sucon = 6;
            with (obj_script_delayed)
            {
                debug_message("kild");
                instance_destroy();
            }
        }
    }
    if (sucon == 1)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (gerson.x > targx)
        {
            var dist = max(round(abs(targx - gerson.x) / walkspeed), 1);
            with (gerson)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            sucon = -1;
            gerson.sprite_index = lsprite;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 2)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (gerson.y < targy)
        {
            var dist = max(round(abs(targy - gerson.y) / walkspeed), 1);
            with (gerson)
                scr_lerpvar("y", y, targy, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            gerson.sprite_index = dsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 3)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (gerson.x > targx)
        {
            var dist = max(round(abs(targx - gerson.x) / walkspeed), 1);
            with (gerson)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            gerson.sprite_index = lsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 4)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (gerson.y > targy)
        {
            var dist = max(round(abs(targy - gerson.y) / walkspeed), 1);
            with (gerson)
                scr_lerpvar("y", y, targy, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            gerson.sprite_index = usprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 5)
    {
        var targx = suposlist[sucon - 1][0];
        var targy = suposlist[sucon - 1][1];
        if (gerson.x > targx)
        {
            var dist = max(round(abs(targx - gerson.x) / walkspeed), 1);
            with (gerson)
                scr_lerpvar("x", x, targx, dist);
            scr_delay_var("sucon", sucon + 1, dist);
            gerson.sprite_index = lsprite;
            sucon = -1;
        }
        else
        {
            sucon++;
        }
    }
    if (sucon == 6)
    {
        global.interact = 0;
        global.facing = 0;
        with (obj_caterpillarchara)
            visible = false;
        with (gerson)
            visible = false;
        if (global.plot < 141)
            global.plot = 141;
        sucon = 0;
        con = 10;
    }
}
if (con == 42 && !d_ex())
{
    timer++;
    if (timer == 1)
    {
        gerson.image_speed = 0.16666666666666666;
        gerson.hspeed = -8;
    }
    if (timer > 1 && gerson.x < ralsei.x)
    {
        ralsei.fun = 1;
        ralsei.sprite_index = spr_ralsei_surprised_left;
    }
    if (timer > 1 && gerson.x < susie.x)
    {
        susie.fun = 1;
        susie.sprite_index = spr_susie_surprised_left;
    }
    if (gerson.x < kris.x)
        global.facing = 3;
    if (gerson.x < (camerax() - 80))
    {
        con = 43;
        timer = 0;
    }
}
if (con == 43)
{
    timer++;
    if (timer == 15)
    {
        with (obj_caterpillarchara)
        {
            fun = 0;
            scr_caterpillar_interpolate();
        }
        global.facing = 0;
        global.flag[1604] = 1;
        global.plot = 141;
        global.interact = 0;
    }
}
if (gercon == 1)
{
    if (global.interact == 0)
        timer++;
    var pointa_x = 2680;
    var pointa_y = 1117;
    var pointb_x = 2200;
    var pointb_y = 1114;
    var dist = point_distance(pointa_x, pointa_y, pointb_x, pointb_y) / 1;
    if (timer == 1)
    {
        with (gerson)
        {
            sprite_index = spr_gerson_outfit_walk_cane;
            if (image_speed == 0)
                image_speed = 0.1;
            image_index = 1;
            scr_lerpvar_respect("x", pointa_x, pointb_x, dist);
            scr_lerpvar_respect("y", pointa_y, pointb_y, dist);
        }
    }
    if (timer >= (1 + dist))
    {
        timer = 0;
        gercon = 2;
    }
}
if (gercon == 2)
{
    if (global.interact == 0)
        timer++;
    var pointa_x = 2200;
    var pointa_y = 1114;
    var pointb_x = 2200;
    var pointb_y = 1294;
    var dist = point_distance(pointa_x, pointa_y, pointb_x, pointb_y) / 1;
    var pausetime = 16;
    if (timer < pausetime)
        gerson.image_index = 0;
    if (timer == pausetime)
    {
        with (gerson)
        {
            image_index = 1;
            scr_lerpvar_respect("x", pointa_x, pointb_x, dist);
            scr_lerpvar_respect("y", pointa_y, pointb_y, dist);
        }
    }
    if (timer == (pausetime + dist))
    {
        timer = 0;
        gercon++;
    }
}
if (gercon == 3)
{
    if (global.interact == 0)
        timer++;
    var pointa_x = 2200;
    var pointa_y = 1294;
    var pointb_x = 1808;
    var pointb_y = 1294;
    var dist = point_distance(pointa_x, pointa_y, pointb_x, pointb_y) / 1;
    var pausetime = 16;
    if (timer < pausetime)
        gerson.image_index = 0;
    if (timer == pausetime)
    {
        with (gerson)
        {
            image_index = 1;
            scr_lerpvar_respect("x", pointa_x, pointb_x, dist);
            scr_lerpvar_respect("y", pointa_y, pointb_y, dist);
        }
    }
    if (timer == (pausetime + dist))
    {
        timer = 0;
        gercon++;
    }
}
if (gercon == 4)
{
    if (global.interact == 0)
        timer++;
    var pointa_x = 1808;
    var pointa_y = 1294;
    var pointb_x = 1808;
    var pointb_y = 1214;
    var dist = point_distance(pointa_x, pointa_y, pointb_x, pointb_y) / 1;
    var pausetime = 16;
    if (timer < pausetime)
        gerson.image_index = 0;
    if (timer == pausetime)
    {
        with (gerson)
        {
            image_index = 1;
            scr_lerpvar_respect("x", pointa_x, pointb_x, dist);
            scr_lerpvar_respect("y", pointa_y, pointb_y, dist);
        }
    }
    if (timer == (pausetime + dist))
    {
        timer = 0;
        gercon++;
    }
}
if (gercon == 5)
{
    if (global.interact == 0)
        timer++;
    var pointa_x = 1808;
    var pointa_y = 1214;
    var pointb_x = 1480;
    var pointb_y = 1214;
    var dist = point_distance(pointa_x, pointa_y, pointb_x, pointb_y) / 1;
    var pausetime = 16;
    if (timer < pausetime)
        gerson.image_index = 0;
    if (timer == pausetime)
    {
        with (gerson)
        {
            image_index = 1;
            scr_lerpvar_respect("x", pointa_x, pointb_x, dist);
            scr_lerpvar_respect("y", pointa_y, pointb_y, dist);
        }
    }
    if (timer == (pausetime + dist))
    {
        timer = 0;
        gercon++;
        gerson.image_speed = 0;
        gerson.image_index = 0;
    }
}
with (gerson)
{
    if (global.interact != 0 && other.gercon < 999)
        image_index = 0;
    scr_depth();
}
