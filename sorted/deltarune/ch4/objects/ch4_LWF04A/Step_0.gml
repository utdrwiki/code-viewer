if (con == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    su = actor_count + 1;
    su_actor = instance_create(157, 287, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = spr_susie_look_down_left;
    c_pannable(1);
    c_pan(-70, 110, 1);
    c_wait(220);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../%", "obj_ch4_LWF04A_slash_Step_0_gml_32_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("d");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. We..^1. aren't gonna let that happen.../%", "obj_ch4_LWF04A_slash_Step_0_gml_43_0");
    c_talk_wait();
    c_wait(60);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_rain_windblow);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. right?/%", "obj_ch4_LWF04A_slash_Step_0_gml_54_0");
    c_talk_wait();
    c_mus2("initloop", "raining.ogg", 0);
    c_mus2("pitch", 0.9, 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 60);
    c_customfunc(function()
    {
        global.flag[794] = 1;
        var rain = instance_create(0, 0, obj_lw_rain_effect);
        rain.depth = 1000;
        rain.max_particles = 240;
        rain.drop_wait = 8;
        rain.active = true;
    });
    c_sel(su);
    c_imagespeed(0.15);
    c_wait(120);
    c_imagespeed(0);
    c_wait(30);
    c_autowalk(0);
    c_sprite(spr_susie_look_down_walk);
    c_imagespeed(0.15);
    c_walk_wait("d", 1, 70);
    c_mus2("volume", 0.5, 60);
    c_customfunc(function()
    {
        fade_pitch = true;
        var _overlay_right = scr_marker(0, 0, spr_pixel_white);
        with (_overlay_right)
        {
            image_blend = c_black;
            image_xscale = 999;
            image_yscale = 999;
            depth = 989;
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 60);
        }
        mus_volume(global.currentsong[3], 0.5, 60);
    });
    c_wait(60);
    c_customfunc(function()
    {
        with (obj_lw_rain_effect)
            toggle_effect();
    });
    c_customfunc(function()
    {
        with (obj_ch4_LWF04A_vfx)
        {
            kris_sprite = spr_kris_scarewalk_leave_attempt;
            scr_lerpvar("kris_index", 0, 4, 40);
        }
    });
    c_wait(90);
    c_snd_play(snd_wing);
    c_customfunc(function()
    {
        with (obj_ch4_LWF04A_vfx)
            scr_lerpvar("kris_index", 5, 10, 30);
    });
    c_wait(60);
    c_customfunc(function()
    {
        with (obj_ch4_LWF04A_vfx)
            scr_lerpvar("kris_index", 10, 14, 30);
    });
    c_wait(30);
    c_wait(50);
    c_customfunc(function()
    {
        with (obj_ch4_LWF04A_vfx)
            scr_lerpvar("kris_index", 15, 18, 16);
    });
    c_customfunc(function()
    {
        with (obj_ch4_LWF04A_vfx)
            phone_index = 1;
    });
    c_sound_play(snd_phone);
    c_wait(60);
    c_customfunc(function()
    {
        with (obj_ch4_LWF04A_vfx)
            phone_index = 0;
    });
    c_wait(60);
    c_var_instance(phone_vfx, "visible", 1);
    c_var_instance(phone_vfx, "start_speech", true);
    c_wait(60);
    c_customfunc(function()
    {
        with (obj_ch4_LWF04A_vfx)
            phone_index = 1;
    });
    c_wait_if(phone_vfx, "speech_index", "=", 2);
    c_wait(60);
    c_var_instance(phone_vfx, "fade_bubble", true);
    c_var_instance(phone_vfx, "speech_active", false);
    c_wait(60);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_mus2("volume", 0, 60);
    c_customfunc(function()
    {
        mus_volume(global.currentsong[3], 0, 60);
    });
    c_wait(90);
    c_var_instance(phone_vfx, "speech_active", true);
    c_wait(210);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 1 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 320;
    con = -1;
    room_goto(room_ed);
}
if (fade_pitch)
{
    rain_pitch = scr_movetowards(rain_pitch, 0.5, 0.2);
    audio_sound_pitch(global.currentsong[3], rain_pitch);
    if (rain_pitch <= 0.5)
        fade_pitch = false;
}
