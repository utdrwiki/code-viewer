if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 2.5;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 420, cameray() + 274, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_pose_podium;
    te_actor.preset = 0;
    c_sel(te);
    c_autodepth(0);
    c_depth(blackall.depth - 10);
    c_sel(kr);
    c_facing("u");
    c_setxy(80, 180);
    c_sel(su);
    c_facing("u");
    c_setxy(166, 164);
    c_sel(ra);
    c_facing("u");
    c_setxy(250, 167);
    c_waitcustom();
}
if (con == 2.5 && !i_ex(obj_round_evaluation_fg) && customcon == 1)
{
    con = 3;
    customcon = 0;
    c_waitcustom_end();
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EH* Look Kris!^1! We won!!^1! We won!!!/%", "obj_ch3_GSA06_slash_Step_0_gml_51_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Woah^1, it's over already? Damn^1, we were just having fun!!/%", "obj_ch3_GSA06_slash_Step_0_gml_59_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_wave_start);
    c_flip("x");
    c_addxy(-8, 0);
    c_imagespeed(0.2);
    c_delaycmd(15, "sprite", spr_ralsei_wave_down);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EP* See you next episode everyone!!/%", "obj_ch3_GSA06_slash_Step_0_gml_76_0");
    c_talk_wait();
    c_var_instance(id, "audience_sfx_start", true);
    c_var_instance(audience_cheer, "audience_active", true);
    c_var_instance(audience_cheer, "audience_show", true);
    c_var_instance(audience_cheer, "rose_throw", true);
    c_sel(su);
    c_autowalk(0);
    c_flip("x");
    c_sprite(spr_susie_clap);
    c_imagespeed(0.3);
    c_wait(120);
    c_var_instance(id, "audience_sfx_lower", true);
    c_wait(16);
    c_var_instance(id, "show_credits", true);
    c_var_lerp_instance(su_actor, "image_speed", 0.3, 0, 110);
    c_wait(120);
    c_imageindex(1);
    c_wait(24);
    c_flip("x");
    c_sprite(spr_susie_down_dw);
    c_wait(40);
    c_sel(ra);
    c_sprite(spr_ralsei_down);
    c_wait(15);
    c_flip("x");
    c_sprite(spr_ralsei_left);
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_right_dw);
    c_wait(40);
    c_sprite(spr_susie_walk_back_arm);
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_smile_up);
    c_wait(16);
    c_sel(te);
    c_sprite(spr_tenna_kick);
    c_var_instance(id, "tenna_kick", true);
    c_wait(15);
    c_imagespeed(1.5);
    c_var_instance(audience_cheer, "rose_throw", false);
    c_wait(10);
    c_sound_play_x(snd_whip_crack_only, 1, 1);
    c_sound_play_x(snd_orchhit, 1, 0.85);
    c_var_instance(id, "credits_kick", true);
    c_mus("free_all");
    c_var_instance(audience_cheer, "audience_pause", true);
    c_sel(su);
    c_halt();
    c_sprite(spr_susie_shock_r);
    c_shakeobj();
    c_sel(ra);
    c_sprite(spr_ralsei_surprise_right);
    c_shakeobj();
    c_wait(13);
    c_sel(te);
    c_imagespeed(0);
    c_wait(1);
    c_var_instance(id, "audience_sfx_stop", true);
    c_var_instance(audience_cheer, "audience_hide", true);
    c_var_instance(id, "credits_stop", true);
    c_tenna_sprite(spr_tenna_kick);
    c_imageindex(5);
    c_tenna_preset(15);
    c_var_lerp_instance(te_actor, "wobbleamt", 6, 0, 30);
    scr_funnytext_init(0, 0, -14, 1817, 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* STOP^1! STOP^1! \\O0^1!!!/%", "obj_ch3_GSA06_slash_Step_0_gml_200_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_preset(12);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_halt();
    c_speaker("tenna");
    c_msgsetloc(0, "* It CAN'T be over already!^1! NO!!/%", "obj_ch3_GSA06_slash_Step_0_gml_217_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_up);
    c_var_instance(te_actor, "wobblestate", 3);
    c_snd_play_x(snd_slidewhistle, 1, 0.5);
    var x_offset = (global.lang == "ja") ? -20 : 0;
    c_var_lerp_instance(funometer, "x", 640, 569 + x_offset, 12, 2, "out");
    c_wait(12);
    c_var_instance(funometer, "fun", 0.8);
    c_wait(50);
    c_sel(te);
    c_tenna_sprite(spr_tenna_whisper);
    c_var_instance(te_actor, "facing", "l");
    c_var_instance(te_actor, "wobblestate", 1);
    c_var_instance(te_actor, "wobbletime", 4);
    c_var_instance(te_actor, "wobbleamt", 20);
    scr_funnytext_init(1, -6, -14, scr_84_get_sprite("spr_funnytext_fun_o_meter"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* The \\O1's still only at 80`%!!/", "obj_ch3_GSA06_slash_Step_0_gml_245_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* Huh?/%", "obj_ch3_GSA06_slash_Step_0_gml_247_0");
    c_talk_wait();
    c_tenna_preset(5);
    c_speaker("tenna");
    c_msgsetloc(0, "* Ah^1, you see.../", "obj_ch3_GSA06_slash_Step_0_gml_253_0");
    c_msgnextloc("* That was just.../%", "obj_ch3_GSA06_slash_Step_0_gml_254_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(te_actor, "wobblestate", 11);
    c_var_instance(te_actor, "wobbleamt", 20);
    c_var_instance(te_actor, "changespeed", 8);
    c_wait_talk();
    c_wait(30);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_sel(te);
    c_imageindex(3);
    c_wait(45);
    c_snd_play(snd_bell);
    c_var_instance(gameshow_screen, "round_text", "1");
    c_var_instance(gameshow_screen, "switch_game_screen", true);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_up);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right_walk);
    c_sel(su);
    c_sprite(spr_susie_surprised_subtle_right);
    c_wait(30);
    c_mus2("initloop", "nes_intro_extended_part2.ogg", 0);
    c_mus2("volume", 0.5, 0);
    c_mus2("pitch", 1.1, 0);
    scr_funnytext_init(2, 0, -14, 4464, 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* ..^1. \\O2^1/", "obj_ch3_GSA06_slash_Step_0_gml_283_0");
    c_facenext("ralsei", 21);
    c_msgnextloc("\\EL* There's..^1. more than one round...?/%", "obj_ch3_GSA06_slash_Step_0_gml_285_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_preset(2);
    c_wait(1);
    c_var_instance(te_actor, "facing", "l");
    c_tenna_sprite(spr_tenna_point_up_twofingers);
    c_var_instance(te_actor, "wobblestate", 1);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_var_instance(gameshow_screen, "screen_sub_state", "next_board_2");
    var round_sprite = (global.lang == "ja") ? 3055 : 3603;
    scr_funnytext_init(3, 0, -14, round_sprite, 0, 0);
    scr_funnytext_init(4, 0, -16, 3055, 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Of course!^1! There's 2&\\O3!^1! 2!!/", "obj_ch3_GSA06_slash_Step_0_gml_299_0");
    c_msgnextloc("* You haven't ever heard of a game show with just ONE&\\O4^1, have you!?/", "obj_ch3_GSA06_slash_Step_0_gml_300_0");
    c_facenext("susie", "C");
    c_msgnextloc("\\EC* Uhh^1, nobody except grandmas really even watch -/%", "obj_ch3_GSA06_slash_Step_0_gml_302_0");
    c_talk_wait();
    c_tenna_preset(12);
    scr_funnytext_init(5, 0, 0, scr_84_get_sprite("spr_funnytext_know_tv"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Exactly!^1! It's preposterous!^1! Outrageous!^1! It'd be bad TV!!/", "obj_ch3_GSA06_slash_Step_0_gml_313_0");
    c_msgnextloc("* \\O5/", "obj_ch3_GSA06_slash_Step_0_gml_314_0");
    c_facenext("susie", "9");
    c_msgnextloc("\\E9* ..^1. heh^1, well^1, I guess we WERE having fun./", "obj_ch3_GSA06_slash_Step_0_gml_316_0");
    c_facenext("ralsei", "H");
    c_msgnextloc("\\EH* ..^1. Yeah^1! We can play another round!/%", "obj_ch3_GSA06_slash_Step_0_gml_318_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_whisper);
    c_var_instance(te_actor, "facing", "l");
    c_var_instance(te_actor, "wobblestate", 1);
    c_var_instance(te_actor, "wobbletime", 4);
    c_var_instance(te_actor, "wobbleamt", 20);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_smile);
    c_wait_box(4);
    c_sprite(spr_susie_right_dw);
    c_sel(ra);
    c_flip("x");
    c_sprite(spr_ralsei_smile_up);
    c_wait_talk();
    c_wait(30);
    c_mus("free_all");
    c_flip("x");
    c_sprite(spr_ralsei_walk_right_blush);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* Can we..^1. change Susie's name though?/%", "obj_ch3_GSA06_slash_Step_0_gml_347_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_preset(1);
    c_autodepth(1);
    scr_funnytext_init(6, 0, -10, scr_84_get_sprite("spr_funnytext_word"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Great!^1! And no!^1! And now^1, a&\\O6 from our sponsors!!/%", "obj_ch3_GSA06_slash_Step_0_gml_359_0");
    c_talk_wait();
    c_sound_play(snd_clown_song);
    c_var_instance(id, "word_display", true);
    c_wait(60);
    c_var_instance(audience_cheer, "audience_active", false);
    c_var_instance(id, "change_rooms", true);
    c_waitcustom();
}
if (change_rooms)
{
    change_rooms = false;
    global.interact = 0;
    global.plot = 120;
    con = 99;
    room_goto(room_dw_green_room);
}
if (show_credits)
{
    show_credits = false;
    snd_volume(global.currentsong[1], 0.25, 10);
    if (i_ex(obj_ch3_GSA06_credits))
    {
        with (obj_ch3_GSA06_credits)
            instance_destroy();
    }
    credits = instance_create(0, 0, obj_ch3_GSA06_credits);
    credits.text_scroll = true;
    credits.depth = audience_cheer.depth - 50;
    credits.blackall.depth = audience_cheer.depth - 10;
}
if (credits_kick)
{
    credits_kick = false;
    with (credits)
        text_kick = true;
}
if (credits_stop)
{
    credits_stop = false;
    snd_free_all();
    with (credits)
        credits_stop = true;
}
if (word_display)
{
    word_display = false;
    with (credits)
        word_mode = true;
    with (obj_border_controller)
        set_border(scr_84_get_sprite("border_dw_word"), 1);
}
if (tenna_kick)
{
    tenna_kick_timer++;
    if (tenna_kick_timer == 1)
    {
        snd_play_x(snd_drumroll, 0.9, 1.2);
        scr_lerp_var_instance(te_actor, "x", camerax() + view_wport[0] + 420, 480, 15, -1, "out");
    }
    if (tenna_kick_timer >= 1 && tenna_kick_timer < 16)
    {
        c_script_instance(te_actor, scr_afterimage, 1);
        var afterimage = instance_create_depth(te_actor.x, te_actor.y, te_actor.depth + 1, obj_afterimage);
        afterimage.sprite_index = te_actor.sprite_index;
        afterimage.image_alpha = 0.6;
        afterimage.fadeSpeed = 0.02;
        afterimage.image_index = te_actor.image_index;
        afterimage.image_speed = 0;
        afterimage.image_xscale = te_actor.image_xscale;
        afterimage.image_yscale = te_actor.image_yscale;
        afterimage.image_blend = c_blue;
    }
}
if (audience_sfx_start)
{
    audience_sfx_start = false;
    audience_sfx[1] = mus_loop_ext(audience_sfx[0], 1, 1);
}
if (audience_sfx_stop)
{
    audience_sfx_stop = false;
    snd_volume(audience_sfx[1], 0, 30);
}
if (audience_sfx_lower)
{
    audience_sfx_lower = false;
    snd_volume(audience_sfx[1], 0.4, 10);
}
