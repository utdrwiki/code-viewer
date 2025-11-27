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
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + 412, cameray() + 274, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_pose_podium;
    te_actor.preset = 0;
    te_actor.y = cameray() - 300;
    if (scr_debug() && keyboard_check(ord("F")))
    {
        scr_debug_print("save/load enabled");
        saveload = true;
    }
    if (saveload)
    {
        scr_cutscene_save_objects(darken, blackall, bg_vfx, tv_time, counter_marker, chefhat, tut);
        scr_cutscene_save_song();
    }
}
if (con == 3)
{
    con = 4;
    c_sel(kr);
    c_setxy(308, 256);
    c_sprite(spr_kris_chef);
    c_autodepth(0);
    c_depth(97000);
    c_sel(su);
    c_setxy(96, 160);
    c_sprite(spr_susie_chef_sheeh);
    c_sel(ra);
    c_setxy(494, 162);
    c_sprite(spr_ralsei_chef_surprised_down);
    c_var_instance(darken, "depth", 98000);
    c_var_instance(blackall, "visible", 0);
    c_wait(5);
    c_var_instance(bg_vfx, "con", 1);
    c_wait(5);
    c_var_instance(blackall, "visible", 1);
    c_var_instance(bg_vfx, "show_overlay", false);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* What the.../", "obj_ch3_GSA04_slash_Step_0_gml_79_0");
    c_msgnextloc("\\EH* The hell did you do to us!?/%", "obj_ch3_GSA04_slash_Step_0_gml_80_0");
    c_talk_wait();
    c_wait(15);
    c_var_instance(bg_vfx, "con", 2);
    c_var_instance(blackall, "visible", 0);
    c_sound_play_x(snd_orchhit, 1, 1);
    c_wait(40);
    c_sound_play_x(snd_orchhit, 1, 1.125);
    c_var_instance(bg_vfx, "screen_pos_index", 1);
    c_wait(40);
    c_sound_play_x(snd_orchhit, 1, 1.1875);
    c_var_instance(bg_vfx, "screen_pos_index", 2);
    c_wait(40);
    c_sound_play_x(snd_orchhit, 1, 1.25);
    c_var_instance(darken, "visible", 0);
    c_var_instance(bg_vfx, "con", -1);
    c_var_instance(screen, "con", 0);
    c_wait(30);
    c_var_instance(id, "show_border", true);
    c_sel(te);
    c_autodepth(0);
    c_depth(kr_actor.depth + 100);
    c_sel(te);
    c_sprite(spr_tenna_whisper_chef);
    c_var_lerp_instance(te_actor, "y", cameray() - 200, cameray() + 294, 16, 4, "in");
    c_wait(18);
    c_tenna_sprite(spr_tenna_whisper_chef);
    c_var_instance(te_actor, "bounce", 1);
    c_shake();
    c_sound_play(snd_impact);
    c_mus2("initloop", "ch3_tvtime.ogg", 0);
    scr_funnytext_init(0, 0, -10, scr_84_get_sprite("spr_funnytext_physical_challenge"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Hon hon!^1! Cool your burners^1, folks!!/", "obj_ch3_GSA04_slash_Step_0_gml_147_0");
    c_msgnextloc("* Today's \\O0.../%", "obj_ch3_GSA04_slash_Step_0_gml_148_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(8);
    c_tenna_sprite(spr_tenna_hooray_chef);
    c_addxy(10, -20);
    c_wait_talk();
    c_tenna_preset(0);
    c_animate(0, 3, 0.75);
    c_wait(3);
    c_var_instance(te_actor, "bounce", 1);
    c_wait(10);
    c_snd_play(snd_item);
    c_var_instance(screen, "food_screen", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* Is the COOKING CHANNEL!/%", "obj_ch3_GSA04_slash_Step_0_gml_181_0");
    c_talk_wait();
    c_wait(3);
    c_tenna_preset(2);
    c_var_instance(te_actor, "bounce", 1);
    c_var_instance(chefhat, "sprite_index", spr_tenna_chef_hat);
    c_var_instance(chefhat, "depth", 96470);
    c_setxy_instance(chefhat, camerax() + 429, cameray() + 90);
    c_var_instance(chefhat, "y", cameray() + 62);
    c_var_lerp_instance(chefhat, "image_angle", 0, 180, 10, 1, "out");
    c_var_lerp_instance(chefhat, "x", camerax() + 428, camerax() + 310, 20);
    c_var_lerp_instance(chefhat, "y", cameray() + 62, cameray() + 12, 5, 1, "out");
    c_wait(10);
    c_var_lerp_instance(chefhat, "image_angle", 180, 360, 10, 1, "in");
    c_var_lerp_instance(chefhat, "y", cameray() + 12, cameray() + 204, 10, 1, "in");
    c_wait(10);
    c_snd_play(snd_noise);
    c_sel(su);
    c_sprite(spr_susie_chef);
    c_autodepth(0);
    c_sel(ra);
    c_sprite(spr_ralsei_chef);
    c_sel(te);
    c_autodepth(0);
    c_depth(96830);
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* Oh^1, okay. That actually makes sense./%", "obj_ch3_GSA04_slash_Step_0_gml_217_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_pose);
    c_tenna_preset(16);
    c_var_instance(screen, "food_screen", false);
    c_sel(te);
    c_addxy(-40, 4);
    scr_funnytext_init(1, 0, -14, scr_84_get_sprite("spr_ja_funnytext_daisuki"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Kris^1, your mother used to \\O1 cooking shows^1, didn't she?/%", "obj_ch3_GSA04_slash_Step_0_gml_230_0");
    c_talk_wait();
    c_tenna_preset(32);
    c_wait(1);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_addxy(40, -4);
    c_speaker("tenna");
    c_msgsetloc(0, "* Oh^1, how she'd LAUGH^1, glowingly^1, along with each new recipe^1,/", "obj_ch3_GSA04_slash_Step_0_gml_243_0");
    c_msgnextloc("* Feverishly taking notes on each step to make them for her family.../%", "obj_ch3_GSA04_slash_Step_0_gml_244_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_nose_blossom);
    c_wait_talk();
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_left);
    c_setxy(camerax() + 450, cameray() + 336);
    c_var_instance(chefhat, "hspeed", -24);
    c_var_instance(chefhat, "vspeed", -14);
    c_var_instance(chefhat, "gravity", 0.25);
    c_var_lerp_instance(chefhat, "image_angle", 0, 360, 10);
    c_sndplay(snd_wing);
    c_sndplay_x(snd_bluh, 0.7, 1.2);
    scr_funnytext_init(2, 0, -10, scr_84_get_sprite("spr_funnytext_brother"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* As you and your \\O2 pretended the chefs were bungling the simplest parts!/%", "obj_ch3_GSA04_slash_Step_0_gml_261_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_pose_podium);
    c_tenna_preset(0);
    c_imageindex(1);
    c_setxy(440, 286);
    c_speaker("tenna");
    c_msgsetloc(0, "* \"Darn!^1! I overcooked the water!!\"/", "obj_ch3_GSA04_slash_Step_0_gml_272_0");
    c_msgnextloc("* \"Oops!^1! No!^1! I keep breaking the eggs!^1! Oops!!\"/%", "obj_ch3_GSA04_slash_Step_0_gml_273_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_tenna_sad_turned_b);
    c_tenna_preset(20);
    c_wait_talk();
    c_sel(te);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_laugh);
    c_wait(1);
    c_imagespeed(0.2);
    c_addxy(16, -18);
    scr_funnytext_init(3, -10, -20, scr_84_get_sprite("spr_funnytext_fun_loop"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* AHAHAHA!^1! Hahaha!^1! That sure was \\O3^1, wasn't it?/%", "obj_ch3_GSA04_slash_Step_0_gml_293_0");
    c_talk_wait();
    c_snd_play(snd_whip_crack_only);
    c_tenna_preset(0);
    c_wait(1);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(2);
    c_var_instance(te_actor, "image_xscale", 2);
    c_addxy(-16, 18);
    c_speaker("tenna");
    c_msgsetloc(0, "* Now^1, are you ready or what!?/%", "obj_ch3_GSA04_slash_Step_0_gml_322_0");
    c_talk_wait();
    c_wait(15);
    c_msc(1302);
    c_talk_wait();
    c_waitcustom();
}
if (con == 10 && !d_ex() && customcon == 1)
{
    con = 30;
    customcon = 0;
    c_waitcustom_end();
    var _screen_depth = screen.depth;
    c_var_instance(screen, "target_logo_pos_y", -140);
    c_var_instance(screen, "target_scale", 14);
    c_var_instance(screen, "tutorial_active", true);
    c_var_instance(screen, "depth", 96840);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(3);
    c_var_lerp_instance(te_actor, "x", 428, 514, 15, 1, "out");
    scr_funnytext_init(0, 0, 0, scr_84_get_sprite("spr_funnytext_challenge"), 0, 0);
    scr_funnytext_init(1, 0, -14, 1272, 0, 0);
    scr_funnytext_init(2, 0, -14, scr_84_get_sprite("spr_funnytext_win"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Here are the instructions for the \\O0^1./", "obj_ch3_GSA04_slash_Step_0_gml_374_0");
    c_msgnextloc("* FOOD is FALLING^1! KRIS^1, CATCH the food on your head to STACK IT UP^1!/", "obj_ch3_GSA04_slash_Step_0_gml_375_0");
    c_msgnextsubloc("* THROW it to customers with ~1^1! If the food touches them^1, they'll gobble it up^1!/", scr_get_input_name(4), "obj_ch3_GSA04_slash_Step_0_gml_376_0");
    c_msgnextloc("* SPECIAL CUSTOMERS will sometimes appear^1! They're worth \\O1 POINTs^1, don't miss 'em^1!/", "obj_ch3_GSA04_slash_Step_0_gml_377_0");
    c_msgnextsubloc("* SUSIE will probably cook BURNING FIRE. JUMP over it with ~1^1!/", scr_get_input_name(5), "obj_ch3_GSA04_slash_Step_0_gml_378_0");
    c_msgnextloc("* Missed food will also turn into BURNING FIRE, so be careful!/", "obj_ch3_GSA04_slash_Step_0_gml_379_0");
    c_msgnextloc("* Big stack^1, \\O1 POINTs^1! But..^1. You'll MOVE and JUMP slower^1! Be careful!/", "obj_ch3_GSA04_slash_Step_0_gml_380_0");
    c_msgnextloc("* Last until the end to \\O2^1 But if the POPULARITY GAUGE runs out^1, it's GAME OVER^1!/", "obj_ch3_GSA04_slash_Step_0_gml_381_0");
    c_msgnextloc("* Now don't touch that dial^1, OR that fire^1!/", "obj_ch3_GSA04_slash_Step_0_gml_382_0");
    c_msgnextloc("* Because.../%", "obj_ch3_GSA04_slash_Step_0_gml_383_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_grasp);
    c_tenna_preset(12);
    c_var_instance(screen, "tut_target_xscale", 2);
    c_var_instance(screen, "tut_target_yscale", 2);
    c_wait_box(2);
    c_var_instance(screen, "tut_sprite", 3988);
    c_var_instance(screen, "tut_pos_y_offset", 0);
    c_wait_box(3);
    c_tenna_preset(34);
    c_var_instance(screen, "tut_sprite", 1964);
    c_var_instance(screen, "tut_pos_y_offset", 50);
    c_wait_box(4);
    c_tenna_preset(-2);
    c_tenna_sprite(spr_tenna_listening);
    c_var_instance(screen, "tut_sprite", 302);
    c_var_instance(screen, "tut_pos_y_offset", 10);
    c_wait_box(5);
    c_var_instance(screen, "tut_sprite", 3617);
    c_var_instance(screen, "tut_pos_y_offset", 50);
    c_tenna_preset(33);
    c_tenna_sprite(spr_tenna_point_left);
    c_addxy(0, 8);
    c_wait(1);
    c_var_instance(te_actor, "wobbleamt", 14);
    c_imagespeed(0);
    c_wait_box(6);
    c_var_instance(screen, "tut_sprite", 1014);
    c_var_instance(screen, "tut_pos_y_offset", -40);
    c_tenna_preset(33);
    c_tenna_sprite(spr_tenna_whisper_blush);
    c_var_lerp_instance(te_actor, "wobbleamt", 0, 4, 15);
    c_wait(5);
    c_wait_box(7);
    c_addxy(0, -8);
    c_tenna_sprite(spr_tenna_grasp);
    c_tenna_preset(12);
    c_wait_box(8);
    c_var_instance(screen, "tut_easetype", "in");
    c_var_instance(screen, "tut_target_xscale", 0);
    c_var_instance(screen, "tut_target_yscale", 0);
    c_tenna_preset(2);
    c_wait_box(9);
    c_wait_talk();
    jumpstart_x = 514;
    jumpstart_y = 297;
    c_var_instance(screen, "target_logo_pos_y", 40);
    c_var_instance(screen, "target_scale", 2);
    c_wait(30);
    c_var_instance(screen, "depth", _screen_depth);
    c_var_instance(screen, "tutorial_active", false);
    c_waitcustom();
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = 30;
    customcon = 0;
    c_waitcustom_end();
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_up);
    c_speaker("tenna");
    c_msgsetloc(0, "* THAT's what I like to hear!/", "obj_ch3_GSA04_slash_Step_0_gml_484_0");
    c_msgnextloc("* Now get those pans over easy^1, or these eggs are gonna be TOUGH!/%", "obj_ch3_GSA04_slash_Step_0_gml_485_0");
    c_talk_wait();
    jumpstart_x = 390;
    jumpstart_y = 320;
    c_waitcustom();
}
if ((con == 30 && !d_ex() && customcon == 1) || scr_cutscene_loaded())
{
    con = 40;
    customcon = 0;
    c_waitcustom_end();
    c_mus("free_all");
    c_tenna_preset(0);
    c_sprite(spr_tenna_attack);
    c_var_instance(te_actor, "x", jumpstart_x);
    c_var_instance(te_actor, "scaled_bounce", true);
    c_var_lerp_instance(te_actor, "image_xscale", 2, 3, 16);
    c_var_lerp_instance(te_actor, "image_yscale", 2, 3, 16);
    c_var_lerp_instance(te_actor, "x", jumpstart_x, 333, 16);
    c_var_lerp_instance(te_actor, "y", 297, jumpstart_y - 97, 8, 1, "out");
    c_wait(9);
    c_var_lerp_instance(te_actor, "y", jumpstart_y - 97, 400, 8, 1, "in");
    c_wait(6);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_wait(10);
    c_saveload_l(saveload);
    c_var_instance(tv_time, "show_text", true);
    c_wait(10);
    c_wait_if(tv_time, "is_active", "=", false);
    c_wait(15);
    c_saveload_s(saveload);
    c_var_lerp_to_instance(te_actor, "x", camerax() + view_wport[0] + 200, 16);
    c_wait(15);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_chef_jump);
    c_wait(4);
    c_snd_play(snd_jump);
    c_sprite(spr_krisb_pirouette_plate);
    c_imagespeed(1);
    c_var_instance(kr_actor, "hspeed", 1);
    c_var_instance(kr_actor, "vspeed", -10);
    c_var_instance(kr_actor, "gravity", 1);
    c_wait_if(kr_actor, "x", ">=", 320);
    c_var_instance(kr_actor, "hspeed", 0);
    c_var_instance(kr_actor, "x", 320);
    c_wait_if(kr_actor, "y", ">=", 260);
    c_var_instance(kr_actor, "vspeed", 0);
    c_var_instance(kr_actor, "gravity", 0);
    c_var_instance(kr_actor, "y", 280);
    c_sprite(spr_kris_chef);
    c_imagespeed(0);
    c_wait(30);
    c_waitcustom();
}
if (con == 40 && customcon == 1 && !d_ex())
{
    con = -1;
    if (global.plot < 100)
        global.plot = 100;
    with (obj_actor)
        instance_destroy();
    with (obj_cutscene_master)
        instance_destroy();
    scr_chefs_start(0);
}
if (con == 50)
{
    con = -1;
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (show_border)
{
    show_border = false;
    with (obj_border_controller)
        show_border();
}
