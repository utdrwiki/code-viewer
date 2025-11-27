if (con == 0)
{
    con = 1;
    alarm[0] = 5;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(143, 182);
    c_sprite(spr_kris_kneel);
    c_sel(su);
    c_setxy(164, 173);
    c_sprite(spr_susie_kneel);
    c_var_lerp_instance(kris_marker, "image_alpha", 0, 1, 60);
    c_var_lerp_instance(susie_marker, "image_alpha", 0, 1, 60);
    c_var_instance(kris_marker, "depth", blackall.depth - 1);
    c_var_instance(kris_marker, "x", 143);
    c_var_instance(kris_marker, "y", 182);
    c_var_instance(susie_marker, "depth", blackall.depth - 1);
    c_var_instance(susie_marker, "x", 164);
    c_var_instance(susie_marker, "y", 173);
    c_wait(90);
    c_var_lerp_instance(kris_marker, "image_alpha", 1, 0, 60);
    c_var_lerp_instance(susie_marker, "image_alpha", 1, 0, 60);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_var_instance(id, "border_show", true);
    c_var_instance(id, "deep_audio_start", true);
    c_wait(90);
    c_var_instance(kris_marker, "visible", 0);
    c_var_instance(susie_marker, "visible", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* We.../", "obj_ch3_PTB04_krisyard_slash_Step_0_gml_62_0");
    c_msgnextloc("\\Ee* We're in the Light World...?/%", "obj_ch3_PTB04_krisyard_slash_Step_0_gml_63_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_emote("!", 30);
    c_sprite(spr_susie_pose_lw);
    c_addxy(0, 2);
    c_soundplay(snd_noise);
    c_shakeobj();
    c_wait(30);
    c_sel(kr);
    c_facing("d");
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* W..^1. wait!/", "obj_ch3_PTB04_krisyard_slash_Step_0_gml_83_0");
    c_msgnextloc("\\Ed* Kris^1! I..^1. I still see someone^1! They're down there!/%", "obj_ch3_PTB04_krisyard_slash_Step_0_gml_84_0");
    c_talk_wait();
    c_mus2("initloop", "creepychase.ogg", 0);
    c_mus2("pitch", 1.15, 0);
    c_sel(su);
    c_facing("susieunhappy");
    c_walk_wait("d", 4, 4);
    c_walk_wait("l", 4, 4);
    c_sprite(spr_susie_kris_run_down);
    c_addxy(-4, 0);
    c_snd_play(snd_grab);
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect(165, 430, 40);
    c_wait(30);
    c_var_instance(id, "deep_audio_stop", true);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(45);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    with (obj_caterpillarchara)
    {
        visible = 0;
        fun = 1;
        follow = 0;
    }
    snd_free(deep_loop);
    con = 99;
    room_goto(room_town_church);
}
if (deep_audio_start)
{
    deep_audio_start = false;
    var deep_audio = snd_init("deep_noise.ogg");
    deep_loop = mus_loop(deep_audio);
    mus_volume(deep_loop, 0, 0);
    mus_volume(deep_loop, 1, 60);
}
if (deep_audio_stop)
{
    deep_audio_stop = false;
    mus_volume(deep_loop, 0, 30);
}
if (border_show)
{
    border_show = false;
    with (obj_border_controller)
        show_border();
}
