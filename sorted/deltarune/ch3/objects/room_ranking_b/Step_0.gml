with (shine)
{
    if (myinteract == 3)
    {
        scr_lerpvar("image_alpha", 1, 0, 15);
        global.interact = 1;
        global.flag[1092] = 6;
        scr_speaker("no_name");
        msgsetloc(0, "* (You thought you saw something on the ground..^1. but you must've already had it.)/%", "obj_room_ranking_b_slash_Step_0_gml_12_0_b");
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        snd_play(snd_egg);
        scr_keyitemget(18);
        global.interact = 0;
        instance_destroy();
    }
}
if (global.flag[1226] == 1)
    exit;
if (i_ex(gatrig))
{
    if (gatrig.myinteract == 3)
    {
        gatrig.myinteract++;
        global.interact = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\E5* Kris^1, gimme your feet. I'm shoving you up there./", "obj_room_ranking_b_slash_Step_0_gml_10_0");
        scr_anyface_next("ralsei", 0);
        var rastring = stringsetloc("\\E0* (I think we use that machine on the right...?)/%", "obj_room_ranking_b_slash_Step_0_gml_12_0");
        msgnext(rastring);
        if (garead == 1)
        {
            scr_speaker("ralsei");
            msgset(0, rastring);
        }
        d_make();
        garead = 1;
    }
    if (gatrig.myinteract == 4 && !d_ex())
    {
        gatrig.myinteract = 0;
        global.interact = 0;
    }
}
if (gacha_con < 0)
    exit;
