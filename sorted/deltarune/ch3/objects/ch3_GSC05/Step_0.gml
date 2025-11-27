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
    with (susiezilla_controller)
    {
        susie.y = 200;
        susie.visible = 1;
        instance_deactivate_object(obj_susiezilla_player);
    }
    te = actor_count + 1;
    te_actor = instance_create(susiezilla_controller.statue.x, susiezilla_controller.statue.y, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_point_up;
    te_actor.golden_mode = true;
    te_actor.preset = 0;
    ro = actor_count + 2;
    ro_actor = instance_create(camerax() + (view_wport[0] / 2), cameray(), obj_actor);
    scr_actor_setup(ro, ro_actor, "rope");
    ro_actor.sprite_index = spr_pixel_white;
    ro_actor.image_xscale = 1;
    ro_actor.image_yscale = 60;
    ro_actor.color_blend = #5F3417;
    sh = actor_count + 3;
    sh_actor = instance_create(su_actor.x + 12, su_actor.y + 84, obj_actor);
    scr_actor_setup(sh, sh_actor, "shadow");
    sh_actor.sprite_index = spr_susiezilla_shadowSpot;
    sh_actor.image_alpha = 0.5;
    if (scr_debug() && keyboard_check(ord("F")))
    {
        scr_debug_print("save/load enabled");
        saveload = true;
    }
    if (saveload)
    {
        scr_cutscene_save_objects(blackall, kr_cover, susiezilla_controller);
        scr_cutscene_save_song();
    }
}
if (con == 3 || scr_cutscene_loaded())
{
    con = 4;
    c_sel(te);
    c_setxy(te_actor.x, -300);
    c_sel(kr);
    c_autodepth(0);
    c_autowalk(0);
    c_depth(100050);
    c_sprite(spr_susiezilla_krisandralsei_tug);
    c_var_instance(kr_actor, "color_blend", c_gray);
    c_imageindex(2);
    c_setxy(527, 48);
    c_sel(ra);
    c_visible(0);
    c_var_instance(kr_cover, "depth", kr_actor.depth - 10);
    c_var_instance(kr_cover, "visible", 1);
    c_sel(te);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_sel(su);
    if (visited_tenna)
        c_sprite(spr_susiezilla_susie_unhappy);
    else
        c_sprite(spr_susiezilla_susie_idle);
    c_setxy(susiezilla_controller.susie.x, 200);
    c_autodepth(0);
    c_depth(te_actor.depth - 20);
    c_var_instance(susiezilla_controller.susie, "visible", 0);
    c_sel(sh);
    c_setxy(susiezilla_controller.susie.x + 12, susiezilla_controller.susie.y + 84);
    c_sel(ro);
    c_setxy(camerax() + (view_wport[0] / 2), cameray());
    c_wait(30);
    c_stickto(su_actor, 10);
    c_sel(sh);
    c_stickto(su_actor, 1900);
    scr_funnytext_init(0, 0, -20, scr_84_get_sprite("spr_funnytext_physical_challenge"), 0, 0);
    c_sel(te);
    c_var_instance(te_actor, "golden_mode", false);
    c_depth(-1000);
    c_sprite(spr_tenna_laugh_pose);
    c_tenna_preset(-32);
    c_setxy(camerax() + view_wport[0] + 200, te_actor.y);
    c_wait(1);
    c_var_lerp_to_instance(te_actor, "x", camerax() + 320, 12, -1, "out");
    c_wait(30);
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* Welcome to EXTRA GAME! Tonight^1, our \\O0^1 will be.../%", "obj_ch3_GSC05_slash_Step_0_gml_119_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_bulletin);
    c_tenna_preset(0);
    c_speaker("tenna");
    c_snd_play(snd_phone);
    c_msgsetloc(0, "* W-Wait just a moment!^1! I'm receiving an EMERGENCY BROADCAST.../%", "obj_ch3_GSC05_slash_Step_0_gml_125_0");
    c_talk_wait();
    c_var_instance(id, "start_flames", true);
    c_mus2("initloop", "creepychase.ogg", 0);
    scr_funnytext_init(1, 0, -10, scr_84_get_sprite("spr_funnytext_flames"), 0, 0);
    c_tenna_preset(12);
    c_wait(30);
    c_speaker("tenna");
    c_msgsetloc(0, "* Something MASSIVE has begun ASSAULTING the CITY!!!/", "obj_ch3_GSC05_slash_Step_0_gml_162_0");
    c_msgnextloc("* Multiple buildings are up in \\O1!!!/", "obj_ch3_GSC05_slash_Step_0_gml_163_0");
    c_msgnextloc("* At this rate..^1. everything..^1. EVERYONE will be destroyed!!!/", "obj_ch3_GSC05_slash_Step_0_gml_164_0");
    c_msgnextloc("* Can anyone PLEASE tell me who this MONSTER IS!?/%", "obj_ch3_GSC05_slash_Step_0_gml_165_0");
    c_talk();
    c_wait_box(3);
    c_tenna_preset(0);
    c_sel(te);
    c_imageindex(0);
    c_shakeobj();
    c_mus("free_all");
    c_wait_talk();
    c_var_instance(id, "susie_stinger", true);
    c_var_lerp_instance(whiteall, "image_alpha", 0, 1, 80);
    c_wait(120);
    c_var_instance(id, "stop_flames", true);
    c_sel(te);
    c_setxy(te_actor.x, -300);
    c_var_instance(te_actor, "golden_mode", true);
    c_tenna_preset(0);
    c_sel(te);
    c_sprite(spr_tenna_point_up);
    c_wait(30);
    c_var_lerp_instance(whiteall, "image_alpha", 1, 0, 5);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 5);
    c_wait(40);
    if (visited_tenna)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E1* .../%", "obj_ch3_GSC05_slash_Step_0_gml_209_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E2* Guess who^1, idiots./%", "obj_ch3_GSC05_slash_Step_0_gml_166_0");
        c_talk_wait();
        c_sound_play(snd_suslaugh);
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susiezilla_susie_laugh);
        c_imagespeed(0.2);
    }
    c_var_lerp_instance(kr_cover, "image_alpha", 1, 0, 30);
    c_wait(30);
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(su_actor, "x", susiezilla_controller.susie.x - 200, 30, -1, "inout");
    c_var_lerp_to_instance(su_actor, "y", 140, 30);
    c_wait(30);
    c_var_lerp_instance(te_actor, "y", -80, te_actor.ystart - 10, 16, -3, "out");
    c_wait(8);
    c_sndplay(snd_closet_impact);
    c_shake();
    c_wait(8);
    if (!visited_tenna)
    {
        c_sel(su);
        c_sprite(spr_susiezilla_susie_idle);
        c_halt();
    }
    c_tenna_preset(2);
    c_wait(30);
    c_mus2("initloop", "ch3_tvtime.ogg", 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* That's right!!^1! It's a giant monster movie!!^1! Starring Susie!!!/", "obj_ch3_GSC05_slash_Step_0_gml_206_0");
    if (visited_tenna)
    {
        c_facenext("susie", "0");
        c_msgnextloc("\\E0* ..^1. at least call me SusieZILLA./", "obj_ch3_GSC05_slash_Step_0_gml_262_0");
    }
    else
    {
        c_facenext("susie", "Y");
        c_msgnextloc("\\EY* That's SusieZILLA^1, chump./", "obj_ch3_GSC05_slash_Step_0_gml_208_0");
        c_facenext("ralsei", "H");
        c_msgnextloc("\\EH* Aww^1! Susie^1, your costume is so adora..^1. umm^1, scary./", "obj_ch3_GSC05_slash_Step_0_gml_210_0");
        c_facenext("susie", 26);
        c_msgnextloc("\\EQ* Heh^1, obviously./", "obj_ch3_GSC05_slash_Step_0_gml_212_0");
    }
    scr_funnytext_init(2, 0, -10, scr_84_get_sprite("spr_funnytext_susiezilla"), 0, 0);
    c_facenext("tenna", 0);
    c_msgnextloc("* RIGHT^1! \\O2 will be our baddie smashing^1, hyper spinning star of the day!/%", "obj_ch3_GSC05_slash_Step_0_gml_215_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_point_left);
    c_sel(su);
    c_sprite(spr_susiezilla_susie_shocked);
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* Ms. Zilla!^1! You were watching the monster marathon until you fell asleep./", "obj_ch3_GSC05_slash_Step_0_gml_228_0");
    c_msgnextloc("* I was so HAPPY to see someone so excited to tune in!!!/", "obj_ch3_GSC05_slash_Step_0_gml_230_0");
    scr_funnytext_init(3, 0, -10, 883, 0, 0);
    c_msgnextloc("* So this final event's a\n\\O3 SERVICE just for you!!/", "obj_ch3_GSC05_slash_Step_0_gml_233_0");
    c_msgnextloc("* And haha^1, by all means^1, please^1! Come over to Kris's and watch MORE TV ANYTIME!/%", "obj_ch3_GSC05_slash_Step_0_gml_235_0");
    c_talk();
    c_wait_box(1);
    c_sel(te);
    c_tenna_preset(32);
    c_tenna_sprite(spr_tenna_pose);
    c_wait_box(2);
    c_sel(te);
    c_var_instance(te_actor, "wobblestate", 10);
    c_var_instance(te_actor, "wobbletime", 4);
    c_var_instance(te_actor, "wobbleamt", 4);
    c_tenna_sprite(spr_tenna_whisper);
    c_imageindex(0);
    c_sel(su);
    c_sprite(spr_susiezilla_susie_annoyed);
    c_wait_box(3);
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_up);
    c_wait(6);
    c_tenna_sprite(spr_tenna_point_left);
    c_tenna_preset(15);
    c_wait(1);
    c_var_instance(te_actor, "wobbleamt", 1);
    c_sel(su);
    c_sprite(spr_susiezilla_susie_shocked);
    c_wait_talk();
    c_var_lerp_to_instance(su_actor, "x", susiezilla_controller.susie.x - 240, 15, -1, "inout");
    c_sel(te);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_var_lerp_to_instance(te_actor, "x", te_actor.x - 100, 15, 3, "out");
    c_tenna_preset(-32);
    c_wait(5);
    c_speaker("tenna");
    c_msgsetloc(0, "* You don't even have to come in^1! Stand outside and watch me through the window!/", "obj_ch3_GSC05_slash_Step_0_gml_280_0");
    c_msgnextloc("* I won't tell anyone!^1! The police will never know!^1! Promise!^1! Hahaha!!/%", "obj_ch3_GSC05_slash_Step_0_gml_282_0");
    c_talk();
    c_wait_box(1);
    c_sel(te);
    c_tenna_sprite(spr_tenna_laugh);
    c_imagespeed(0.2);
    c_var_instance(te_actor, "wobblestate", 10);
    c_var_instance(te_actor, "wobbletime", 3);
    c_var_instance(te_actor, "wobbleamt", 10);
    c_wait_talk();
    c_wait(30);
    c_var_lerp_to_instance(su_actor, "x", susiezilla_controller.susie.x - 200, 30, -1, "inout");
    c_sel(su);
    c_sprite(spr_susiezilla_susie_idle);
    c_wait(15);
    c_saveload_s(saveload);
    c_sel(te);
    c_halt();
    c_tenna_preset(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Uhh..^1. so I do what. Kick your ass?/", "obj_ch3_GSC05_slash_Step_0_gml_315_0");
    c_facenext("tenna", 0);
    c_msgnextloc("* No. Uhh^1, no. \\O2 had a change in her TV-loving heart./", "obj_ch3_GSC05_slash_Step_0_gml_317_0");
    c_msgnextloc("* She may wreck the city^1, but she'll protect me^1, TV statue^1, with her life./", "obj_ch3_GSC05_slash_Step_0_gml_318_0");
    c_msgnextloc("* For if the bad guys take me down..^1. There's no more TV!!!/%", "obj_ch3_GSC05_slash_Step_0_gml_319_0");
    c_talk();
    c_wait_box(2);
    c_tenna_sprite(spr_tenna_shocked_alt);
    c_var_lerp_to_instance(te_actor, "x", 720, 15, 3, "out");
    c_wait(10);
    c_tenna_preset(-32);
    c_tenna_sprite(spr_tenna_tie_adjust_a);
    c_addxy(0, 10);
    c_wait_box(3);
    c_tenna_sprite(spr_tenna_pose);
    c_tenna_preset(16);
    c_sel(su);
    c_sprite(spr_susiezilla_susie_annoyed);
    c_wait_box(4);
    c_sel(te);
    c_tenna_sprite(spr_tenna_grasp);
    c_tenna_preset(8);
    c_wait_talk();
    if (visited_tenna)
    {
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\EK* ..^1. Whatever. Let's just make the most of this^1, Kris./%", "obj_ch3_GSC05_slash_Step_0_gml_408_0");
        c_talk_wait();
    }
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(1);
    c_var_lerp_to_instance(te_actor, "x", te_actor.x, 15, 3, "out");
    c_tenna_preset(2);
    c_sel(su);
    c_sprite(spr_susiezilla_susie_idle);
    c_sel(te);
    c_autodepth(1);
    c_msc(1288);
    c_talk_wait();
    c_waitcustom();
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = 30;
    customcon = 0;
    var tutorial = instance_create(0, 0, obj_ch3_GSC05_susiezilla_tutorial);
    with (tutorial)
        depth = 8000;
    c_waitcustom_end();
    c_wait_if(tutorial, "con", "=", 2);
    c_speaker("tenna");
    c_msgsetloc(0, "* Now^1, the rules are simple!/%", "obj_ch3_GSC05_slash_Step_0_gml_376_0");
    c_talk_wait();
    c_var_instance(tutorial, "advance", 1);
    c_wait_if(tutorial, "con", "=", 3);
    c_speaker("tenna");
    c_msgsetloc(0, "* Haters of true entertainment are constantly trying to kill me!/%", "obj_ch3_GSC05_slash_Step_0_gml_377_0");
    c_talk_wait();
    c_var_instance(tutorial, "advance", 1);
    c_wait_if(tutorial, "con", "=", 5);
    c_speaker("tenna");
    c_msgsetloc(0, "* Defeat them before they hit me and ruin my pristine sheen!/%", "obj_ch3_GSC05_slash_Step_0_gml_378_0");
    c_talk_wait();
    c_var_instance(tutorial, "advance", 1);
    c_wait_if(tutorial, "con", "=", 7);
    c_speaker("tenna");
    c_msgsetloc(0, "* Susie's ok to get hit^1, but if I run out of \"Popularity\"^1, it's game over!/%", "obj_ch3_GSC05_slash_Step_0_gml_379_0");
    c_talk_wait();
    c_var_instance(tutorial, "advance", 1);
    c_wait_if(tutorial, "con", "=", 8);
    c_speaker("tenna");
    c_msgsetloc(0, "* Kris and Ralsei control Susie via rope like an unwanted puppet./%", "obj_ch3_GSC05_slash_Step_0_gml_380_0");
    c_talk_wait();
    c_var_instance(tutorial, "advance", 1);
    c_wait_if(tutorial, "con", "=", 9);
    c_speaker("tenna");
    c_msgsetsubloc(0, "* Spin the rope with ~1 to smash anything and everything./%", scr_get_input_name(4), "obj_ch3_GSC05_slash_Step_0_gml_381_0");
    c_talk_wait();
    c_var_instance(tutorial, "advance", 1);
    c_wait_if(tutorial, "con", "=", 10);
    c_speaker("tenna");
    c_msgsetloc(0, "* That's it^1! You'll learn the rest on the job..^1. Or else!/%", "obj_ch3_GSC05_slash_Step_0_gml_382_0");
    c_talk_wait();
    c_var_instance(tutorial, "advance", 1);
    c_wait(30);
    c_waitcustom();
}
if (con == 30 && !d_ex() && customcon == 1)
{
    con = 50;
    customcon = 0;
    c_waitcustom_end();
    c_tenna_sprite(spr_tenna_point_up);
    c_tenna_preset(0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Now^1, all READY!? Tail on tight!? Taken your radioactive breath mints!?/%", "obj_ch3_GSC05_slash_Step_0_gml_434_0");
    c_talk_wait();
    c_mus("free_all");
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_wait(30);
    c_var_instance(tv_time, "show_text", true);
    c_wait(10);
    c_wait_if(tv_time, "is_active", "=", false);
    c_tenna_sprite(spr_tenna_point_up);
    c_var_lerp_to_instance(kr_actor, "x", 570, 30);
    c_var_lerp_to_instance(kr_actor, "y", 61.5, 30);
    c_var_lerp_to_instance(su_actor, "x", susiezilla_controller.susie.x - 100, 30, -1, "inout");
    c_var_lerp_to_instance(su_actor, "y", 200, 30);
    c_pannable(1);
    c_pan(213, 0, 30);
    c_wait(31);
    c_mus2("initloop", "minigame_kart.ogg", 0);
    c_var_instance(id, "start_game", true);
    c_wait(30);
    c_waitcustom();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    customcon = 0;
    scr_flag_set(1219, 1);
    con = -1;
}
if (start_game)
{
    start_game = false;
    instance_activate_object(obj_susiezilla_player);
    var susie_start_xpos = su_actor.x;
    var susie_start_ypos = su_actor.y;
    with (susiezilla_controller)
    {
        susie.x = susie_start_xpos + 1;
        susie.y = 200;
        susie.visible = 1;
        statue.visible = 1;
        start();
    }
    var kris_start_xpos = (obj_susiezilla_player.x + (obj_susiezilla_gamecontroller.width * 0.5)) / 2;
    var kris_start_ypos = 65 + ((obj_susiezilla_player.y - 220) / 8);
    with (obj_susiezilla_krisandralsei)
    {
        x = kris_start_xpos;
        y = kris_start_ypos;
        targx = x;
        targy = y;
        xprevious = x;
        xspeed = 0;
        visible = 1;
    }
    with (obj_actor)
        visible = 0;
    with (obj_actor_tenna)
        instance_destroy();
}
if (susie_stinger)
{
    susie_stinger = false;
    global.currentsong[0] = snd_init("s_neo_clip.ogg");
    audio_sound_pitch(global.currentsong[0], 0.667);
    global.currentsong[1] = mus_play(global.currentsong[0]);
}
if (start_flames)
{
    start_flames = false;
    flames = instance_create(0, 0, obj_dw_susiezilla_fire);
    flames.depth = 100;
}
if (stop_flames)
{
    stop_flames = false;
    with (flames)
        instance_destroy();
}
