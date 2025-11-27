if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    sh = actor_count + 1;
    sh_actor = instance_create(316, 392, obj_actor);
    scr_actor_setup(sh, sh_actor, "shadow");
    sh_actor.sprite_index = spr_ralsei_horse_shadow;
    c_pannable(1);
    c_pan(camerax(), -40, 1);
    c_wait(1);
    c_var_instance(blackall, "visible", 0);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_horse_run);
    c_setxy(260, 390);
    c_imagespeed(1);
    c_visible(0);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_ride);
    c_setxy(298, 318);
    c_stickto(ra_actor, -10);
    c_imagespeed(1);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_ride_1);
    c_setxy(328, 324);
    c_stickto(ra_actor, -10);
    c_imagespeed(1);
    c_sel(sh);
    c_var_instance(sh_actor, "image_yscale", 3);
    c_stickto(ra_actor, 10);
    c_wait(16);
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* The wild west^1, huh.../%", "obj_ch3_GSD03_slash_Step_0_gml_81_0");
    c_talk_wait();
    c_sel(ra);
    c_var_lerp_to("y", 330, 15);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* ..^1. got the feeling this game's gonna be a good one^1, right^1, Ralsei?/", "obj_ch3_GSD03_slash_Step_0_gml_90_0");
    c_facenext("ralsei", "2");
    c_msgnextloc("\\E2* Umm^1, sure^1, just.../%", "obj_ch3_GSD03_slash_Step_0_gml_92_0");
    c_talk_wait();
    c_wait(5);
    c_sel(ra);
    c_sprite(spr_ralsei_horse_yell);
    c_visible(1);
    c_var_lerp_to("y", 280, 15);
    c_sel(kr);
    c_halt();
    c_sel(su);
    c_halt();
    c_var_instance(id, "pause_bg", true);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EU* Why do I have to be the horse...!?/%", "obj_ch3_GSD03_slash_Step_0_gml_112_0");
    c_talk_wait();
    c_pan(camerax(), 0, 15);
    c_var_instance(id, "move_bg", true);
    c_var_instance(letterbox, "change_mode", true);
    c_sel(kr);
    c_imagespeed(1);
    c_sel(su);
    c_imagespeed(1);
    c_sel(ra);
    c_imagespeed(1);
    c_sel(ra);
    c_sprite(spr_ralsei_horse_run);
    c_walkdirect_wait(80, 380, 16);
    c_wait_if(letterbox, "change_mode", "=", false);
    c_wait(15);
    c_pannable(0);
    c_var_instance(id, "game_start", true);
    c_waitcustom();
}
if (both_talk)
{
    both_talk_timer++;
    if (both_talk_timer == 1)
    {
        ralsei_face_marker = scr_dark_marker(camerax() + 470, cameray() + 30, spr_face_r_nohat);
        ralsei_face_marker.image_index = 26;
        ralsei_face_marker.visible = 0;
        global.typer = 79;
        global.fc = 1;
        msgsetloc(0, "\\E2* Let's go!/%", "obj_ch3_GSD03_slash_Step_0_gml_295_0");
        both_writer = d_make();
        both_writer.side = 0;
    }
    if (both_talk_timer == 3)
        ralsei_face_marker.visible = 1;
    if (both_talk_timer >= 3 && !i_ex(obj_writer))
    {
        ralsei_face_marker.visible = 0;
        both_talk = false;
    }
}
if (game_start && customcon == 1)
{
    con = -1;
    customcon = 0;
    global.plot = 255;
    snd_resume(global.currentsong[1]);
    with (letterbox)
        scr_delay_var("hide_bottom", true, 30);
    var game_controller = instance_create_depth(0, -32, depth, obj_shootout_controller);
    with (obj_actor)
        instance_destroy();
}
if (move_bg)
{
    move_bg = false;
    for (var i = 0; i < array_length_1d(bg_ids); i++)
        layer_hspeed(bg_ids[i], bg_speeds[i]);
}
if (pause_bg)
{
    pause_bg = false;
    for (var i = 0; i < array_length_1d(bg_ids); i++)
        layer_hspeed(bg_ids[i], 0);
}