if (gacha_con == 0 && !d_ex())
{
    gacha_con = 1;
    global.interact = 1;
    if (!gacha_active)
        prompt_text = stringsetloc("* INSERT 100+ POINTs TO PLAY./%", "obj_room_ranking_b_slash_Step_0_gml_41_0");
    else
        prompt_text = stringsetloc("* PLAY AGAIN?/%", "obj_room_ranking_b_slash_Step_0_gml_44_0");
    scr_speaker("no_name");
    msgset(0, prompt_text);
    var d = d_make();
    d.stay = 5;
}
if (gacha_con == 1 && !d_ex())
{
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#INSERT POINTs", "obj_room_ranking_b_slash_Step_0_gml_59_0");
    global.choicemsg[1] = stringsetloc("#Don't", "obj_room_ranking_b_slash_Step_0_gml_60_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    instance_create(0, 0, obj_pointdisplay);
    scr_speaker("no_name");
    msgset(0, "\\C2");
    d_make();
    gacha_con = 2;
}
if (gacha_con == 2 && global.choice != -1)
{
    k_d();
    if (global.choice == 0)
    {
        var can_afford = global.flag[1044] >= 100;
        if (can_afford)
        {
            gacha_con = 3;
        }
        else
        {
            regain_control();
            scr_speaker("no_name");
            msgsetloc(0, "* INSUFFICIENT POINTs./%", "obj_room_ranking_b_slash_Step_0_gml_89_0");
            d_make();
        }
    }
    else
    {
        regain_control();
        k_d();
    }
}
if (gacha_con == 3)
{
    gacha_con = 3.5;
    numentry = instance_create(x, y, obj_numberentry);
    numentry.minnum = 100;
    numentry.maxnum = global.flag[1044];
    numentry.biginc = 50;
    numentry.numinc = 5;
    numentry.buffmoddefault = 2;
    numentry.drawbox = false;
    numentry.xoff = 56;
    numentry.yoff = 171;
    numentry.num = gachacost;
    numentry.nokill = true;
    var off1 = 0;
    if (global.lang == "ja")
        off1 = 2;
    global.msg[0] = stringsetsubloc("~1 CONFIRM", scr_get_input_name(4), "obj_room_ranking_b_slash_Step_0_gml_114_0");
    controltext1 = instance_create(camerax() + 40 + 192, ((cameray() + 40 + 281) - 2) + off1, obj_writer);
    controltext1.skipme = 1;
    var off = 0;
    if (global.lang == "ja")
        off = 6;
    global.msg[0] = stringsetsubloc("~1 CANCEL", scr_get_input_name(5), "obj_room_ranking_b_slash_Step_0_gml_118_0");
    controltext2 = instance_create(camerax() + 40 + 192, cameray() + 40 + 24 + 281 + off, obj_writer);
    controltext2.skipme = 1;
}
if (gacha_con == 3.5)
{
    if (numentry.result != -1)
    {
        if (numentry.result == -2)
        {
            regain_control();
            safe_delete(numentry);
            safe_delete(controltext1);
            safe_delete(controltext2);
        }
        else if (numentry.result == 1225)
        {
            numentry.stayvis = true;
            global.interact = 1;
            timer = 0;
            gacha_con = 120;
        }
        else
        {
            snd_play(snd_equip);
            snd_play(snd_coin);
            gachacost = numentry.result;
            gacha_con = 4;
            global.flag[1044] -= gachacost;
            timer = 0;
            safe_delete(numentry);
            safe_delete(controltext1);
            safe_delete(controltext2);
        }
    }
}
if (gacha_con == 4)
{
    timer++;
    var count = min(round(gachacost / 10) + 1, 30);
    if (timer == 1)
    {
        gachaslot.visible = true;
        var coinoff = -16;
        var targx = obj_ch3_gachapon.x + 108 + coinoff;
        var targy = obj_ch3_gachapon.y + 212 + coinoff;
        for (var i = 0; i < count; i++)
        {
            var coin = scr_marker_ext(camerax() + ((i * 608) / count) + irandom_range(-30, 30), cameray() - 32 - irandom(90), spr_board_pointsGet, 2, 2, undefined, undefined, undefined, 10);
            with (coin)
            {
                depth = 96771;
                scr_doom(id, 55);
                var transitionlength = 30 + irandom(15);
                scr_lerpvar("image_alpha", 0, 1.2, transitionlength);
                scr_lerpvar("x", x, targx, transitionlength - 3, 2, "in");
                scr_lerpvar("y", y, targy + 32, transitionlength, 2, "in");
                var snd = 21;
                snd_stop_delay(snd, transitionlength);
                snd_play_delay(snd, transitionlength, 1, 1);
            }
        }
    }
    if (timer == 60)
    {
        gachaslot.visible = false;
        gacha_con = 5;
        start_gacha_event();
    }
}
if (gacha_con == 90 && !d_ex())
{
    gacha_con = -1;
    global.interact = 0;
    global.facing = 0;
}
if (gacha_con == 120)
{
    timer++;
    if (timer == 1)
    {
        snd_free_all();
        drawblue = true;
        bgalpha = 0;
        freezewall = true;
        with (obj_border_controller)
            set_custom_effect(2, 1);
    }
    if (timer >= 120)
    {
        safe_delete(numentry);
        safe_delete(controltext1);
        safe_delete(controltext2);
        drawblue = false;
        var blend = scr_marker_blend(0, 0, spr_pxwhite, 1, room_width, room_height, undefined, undefined, 0.5, #0B0B3B, 0);
        var dark = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, 0, 0, #0B0B3B, gachapon.depth + 10, undefined, undefined, 0.2);
        with (obj_marker)
        {
            if (sprite_index == spr_shine_white)
                instance_destroy();
        }
        scr_setparty(0);
        with (obj_doorAny)
            instance_destroy();
        with (obj_readable_room1)
        {
            if (extflag == "vending")
                instance_destroy();
        }
        with (gacha_block)
            instance_destroy();
        with (obj_npc_sign)
            instance_destroy();
        with (instance_create(280, 560, obj_solidblocksized))
            image_xscale = 4;
        with (instance_create(230, 280, obj_solidblocksized))
            scr_size(1.75, 2.6);
        with (instance_create(346, 280, obj_solidblocksized))
            scr_size(1.7, 2.6);
        safe_delete(gatrig);
        slot = scr_marker_ext(gachapon.x + 86, gachapon.y + 254, spr_dw_tv_gachapon_doorslot, 2, 2);
        slot.depth = gachapon.depth;
        gachapon.depth += 1;
        scr_marker_blend(0, 0, spr_pxwhite, 1, room_width, room_height, undefined, undefined, undefined, #0B0B3B, gachapon.depth + 10);
        with (instance_create(302, 332, obj_doorAny))
        {
            scr_size(1.05, 1.075);
            doorRoom = room_ch3_gacharoom_unknown;
            doorDelay = 120;
            doorFadeMusic = 1;
            doorFadeMusicTime = 120;
            doorEntrance = "A";
            doorFacing = 2;
        }
        gacha_con = 121;
        global.interact = 0;
    }
}
if (gacha_con == 121 && global.is_console)
{
    var fade_out = false;
    with (obj_doorAny)
    {
        if (doorRoom == room_ch3_gacharoom_unknown)
        {
            if (touched)
                fade_out = true;
        }
    }
    if (fade_out)
    {
        gacha_con = 122;
        with (obj_border_controller)
            hide_border(0.008);
    }
}
if (freezewall)
{
    with (obj_dw_green_room_wall_fx)
    {
        bg_speed = 0;
        bg_speed_y = 0;
    }
}
