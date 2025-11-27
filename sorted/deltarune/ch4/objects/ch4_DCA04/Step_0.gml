if (!init)
{
    init = 1;
    scr_populatechars();
}
var prophecyactive = 0;
with (obj_trigger)
{
    if (extflag == "prop")
    {
        if (place_meeting(x, y, obj_mainchara))
            prophecyactive = 1;
    }
}
with (roomglow)
    active = prophecyactive;
with (prophecy)
    active = prophecyactive;
if (con == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "cutscene1")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        with (instance_create(0, 1120, obj_solidblocksized))
            scr_size(2, 2);
        con = 0.1;
        global.interact = 1;
    }
}
if (con == 0.1)
{
    con = 0.2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    kris.visible = true;
    ralsei.visible = true;
    susie.visible = true;
    with (kris)
        scr_delay_var("visible", false, 1);
    with (ralsei)
        scr_delay_var("visible", false, 1);
    with (susie)
        scr_delay_var("visible", false, 1);
    with (obj_roomglow)
        create_highlight(obj_actor);
    c_pannable(1);
    c_wait(1);
    mus_fade(global.currentsong[1], 120);
    c_sel(su);
    c_facing("u");
    c_msgruncheck(true);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey!/%", "obj_ch4_DCA04_slash_Step_0_gml_81_0");
    c_talk_wait();
    c_sel(su);
    var supos = scr_heromarker("su", "spot1");
    c_walkdirect(supos[0], supos[1], 16);
    c_sel(kr);
    var krpos = scr_heromarker("kr", "spot1");
    c_walkdirect(krpos[0], krpos[1], 25);
    c_sel(ra);
    var rapos = scr_heromarker("ra", "spot1");
    c_walkdirect(rapos[0], rapos[1], 25);
    var campos = scr_heromarker("gen", "cam1loc");
    c_pan(campos[0], campos[1], 25);
    c_wait(17);
    c_sel(su);
    c_facing("u");
    c_wait(8);
    c_sel(ra);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_msgruncheck(false);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Hey^1, that's us^1, right?/", "obj_ch4_DCA04_slash_Step_0_gml_115_0");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* Yes^1, Susie^1! We are the Heroes of the Prophecy.../", "obj_ch4_DCA04_slash_Step_0_gml_117_0");
    var endbox = 6;
    if (global.flag[203] == 1)
    {
        endbox = 7;
        c_msgnextloc("\\EK* ..^1. Which^1, I^1, was trying to explain when we met.../", "obj_ch4_DCA04_slash_Step_0_gml_124_0");
        c_facenext("susie", "K");
        c_msgnextloc("\\EK* Okay^1, yeah^1, yeah^1, I get it./", "obj_ch4_DCA04_slash_Step_0_gml_126_0");
    }
    if (global.flag[203] == 0)
    {
        c_facenext("susie", "A");
        c_msgnextloc("\\EA* Yeah^1, guess you said something like that^1, huh./", "obj_ch4_DCA04_slash_Step_0_gml_133_0");
    }
    c_msgnextloc("\\E2* Still..^1. kinda..^1. cool to see us up there^1, y'know?/", "obj_ch4_DCA04_slash_Step_0_gml_137_0");
    c_msgnextloc("\\EN* ..^1. Kinda makes me feel like...", "obj_ch4_DCA04_slash_Step_0_gml_139_0");
    c_talk();
    c_wait_box(0);
    c_sel(su);
    c_sprite(spr_susie_head_scratch_dw);
    c_setxy(supos[0] - 2, supos[1] - 6);
    if (global.flag[203] == 1)
    {
        c_wait_box(3);
        c_sel(su);
        c_sel(ra);
        c_sprite(spr_ralsei_walk_up_sad);
        c_wait_box(5);
        c_sel(su);
        c_setxy(supos[0], supos[1] - 6);
        c_sprite(spr_susie_away_b);
        c_wait_box(6);
        c_sel(su);
        c_setxy(supos[0], supos[1] - 6);
        c_sprite(spr_susie_away_a);
    }
    else
    {
        c_wait_box(4);
        c_sel(su);
        c_setxy(supos[0], supos[1] - 6);
        c_sprite(spr_susie_away_b);
        c_wait_box(5);
        c_sel(su);
        c_setxy(supos[0], supos[1] - 6);
        c_sprite(spr_susie_away_a);
        c_wait_box(6);
        c_sel(su);
        c_setxy(supos[0] - 2, supos[1] - 6);
        c_sprite(spr_susie_head_scratch_dw);
    }
    c_wait_box(endbox);
    c_var_instance(id, "prophecyshatter", 1);
    c_waitcustom();
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* H-huh!?/", "obj_ch4_DCA04_slash_Step_0_gml_196_0");
    c_msgnextloc("\\EH* Hey^1, who the hell's messing with us!?/%", "obj_ch4_DCA04_slash_Step_0_gml_197_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* .../", "obj_ch4_DCA04_slash_Step_0_gml_202_0");
    c_msgnextloc("\\E1* (No answer...)/", "obj_ch4_DCA04_slash_Step_0_gml_203_0");
    c_msgnextloc("\\E0* ..^1. Let's be careful./%", "obj_ch4_DCA04_slash_Step_0_gml_204_0");
    c_talk_wait();
    c_panobj(kr_actor, 1);
    c_wait(1);
    c_wait(30);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_var_instance(id, "con", 0.9);
    c_terminatekillactors();
}
if (con == 0.9 && !i_ex(cutscene_master))
{
    global.interact = 0;
    room_goto(room_dw_church_ripseq1);
}
if (con == 2.79)
{
    con = 2.8;
    obj_mainchara.cutscene = 1;
    audio_sound_gain(global.currentsong[1], 0, 120000 / fps);
    var campos1 = scr_heromarker(undefined, "cam1");
    var campos2 = scr_heromarker(undefined, "cam2");
    campos1 = [campos2[0] + 400, campos2[1]];
    var cutscenendy = 918;
    camerax_set(campos1[0]);
    cameray_set(cutscenendy);
    layer_set_visible("WALLTILES", 1);
    with (ripple_manager)
        lightcon = 1;
    with (lighting)
        turn_off = false;
    if (scr_debug())
    {
        with (obj_border_controller)
            hide_border();
    }
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_wait(2);
    var supos1 = scr_heromarker("susie", "supos1");
    var supos2 = scr_heromarker("susie", "supos2");
    supos2 = [2866, 1104];
    var campanspeed = 8;
    var campantime = max(round(abs(campos1[0] - campos2[0]) / campanspeed), 1);
    c_pan(campos2[0], cutscenendy, campantime);
    c_wait(campantime);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Look^1! Light!/%", "obj_ch4_DCA04_slash_Step_0_gml_365_0");
    c_talk_wait();
    c_wait(1);
    c_sel(su);
    c_setxy(supos1[0], supos1[1]);
    var walktime = max(round(abs(supos1[0] - supos2[0]) / 8), 1);
    c_walkdirect(supos2[0], supos2[1], walktime);
    c_var_instance(id, "makerips", 1);
    c_wait(walktime);
    c_setxy(supos2[0], supos2[1]);
    c_speaker("susie");
    c_msgsetloc(0, "\\EW* Alright you losers.../%", "obj_ch4_DCA04_slash_Step_0_gml_387_0");
    c_talk();
    c_wait_talk();
    c_sel(su);
    c_walk("l", 2, 12);
    c_wait(12);
    c_autowalk(0);
    c_sprite(spr_susie_ready_axe);
    c_wait(12);
    c_var_lerp_to("image_index", 3, 12);
    c_speaker("susie");
    c_msgsetloc(0, "\\EY* BRING IT ON!!!/%", "obj_ch4_DCA04_slash_Step_0_gml_405_0");
    c_talk();
    c_var_instance(id, "makerips", 2);
    c_wait_talk();
    gerson_npc = instance_create(camerax() - 100, cameray() - 100, obj_npc_gerson);
    with (gerson_npc)
    {
        facing_right = true;
        current_state = 2;
        depth = 90000;
    }
    c_sel(kr);
    c_setxy(2510, 1120);
    c_sel(ra);
    c_setxy(2412, 1108);
    c_sprite(spr_ralsei_surprised_right);
    c_sel(kr);
    c_facing("r");
    c_var_instance(gerson_npc, "x", 2764);
    c_var_instance(gerson_npc, "y", 1094);
    c_var_instance(blackall, "visible", 1);
    c_var_instance(id, "makerips", -2);
    c_sound_play(snd_noise);
    c_wait(30);
    c_var_instance(gerson_npc, "current_state", 0);
    c_wait(4);
    c_customfunc(function()
    {
        with (obj_border_controller)
            show_border(1);
    });
    c_wait(1);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_switch);
    c_var_instance(gerson_npc, "anim_index", 2);
    c_var_instance(blackall, "visible", 0);
    c_sound_play(snd_noise);
    c_var_instance(lighting, "turn_off", true);
    c_var_instance(lamp_marker, "image_index", 0);
    c_var_instance(light_marker, "image_index", 1);
    c_var_instance(id, "hidewall", 1);
    c_wait(60);
    c_speaker("gerson");
    c_msgsetloc(0, "* Whatcha doin'?/%", "obj_ch4_DCA04_slash_Step_0_gml_533_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_facing("r");
    c_sound_play(snd_sussurprise);
    c_sel(su);
    c_sound_play(snd_jump);
    c_sprite(spr_susie_sheeh_flip);
    c_jump(2892, 1108, 20, 16);
    c_wait(60);
    c_sound_play(snd_noise);
    c_sprite(spr_susie_exasperated);
    c_addxy(0, -4);
    c_flip("x");
    c_shakeobj();
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Wh..^1. who..^1. huh..^1. what the HELL are YOU doing!?/%", "obj_ch4_DCA04_slash_Step_0_gml_560_0");
    c_talk_wait();
    c_mus2("initloop", "gerson_theme_intro.ogg", 0);
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait(60);
    c_var_instance(gerson_npc, "current_state", 0);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_walk_cane);
    c_wait(15);
    c_speaker("gerson");
    c_msgsetloc(0, "* Lookin' for the light switch./%", "obj_ch4_DCA04_slash_Step_0_gml_578_0");
    c_talk_wait();
    c_var_instance(gerson_npc, "current_state", 0);
    c_var_instance(gerson_npc, "facing_right", false);
    c_wait(5);
    c_var_instance(gerson_npc, "current_state", 4);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_exasperated_stare);
    c_speaker("gerson");
    c_msgsetloc(0, "* But^1, hrm. Seems I got a little lost./%", "obj_ch4_DCA04_slash_Step_0_gml_592_0");
    c_talk_wait();
    c_wait(30);
    c_var_instance(gerson_npc, "facing_right", true);
    c_var_instance(gerson_npc, "current_state", 0);
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 6);
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_exasperated);
    c_speaker("gerson");
    c_msgsetloc(0, "* You wouldn't mind walking me back to my study^1, wouldja?/", "obj_ch4_DCA04_slash_Step_0_gml_609_0");
    c_msgnextloc("* Got something I gotta finish writing^1, y'see.../%", "obj_ch4_DCA04_slash_Step_0_gml_610_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_exasperated_stare);
    c_wait(60);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch_dw);
    c_imagespeed(0.2);
    c_addxy(6, -6);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Yeah^1, uh^1, no. We're kinda in a hurry here./", "obj_ch4_DCA04_slash_Step_0_gml_626_0");
    c_msgnextloc("\\E0* We can't just babysit every random Darkner we meet./", "obj_ch4_DCA04_slash_Step_0_gml_627_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Ah^1, I see^1, I see. Good enough reason^1, that one./%", "obj_ch4_DCA04_slash_Step_0_gml_629_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_look_back_cross_arms);
    c_halt();
    c_flip("x");
    c_addxy(-6, 6);
    c_wait_box(3);
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait_talk();
    c_var_instance(gerson_npc, "current_state", 0);
    c_wait(5);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_walk_cane);
    c_wait(60);
    c_sel(su);
    c_facing("susieunhappy");
    c_autowalk(1);
    c_facing("l");
    c_walkdirect(2565, 1104, 60);
    c_pan(2400, cameray(), 60);
    c_wait(18);
    c_var_instance(gerson_npc, "facing_right", false);
    c_wait(16);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "y", 1117, 15);
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 0);
    c_wait(5);
    c_msgzurasu(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* So anyway^1, we'll be.../", "obj_ch4_DCA04_slash_Step_0_gml_680_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* What's a Darkner^1, anyhoo?/%", "obj_ch4_DCA04_slash_Step_0_gml_682_0");
    c_talk();
    c_wait_box(2);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 2680, 15);
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 2);
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_wait(30);
    c_facing("r");
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_halt();
    c_walk("r", 2, 12);
    c_imageindex(1);
    c_wait(6);
    c_imageindex(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EG* You mean you don't.../%", "obj_ch4_DCA04_slash_Step_0_gml_711_0");
    c_talk_wait();
    c_wait(30);
    c_facing("l");
    c_wait(15);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* (Kris^1, if this guy's not a Darkner^1, then...)/%", "obj_ch4_DCA04_slash_Step_0_gml_721_0");
    c_talk_wait();
    c_sel(su);
    c_wait(10);
    c_facing("r");
    c_halt();
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch_dw);
    c_imagespeed(0.2);
    c_addxy(0, -6);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* (Ugh^1, things'll get messy if he gets hurt!)/", "obj_ch4_DCA04_slash_Step_0_gml_747_0");
    c_msgnextloc("\\EP* Fine^1! You can go with us. Just don't slow us down./", "obj_ch4_DCA04_slash_Step_0_gml_748_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Hmm^1, alright^1, alright. You got it^1, little missy!/%", "obj_ch4_DCA04_slash_Step_0_gml_750_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_halt();
    c_sprite(spr_susie_exasperated);
    c_addxy(0, 6);
    c_shakeobj();
    c_wait_box(3);
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait_talk();
    c_sel(su);
    c_facing("l");
    c_var_instance(gerson_npc, "current_state", 0);
    c_wait(5);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_walk_cane);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    con = 4;
}
if (con == 4 && !i_ex(obj_cutscene_master))
{
    global.interact = 3;
    global.entrance = 5;
    global.facing = 0;
    global.plot = 140;
    global.tempflag[90] = 1;
    room_goto(room_dw_church_ripplepuzzle_postgers);
    con = 99;
}
if (hidewall)
{
    hidewall = 0;
    layer_set_visible("WALLTILES", 0);
}
if (prophecyshatter == 1)
{
    var trig = 0;
    with (obj_writer)
    {
        if (reachedend)
            trig = 1;
    }
    if (trig)
    {
        proptimer = 0;
        prophecyshatter = 1.1;
    }
}
if (prophecyshatter == 1.1)
{
    proptimer++;
    var hammerjumptime = 28;
    if (proptimer == 1)
    {
        snd_play(snd_wing);
        hammer = scr_marker_ext(camerax() + 680, cameray() + 320, spr_gerson_hammer_trowable2, 2, 2, undefined, undefined, undefined, 500, undefined, undefined);
        with (hammer)
        {
            scr_lerpvar("image_angle", 0, 1080, hammerjumptime);
            scr_jump_to_point((camerax() + 324) - 24, cameray() + 122, 20, hammerjumptime, true);
            scr_lerp_imageblend(id, c_white, c_black, hammerjumptime);
        }
        with (obj_camera_clamper)
            instance_destroy();
    }
    if (proptimer == (1 + hammerjumptime))
    {
        with (hammer)
        {
            scr_afterimagefast();
            instance_destroy();
        }
        var imsusie = 0;
        with (obj_actor)
        {
            if (name == "susie")
            {
                x += 14;
                y += 10;
                sprite_index = spr_susie_shocked_behind;
                scr_shakeobj();
                imsusie = id;
            }
            if (name == "ralsei")
            {
                sprite_index = spr_ralsei_shocked_behind;
                scr_shakeobj();
            }
        }
        with (obj_floorshadow)
        {
            if (target == imsusie)
            {
                ignorepreset = true;
                yoff -= 18;
            }
        }
        snd_play(snd_wing);
        with (obj_dialoguer)
            instance_destroy();
        with (obj_writer)
            instance_destroy();
        with (prophecy)
            destroy = 1;
        with (obj_actor)
        {
            scr_lerp_imageblend(id, c_white, c_black, 15);
            scr_delay_var("image_blend", 0, 16);
            with (obj_floorshadow)
            {
                scr_limitval_clamp(id, "stretch", 2, 2);
                scr_limitval_clamp(id, "image_alpha", 2, 2);
            }
        }
        propfade = scr_marker_ext(camerax() - 40, cameray() - 40, spr_pxwhite, 3840, 560, undefined, undefined, c_black, 699991);
        propfade.image_alpha = 0;
        with (propfade)
            scr_lerpvar("image_alpha", 0, 1, 16);
        with (obj_trigger)
        {
            if (extflag == "prop")
                instance_destroy();
        }
        with (obj_border_controller)
            hide_border(0.025);
    }
    if (proptimer == (1 + hammerjumptime + 30))
    {
        with (obj_mainchara)
            image_blend = c_black;
        with (obj_caterpillarchara)
            image_blend = c_black;
        customcon = 0;
        c_waitcustom_end();
        prophecyshatter = 4;
    }
}
var chasersversion = 1;
if (chasersversion == 0)
{
    if (makerips)
    {
        var cx = camerax();
        var cy = cameray();
        var targ = 0;
        with (obj_actor)
        {
            if (name == "susie")
                targ = id;
        }
        var pace = 30;
        var ripsize = 120;
        var count = 2;
        var offset = 0;
        if (makerips == 2)
        {
            count = 4;
            pace = 20;
            ripsize = 240;
            offset = 40;
        }
        var xlocs = [cx + 640 + 80, cx + 640 + 80, cx + 480, cx + 480];
        var ylocs = [cy + 80 + offset, (cy + 480) - 80 - offset, cy - 80, cy + 480 + 80];
        riptime++;
        if ((riptime % pace) == 0)
        {
            for (var i = 0; i < count; i++)
            {
                var _hhsp = lengthdir_x(2, point_direction(x, y, targ.x + 40, targ.y + 60));
                var _vvsp = lengthdir_y(2, point_direction(x, y, targ.x + 40, targ.y + 60));
                scr_fancy_ripple_alt(xlocs[i], ylocs[i], 60, 255, ripsize, 1, 12, 500, _hhsp, _vvsp);
            }
        }
    }
    if (makerips == -2)
    {
        with (obj_church_ripple)
            instance_destroy();
        with (obj_fancy_ripples)
            instance_destroy();
        with (obj_fancy_ripples_alt)
            instance_destroy();
        makerips = 0;
    }
}
if (chasersversion == 1)
{
    var cx = camerax();
    var cy = cameray();
    if (makerips == 1)
    {
        makerips = 1.1;
        depth = 5000;
        var ripper = instance_create(cx + 640 + 80, (cy + 0) - 80, obj_dw_church_waterfallchaser);
        ripper.targx = (cx + 640) - 80;
        ripper.targy = cy + 80 + 80;
        array_push(chaser, ripper);
        ripper = instance_create(cx + 640 + 80, cy + 480 + 80, obj_dw_church_waterfallchaser);
        array_push(chaser, ripper);
        ripper.targx = (cx + 640) - 80;
        ripper.targy = (cy + 480) - 80 - 80;
    }
    if (makerips == -2)
    {
        with (obj_dw_church_waterfallchaser)
            instance_destroy();
        with (obj_church_ripple)
            instance_destroy();
        with (obj_fancy_ripples)
            instance_destroy();
        with (obj_fancy_ripples_alt)
            instance_destroy();
        makerips = 0;
    }
}
