if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 10;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 200, cameray() + 420, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_pose_podium;
    te_actor.preset = 0;
    c_sel(kr);
    c_setxy(320, 280);
    c_sprite(spr_kris_chef);
    c_autodepth(0);
    c_depth(95000);
    c_sel(su);
    c_setxy(95, 160);
    c_sprite(spr_susie_trapped_despondent);
    c_sel(ra);
    c_setxy(497, 162);
    c_sprite(spr_ralsei_trapped_press);
    c_autowalk(0);
    c_imagespeed(0.1);
    c_sel(te);
    c_autodepth(0);
    c_depth(94000);
    c_var_instance(blackall, "depth", 96000);
    c_var_instance(blackall, "image_alpha", 0.5);
    var susie_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    susie_gacha.actor_target = su_actor;
    susie_gacha.mode = 4;
    susie_gacha.depth = 97000;
    with (susie_gacha)
        set_pos(95, 206);
    var ralsei_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    ralsei_gacha.actor_target = ra_actor;
    ralsei_gacha.mode = 2;
    ralsei_gacha.depth = 97100;
    with (ralsei_gacha)
        set_pos(497, 204);
    ralsei_gacha.ball_angle = 0;
    c_wait(60);
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose);
    c_tenna_preset(32);
    c_sound_play(snd_wing);
    c_lerp_var_instance(te_actor, "x", camerax() + view_wport[0] + 200, 433, 15, 3, "out");
    c_wait(30);
    c_msgside("top");
    c_speaker("tenna");
    c_msgsetloc(0, "* Ahhh..^1. Kris^1, remember when your brother was here?/", "obj_room_chef_empty_slash_Step_0_gml_35_0");
    c_msgnextloc("* You used to spend so^1, so^1, much time with him./%", "obj_room_chef_empty_slash_Step_0_gml_36_0");
    c_talk_wait();
    c_tenna_preset(0);
    c_var_lerp_to_instance(te_actor, "x", 390, 30, 2, "out");
    c_var_lerp_to_instance(te_actor, "y", 485, 30, 2, "out");
    c_wait(60);
    c_tenna_preset(0);
    c_var_lerp_to_instance(te_actor, "image_xscale", 3.2, 7.5, 2, "out");
    c_speaker("tenna");
    c_msgsetloc(0, "* With me./%", "obj_room_chef_empty_slash_Step_0_gml_42_0");
    c_talk_wait();
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(te_actor, "x", 433, 7.5, 2, "out");
    c_var_lerp_to_instance(te_actor, "y", cameray() + 420, 7.5, 2, "out");
    c_var_lerp_to_instance(te_actor, "image_xscale", 2, 7.5, 2, "out");
    c_wait(15);
    c_tenna_sprite(spr_tenna_laugh_pose);
    c_speaker("tenna");
    c_msgsetloc(0, "* Watching cartoons. Playing games./", "obj_room_chef_empty_slash_Step_0_gml_48_0");
    c_msgnextloc("* Smiling. Laughing. Crying./%", "obj_room_chef_empty_slash_Step_0_gml_54_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_laugh);
    c_imagespeed(0.2);
    c_wait_talk();
    c_imagespeed(0);
    c_wait(30);
    c_sel(te);
    c_imagespeed(0);
    c_tenna_preset(8);
    c_speaker("tenna");
    c_msgsetloc(0, "* Why?/", "obj_room_chef_empty_slash_Step_0_gml_60_0");
    c_msgnextloc("* Why don't you two do that anymore...?/%", "obj_room_chef_empty_slash_Step_0_gml_61_0");
    c_talk_wait();
    c_wait(15);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_hurt);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* What!? He went to COLLEGE?/", "obj_room_chef_empty_slash_Step_0_gml_67_0");
    c_msgnextloc("* Well..^1. why'd he have to go do THAT!?/", "obj_room_chef_empty_slash_Step_0_gml_73_0");
    c_msgnextloc("* You.^4 Can learn.^4 ANYTHING^1!^4 On TV^1!/", "obj_room_chef_empty_slash_Step_0_gml_79_0");
    c_msgnextloc("* Ahahahah!!!/%", "obj_room_chef_empty_slash_Step_0_gml_80_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_tie_adjust_c);
    c_tenna_preset(8);
    c_wait_box(2);
    c_tenna_preset(2);
    c_wait_box(3);
    c_tenna_preset(-1);
    c_tenna_sprite(spr_tenna_laugh);
    c_imagespeed(0.4);
    c_wait_talk();
    c_sound_play(snd_wing);
    c_var_lerp_to_instance(te_actor, "x", camerax() + view_wport[0] + 200, 15, 3, "out");
    c_wait(60);
    c_sprite(spr_tenna_tie_adjust_a);
    c_halt();
    c_sound_play(snd_wing);
    c_var_lerp_to_instance(te_actor, "x", 433, 15, 3, "out");
    c_speaker("tenna");
    c_msgsetloc(0, "* Yes. The instructions. Right. The INSTRUCTIONS!!!!/%", "obj_room_chef_empty_slash_Step_0_gml_92_0");
    c_talk_wait();
    c_var_instance(id, "show_arrows", true);
    c_var_lerp_to_instance(pipe_left, "x", 0, 30, 3, "out");
    c_var_lerp_to_instance(pipe_right, "x", 642, 30, 3, "out");
    c_wait(15);
    c_tenna_preset(18);
    c_speaker("tenna");
    c_msgsetloc(0, "* They're coming out of the pipes./", "obj_room_chef_empty_slash_Step_0_gml_101_0");
    c_msgnextloc("* They're crawling out of the pipes./", "obj_room_chef_empty_slash_Step_0_gml_102_0");
    c_msgnextloc("* Where are they going...!?/", "obj_room_chef_empty_slash_Step_0_gml_108_0");
    c_msgnextloc("* Hahaha..^1. I..^1. don't..^1. KNOW!!/%", "obj_room_chef_empty_slash_Step_0_gml_114_0");
    c_talk();
    c_wait_box(2);
    c_tenna_preset(0);
    c_imagespeed(0);
    c_wait_box(3);
    c_tenna_sprite(spr_tenna_laugh);
    c_imagespeed(0.4);
    c_wait_talk();
    c_var_instance(id, "hide_arrows", true);
    c_var_lerp_to_instance(te_actor, "x", camerax() + view_wport[0] + 200, 30, 3, "out");
    c_speaker("tenna");
    c_msgsetloc(0, "* Ahahahahahaha!!!/%", "obj_room_chef_empty_slash_Step_0_gml_120_0");
    c_talk_wait();
    c_var_instance(id, "game_active", true);
    c_waitcustom();
}
if (game_active && !d_ex() && customcon == 1)
{
    game_active = false;
    global.interact = 0;
    scr_flag_set(7, 1);
    instance_create(0, 0, obj_ch3_b4_chef_controller);
    var kris_chef = instance_create(kr_actor.x, kr_actor.y, obj_ch3_b4_chef_kris);
    scr_darksize(kris_chef);
    kr_actor.visible = 0;
}
if (bgm != -4)
{
    bgm_timer++;
    bgm_pitch = 1 + sin(bgm_timer / 20);
    audio_sound_pitch(bgm_track[1], bgm_pitch);
}
if (con == 10 && i_ex(obj_ch3_b4_chef_controller))
{
    if (timer_max == 0)
    {
        timer_max = obj_ch3_b4_chef_controller.timer_max * 30;
        with (obj_dw_chef_screen_empty)
            start_countdown();
    }
    if (!obj_dw_chef_screen_empty.countdown)
    {
        timer++;
        if (timer == 1)
        {
            bgm_track[0] = snd_init("alley_ambience.ogg");
            bgm_track[1] = mus_loop(bgm_track[0]);
            with (obj_ch3_b4_chef_controller)
                start_game();
            icee_travel = true;
        }
        var current_progress = 1 - (timer / timer_max);
        with (screen)
            set_progress(current_progress);
    }
    if (obj_ch3_b4_chef_controller.gameover)
    {
        con = 19;
        alarm[0] = 30;
        global.interact = 1;
        icee_travel = false;
    }
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = -1;
    snd_free(bgm_track[0]);
    var screen_wipe = instance_create(0, 0, obj_ch3_screen_wipe);
    screen_wipe.target_room = room_ch3_gameshowroom;
    screen_wipe.start = true;
}
if (show_arrows)
{
    arrow_timer++;
    if (arrow_timer == 1)
    {
        for (var i = 0; i < array_length_1d(arrow_markers); i++)
            scr_lerp_var_instance(arrow_markers[i], "image_alpha", 0, 1, 30, 2, "out");
    }
    arrow_siner += 0.2;
    for (var i = 0; i < array_length_1d(arrow_markers); i++)
        arrow_markers[i].y = arrow_markers[i].y + sin(arrow_siner);
    if (hide_arrows)
    {
        show_arrows = false;
        for (var i = 0; i < array_length_1d(arrow_markers); i++)
            scr_lerp_var_instance(arrow_markers[i], "image_alpha", 1, 0, 30, 2, "out");
    }
}
if (icee_travel)
{
    icee_travel_timer++;
    if (icee_travel_timer == 1)
    {
        pipe_left.image_index = 1;
        pipe_right.image_index = 1;
        for (var i = 0; i < 4; i++)
        {
            icee[i] = scr_dark_marker(view_wport[0], 466, spr_dw_pipe_icee);
            icee[i].depth = 94000;
            icee[i].image_blend = c_black;
        }
    }
    for (var i = 0; i < array_length_1d(icee); i++)
    {
        var current_icee = icee[i];
        if (icee_travel_timer >= (i * 90))
        {
            var style = ((i % 2) == 1) ? 0 : 1;
            if ((icee_travel_timer % 30) == 1)
            {
                if ((i % 2) == 1)
                {
                    scr_lerp_instance_var(current_icee, "image_yscale", 2, 1.8, 10, -2, "out");
                    scr_lerp_instance_var(current_icee, "image_xscale", 2, 2.4, 10, -2, "out");
                }
                else
                {
                    scr_lerp_instance_var(current_icee, "image_yscale", 1.8, 2, 10, -2, "out");
                    scr_lerp_instance_var(current_icee, "image_xscale", 2.4, 2, 10, -2, "out");
                }
            }
            if ((icee_travel_timer % 60) == 1)
            {
                if ((i % 2) == 1)
                {
                    scr_lerp_instance_var(current_icee, "image_yscale", 1.8, 2, 10, -2, "out");
                    scr_lerp_instance_var(current_icee, "image_xscale", 2.4, 2, 10, -2, "out");
                }
                else
                {
                    scr_lerp_instance_var(current_icee, "image_yscale", 2, 1.8, 10, -2, "out");
                    scr_lerp_instance_var(current_icee, "image_xscale", 2, 2.4, 10, -2, "out");
                }
            }
            with (current_icee)
            {
                var target_pos = camerax() - 45;
                if (x > target_pos)
                    x = scr_movetowards(x, target_pos, 2);
                else
                    x = camerax() + view_wport[0] + 45;
            }
        }
    }
}
