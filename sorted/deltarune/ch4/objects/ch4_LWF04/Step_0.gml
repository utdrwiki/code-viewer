if (con == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1)
{
    con = 2;
    c_mus2("initloop", "jitterbug_muffled.ogg", 0);
    c_sel(kr);
    c_sprite(spr_kris_sleepless_left);
    c_setxy(240, 97);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 120);
    c_wait(120);
    c_wait(150);
    c_var_instance(id, "muffled_voice", true);
    c_wait(60);
    c_sel(kr);
    c_sprite(spr_kris_sleepless_right);
    c_shakeobj();
    c_sound_play(snd_wing);
    c_wait(60);
    c_sel(kr);
    c_sprite(spr_kris_sleepless_cover_right);
    c_shakeobj();
    c_sound_play(snd_wing);
    c_wait(60);
    c_sel(kr);
    c_sprite(spr_kris_sleepless_cover_left);
    c_shakeobj();
    c_sound_play(snd_wing);
    c_wait(60);
    c_var_instance(id, "muffled_voice", false);
    c_wait(60);
    c_sel(kr);
    c_sprite(spr_kris_sleepless_left);
    c_wait(90);
    c_sound_play(snd_rimshot_muffled);
    c_wait(15);
    c_var_instance(id, "muffled_voice", true);
    c_var_instance(id, "muffled_timer_max", 40);
    c_var_instance(pillow_marker, "visible", 0);
    c_autowalk(0);
    c_sprite(spr_kris_sleepless_cover);
    c_wait(60);
    c_imageindex(2);
    c_shakeobj();
    c_sound_play(snd_wing);
    c_var_instance(id, "rimshot", true);
    c_wait(40);
    c_var_instance(id, "muffled_timer_max", 30);
    c_var_instance(id, "rimshot_timer_max", 30);
    c_var_instance(id, "kris_toss", true);
    c_var_lerp_instance(id, "kris_toss_timer_max", 30, 10, 210);
    c_wait(120);
    c_var_instance(id, "rimshot_timer_max", 20);
    c_var_instance(id, "muffled_timer_max", 20);
    c_wait(90);
    c_wait(75);
    c_var_instance(id, "muffled_voice", false);
    c_var_instance(id, "rimshot", false);
    c_var_instance(id, "kris_toss", false);
    c_mus("stop");
    if (!sideb_mode)
    {
        c_sound_play(snd_susie_muffled);
        c_sel(kr);
        c_sprite(spr_kris_sleepless_cover);
        c_imageindex(1);
        c_wait(90);
        c_sound_play(snd_noise);
        c_var_instance(pillow_marker, "sprite_index", spr_kris_bed_pillow_messy);
        c_var_instance(pillow_marker, "visible", 1);
        c_sel(kr);
        c_sprite(spr_kris_sleepless_left);
        c_wait(60);
        c_sound_play(snd_susie_muffled);
        c_wait(90);
        c_wait(5);
        c_sprite(spr_kris_sleepless_leave_bed);
        c_animate(0, 12, 0.25);
        c_customfunc(function()
        {
            phone_marker.depth = kr_actor.depth + 10;
        });
        c_wait(80);
        c_sprite(spr_kris_scarewalk_left);
        c_setxy(211, 101);
        c_wait(30);
        c_autowalk(0);
        c_imagespeed(0.25);
        c_walkdirect_wait(154, 105, 30);
        c_sprite(spr_kris_backwalk_left);
        c_walkdirect_wait(155, 68, 30);
        c_halt();
        c_wait(60);
    }
    else
    {
        c_sound_play(snd_phone);
        c_sel(kr);
        c_sprite(spr_kris_sleepless_cover);
        c_imageindex(1);
        c_wait(90);
        c_sound_play(snd_noise);
        c_var_instance(pillow_marker, "sprite_index", spr_kris_bed_pillow_messy);
        c_var_instance(pillow_marker, "visible", 1);
        c_sel(kr);
        c_sprite(spr_kris_sleepless_left);
        repeat (2)
        {
            c_sound_play(snd_phone);
            c_wait(90);
        }
        c_sound_play(snd_phone);
        c_sprite(spr_kris_sleepless_phone);
        c_var_lerp("image_index", 0, 5, 50);
        c_wait_if(kr_actor, "image_index", "=", 3);
        c_snd_play(snd_noise);
        c_wait(90);
        c_speaker("carol");
        c_fefc(0, 0);
        c_msgsetloc(0, "* Kris..^1. are you there?/", "obj_ch4_LWF04_slash_Step_0_gml_185_0");
        c_msgnextloc("* ..^1. Then^1, I'll just leave a message./", "obj_ch4_LWF04_slash_Step_0_gml_186_0");
        c_msgnextloc("* You are going to the festival tomorrow^1, aren't you?/", "obj_ch4_LWF04_slash_Step_0_gml_187_0");
        c_msgnextloc("* ..^1. I just wanted to confirm./", "obj_ch4_LWF04_slash_Step_0_gml_188_0");
        c_msgnextloc("* Noelle said.../", "obj_ch4_LWF04_slash_Step_0_gml_189_0");
        c_msgnextloc("* She's really looking forward to seeing you./%", "obj_ch4_LWF04_slash_Step_0_gml_190_0");
        c_talk();
        c_wait_box(0);
        c_customfunc(function()
        {
            scr_writer_setspeed(2);
        });
        c_wait_talk();
        c_wait(60);
        c_sound_play(snd_noise);
        c_sel(kr);
        c_autodepth(0);
        c_imageindex(6);
        c_wait(60);
        c_sound_play(snd_noise);
        c_customfunc(function()
        {
            blackall.depth = 9998;
            kr_actor.depth = 9990;
        });
        c_var_instance(blackall, "image_alpha", 1);
        c_wait(60);
        c_sound_play(snd_noise);
        c_sel(kr);
        c_autodepth(0);
        c_customfunc(function()
        {
            kr_actor.depth += 20;
        });
        c_wait(60);
        c_var_lerp_to_instance(pixel, "image_alpha", 1, 90);
        c_wait(120);
        c_customfunc(function()
        {
            snd_free_all();
            room_goto(room_ed);
        });
    }
    c_waitcustom();
}
if (con == 2 && customcon == 1)
{
    con = 99;
    snd_free_all();
    global.heart_wagon = [];
    if (i_ex(obj_ch4_LWF04_wagon))
        global.heart_wagon = [obj_ch4_LWF04_wagon.heartx, obj_ch4_LWF04_wagon.hearty];
    room_goto(room_town_krisyard_dark);
}
if (muffled_voice)
{
    if (muffled_timer == muffled_timer_max)
    {
        muffled_alt++;
        var sound = ((muffled_alt % 2) == 1) ? 483 : 565;
        snd_play(sound);
    }
    muffled_timer--;
    if (muffled_timer <= 0)
        muffled_timer = muffled_timer_max;
}
if (rimshot)
{
    if (rimshot_timer == rimshot_timer_max)
        snd_play(snd_rimshot_muffled);
    rimshot_timer--;
    if (rimshot_timer <= 0)
        rimshot_timer = rimshot_timer_max;
}
if (kris_toss)
{
    kris_toss_timer--;
    if (kris_toss_timer <= 0)
    {
        kris_toss_alt++;
        kris_toss_timer = kris_toss_timer_max;
        kr_actor.sprite_index = ((kris_toss_alt % 2) == 1) ? spr_kris_sleepless_cover_pillow_right : spr_kris_sleepless_cover_pillow_left;
        with (kr_actor)
            scr_shakeobj();
        snd_play(snd_wing);
    }
}
