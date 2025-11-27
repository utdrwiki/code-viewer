if (con < 0)
    exit;
if (con == 0)
{
    if (!scr_debug())
    {
        with (obj_rhythmgame)
            performer.visible = false;
        with (obj_rhythmgame_chart)
            performer.visible = false;
    }
    if (scr_debug() && !show_debug)
    {
        if (button2_h())
        {
            show_debug = true;
            snd_free_all();
            snd_stop_all();
            with (obj_rhythmgame)
            {
                freeplay = -2;
                performer.visible = true;
            }
            with (obj_rhythmgame_chart)
                performer.visible = true;
        }
        else
        {
            with (obj_rhythmgame)
                performer.visible = false;
            with (obj_rhythmgame_chart)
                performer.visible = false;
        }
    }
    if (scr_debug() && show_debug)
    {
        if (button1_p())
        {
            rhythmgame_con = 2;
            con = 4;
            c_waitcustom();
            exit;
        }
        else if (button2_p())
        {
            con = 1;
        }
        else
        {
            exit;
        }
    }
    else if (global.plot == 132)
    {
        rhythmgame_con = 2;
        obj_rhythmgame.freeplay = 0;
        con = 4;
        c_waitcustom();
        exit;
    }
    else
    {
        con = 1;
    }
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 1)
    obj_rhythmgame.freeplay = 0;
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + 720, cameray() + 237, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_point_up;
    te_actor.preset = 2;
    gu = actor_count + 2;
    gu_actor = instance_create(kr_actor.x, kr_actor.y + 100, obj_actor);
    scr_actor_setup(gu, gu_actor, "guitar");
    gu_actor.sprite_index = spr_kris_guitar_isolate;
    with (obj_rhythmgame)
    {
        performer.visible = true;
        vocals.performer.visible = true;
        drums.performer.visible = true;
        other.kr_actor.x = performer.x;
        other.kr_actor.y = performer.y - 100;
        other.kr_actor.sprite_index = performer.sprite_index;
        performer.sprite_index = spr_kris_rock_1;
        other.su_actor.x = drums.performer.x;
        other.su_actor.y = drums.performer.y - 100;
        other.su_actor.sprite_index = drums.performer.sprite_index;
        drums.performer.sprite_index = spr_susie_rock;
        other.ra_actor.x = vocals.performer.x;
        other.ra_actor.y = vocals.performer.y - 100;
        other.ra_actor.sprite_index = vocals.performer.sprite_index;
        other.kr_actor.visible = false;
        other.su_actor.visible = false;
        other.ra_actor.visible = false;
    }
    instrument[0] = instance_create(su_actor.x, su_actor.y + 100, obj_marker2);
    instrument[0].image_speed = 0;
    instrument[0].sprite_index = spr_susie_drum_isolate;
    instrument_offset[0] = su_actor.y + 100;
    instrument[0].depth = su_actor.depth - 100;
    instrument[0].image_xscale = su_actor.image_xscale;
    instrument[0].image_yscale = su_actor.image_yscale;
    instrument[0].image_blend = #7A99FF;
    instrument[1] = instance_create(kr_actor.x, kr_actor.y + 100, obj_marker2);
    instrument[1].image_speed = 0;
    instrument[1].sprite_index = spr_kris_guitar_isolate;
    instrument_offset[1] = kr_actor.y + 100;
    instrument[1].depth = kr_actor.depth - 100;
    instrument[1].image_xscale = kr_actor.image_xscale;
    instrument[1].image_yscale = kr_actor.image_yscale;
    instrument[1].image_blend = #7A99FF;
    with (obj_rhythmgame_performer)
    {
        if (name == "susie")
            marker = other.instrument[0];
        else if (name == "kris")
            marker = other.instrument[1];
    }
    instruments = 2;
    silhouettes = true;
    var _overlay = instance_create(x, y, obj_screen_color);
    _overlay.image_blend = #CCCCCC;
    _overlay.blend_mode = 3;
    _overlay.depth = 90000;
    _overlay.visible = false;
}
if (con == 3)
{
    con = 99;
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    with (obj_rhythmgame)
    {
        with (performer)
            y = -1000;
        with (drums.performer)
            y = -1000;
        with (vocals.performer)
            y = -1000;
    }
    instrument[0].y = -10000;
    instrument[1].y = -10000;
    c_var_instance(id, "camcon", 1);
    c_waitcustom();
    c_sel(su);
    c_sprite(spr_susie_drum_ready);
    c_var_instance(id, "cheercon", 1);
    c_var_instance(audience_cheer, "audience_bounce", true);
    c_var_instance(id, "susie_spotlight", true);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Are you ready to ROCK HARD!?/%", "obj_ch3_GSB02_slash_Step_0_gml_163_0");
    c_talk_wait();
    c_var_instance(id, "cheercon", 0);
    c_wait(15);
    c_wait_if(audience_cheer, "audience_bounce_stop", "=", true);
    c_sel(su);
    c_sprite(spr_susie_drum);
    c_sel(ra);
    c_sprite(spr_ralsei_rock_blush);
    c_var_instance(id, "cheercon", 1);
    c_var_instance(audience_cheer, "audience_bounce", true);
    c_var_instance(id, "ralsei_spotlight", true);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* Umm..^1. c-can we rock soft?/%", "obj_ch3_GSB02_slash_Step_0_gml_175_0");
    c_talk_wait();
    c_var_instance(id, "cheercon", 0);
    c_wait_if(audience_cheer, "audience_bounce_stop", "=", true);
    c_sel(ra);
    c_sprite(spr_ralsei_rock_1);
    c_var_instance(id, "kris_spotlight", true);
    c_var_instance(id, "cheercon", 2);
    c_msc(1266);
    c_talk_wait();
    c_waitcustom();
}
if (susie_spotlight)
{
    susie_spotlight = false;
    snd_play(snd_locker);
    with (obj_rhythmgame_effects)
        spotlight_active(0, 1);
    with (obj_rhythmgame)
    {
        with (drums.performer)
        {
            silhouette = false;
            visible = false;
        }
        floor_color = #24396D;
        other.su_actor.visible = true;
        other.instrument[0].visible = false;
    }
}
if (ralsei_spotlight)
{
    ralsei_spotlight = false;
    snd_play(snd_locker);
    with (obj_rhythmgame_effects)
        spotlight_active(2, 1);
    with (obj_rhythmgame)
    {
        with (vocals.performer)
        {
            silhouette = false;
            visible = false;
        }
        other.ra_actor.visible = true;
    }
}
if (kris_spotlight)
{
    kris_spotlight = false;
    snd_play(snd_locker);
    with (obj_rhythmgame_effects)
        spotlight_active(1, 1);
    with (obj_rhythmgame)
    {
        with (performer)
        {
            silhouette = false;
            visible = false;
        }
        other.kr_actor.visible = true;
        other.silhouettes = false;
        other.instrument[1].visible = false;
    }
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 11;
    customcon = 0;
    obj_rhythmgame.bg_con = 1;
    c_waitcustom_end();
    c_mus("free_all");
    c_sel(gu);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_setxy(280, 216);
    c_sel(gu);
    c_visible(0);
    var kris_pose_sprite = (global.choice == 0) ? 272 : 2695;
    c_snd_play(snd_crowd_ooh);
    c_var_instance(id, "cheercon", 1);
    c_var_instance(audience_cheer, "audience_bounce", true);
    c_snd_play(snd_bell);
    c_sel(kr);
    c_sprite(kris_pose_sprite);
    c_addxy(6, 0);
    c_var_instance(id, "kris_flash", true);
    c_snd_play(snd_noise);
    c_wait(90);
    c_var_instance(id, "cheercon", 0);
    c_mus2("initloop", "ch3_tvtime.ogg", 0);
    c_snd_play(snd_wing);
    c_var_instance(id, "border_switch", true);
    c_sel(te);
    c_var_lerp_to_instance(te_actor, "x", 334, 10, 2, "out");
    c_tenna_preset(21);
    c_wait(40);
    scr_funnytext_init(0, 0, -14, scr_84_get_sprite("spr_funnytext_rock_concert"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* That's right^1! Get out your lighters for the LIGHTNERS^1, ladies and germs!/", "obj_ch3_GSB02_slash_Step_0_gml_219_0");
    c_msgnextloc("* Because it's time for a crashing^1, banging^1, booming^1, crooning.../", "obj_ch3_GSB02_slash_Step_0_gml_220_0");
    c_msgnextloc("* \\O0^1!!!/%", "obj_ch3_GSB02_slash_Step_0_gml_221_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(5);
    c_wait_box(2);
    c_tenna_preset(21);
    c_snd_play(snd_cd_bagel_susie);
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_rock_pose);
    c_sel(su);
    c_sprite(spr_susie_drum_ready);
    c_var_instance(id, "cheercon", 1);
    c_var_instance(audience_cheer, "audience_bounce", true);
    c_wait(60);
    c_var_instance(id, "cheercon", 0);
    c_sel(te);
    c_var_instance(te_actor, "image_xscale", 2);
    c_tenna_preset(32);
    c_tenna_sprite(spr_tenna_pose);
    c_sel(kr);
    c_sprite(spr_kris_rock_2);
    c_addxy(-6, 0);
    c_sel(ra);
    c_sprite(spr_ralsei_rock_1);
    c_sel(su);
    c_sprite(spr_susie_drum);
    c_speaker("tenna");
    c_msgsetloc(0, "* Oh^1, Kris^1! Remember DECEMBER? Oh^1, that little musical prodigy.../", "obj_ch3_GSB02_slash_Step_0_gml_242_0");
    c_msgnextloc("* Remember when she'd grab the remote and swap it from cartoons.../", "obj_ch3_GSB02_slash_Step_0_gml_243_0");
    c_msgnextloc("* ..^1. to that WILD music video channel Toriel FORBID you to see?/%", "obj_ch3_GSB02_slash_Step_0_gml_244_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_left);
    c_wait_box(2);
    c_tenna_sprite(spr_tenna_tie_adjust_a);
    c_wait_talk();
    c_wait(15);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_whisper);
    scr_funnytext_init(1, 0, 0, scr_84_get_sprite("spr_funnytext_alligator"), 0, 0);
    c_delaycmd4(20, "var", id, "laugh_track", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* \\O1/%", "obj_ch3_GSB02_slash_Step_0_gml_267_0");
    c_talk_wait();
    c_wait_if(id, "laugh_track_finish", "=", true);
    c_wait(10);
    c_sel(te);
    c_tenna_preset(0);
    c_sprite(spr_tenna_laugh);
    c_wait(1);
    c_imagespeed(0.2);
    c_speaker("tenna");
    c_msgsetloc(0, "* Dess^1, rocking her guitar and singing along with those nasty^1, nasty songs!/", "obj_ch3_GSB02_slash_Step_0_gml_281_0");
    c_msgnextloc("* Didn't you all think she was just so..^1. COOL?/", "obj_ch3_GSB02_slash_Step_0_gml_282_0");
    c_msgnextloc("* HECK^1! Maybe you could get her to come back and watch again sometime!?/%", "obj_ch3_GSB02_slash_Step_0_gml_283_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(32);
    c_tenna_sprite(spr_tenna_pose);
    c_wait_box(2);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_wait_talk();
    c_tenna_preset(0);
    c_wait(60);
    c_tenna_preset(1);
    c_msc(1310);
    c_talk_wait();
    c_waitcustom();
}
if (con == 20 && customcon == 1 && !d_ex())
{
    con = 21;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(audience_cheer, "audience_hide", true);
    c_var_lerp_to_instance(te_actor, "x", te_actor.x + 140, 15, 3, "out");
    c_pannable(1);
    c_pan(camerax(), cameray() - 100, 15);
    c_wait(15);
    c_tenna_sprite(spr_tenna_point_up);
    c_var_instance(id, "tutorial_advance", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* No worries^1! It's so SIMPLE^1, a FAX MACHINE could do it!/%", "obj_ch3_GSB02_slash_Step_0_gml_319_0");
    c_talk_wait();
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_var_instance(id, "tutorial_advance", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* When the MUSIC starts^1, notes will flow from the top like HONEY./%", "obj_ch3_GSB02_slash_Step_0_gml_321_0");
    c_talk_wait();
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* When the NOTES hit the MARK^1, press with good timing to PLAY them^1!/", "obj_ch3_GSB02_slash_Step_0_gml_555_0");
    c_msgnextsubloc("* ~1 (or ~2) will play notes on the LEFT!/", left_button, scr_get_input_name(3), "obj_ch3_GSB02_slash_Step_0_gml_556_0");
    c_msgnextsubloc("* ~1 (or ~2) will play notes on the RIGHT!/", right_button, scr_get_input_name(1), "obj_ch3_GSB02_slash_Step_0_gml_557_0");
    c_msgnextloc("* Make sure to HOLD the button for those LONG NOTES!/", "obj_ch3_GSB02_slash_Step_0_gml_558_0");
    c_msgnextloc("* Got it^1, Kris?^1! Good^1! That's all you gotta know!/%", "obj_ch3_GSB02_slash_Step_0_gml_559_0");
    c_talk_wait();
    c_var_instance(id, "tutorial_advance", true);
    c_sel(te);
    c_var_lerp_to_instance(te_actor, "x", camerax() + 720, 10, 2, "out");
    c_speaker("tenna");
    c_msgsetloc(0, "* SUSIE and RALSEI will be doing their own things^1, so IGNORE THEIR PARTS./%", "obj_ch3_GSB02_slash_Step_0_gml_326_0");
    c_talk_wait();
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_var_instance(id, "tutorial_advance", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* That being said^1, MUSIC is a TEAM SPORT^1! If ANY of you play bad.../%", "obj_ch3_GSB02_slash_Step_0_gml_327_0");
    c_talk_wait();
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_var_instance(id, "tutorial_advance", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* The POPU `& LARITY LIGHTS will darken^1^1! And if they go black.../%", "obj_ch3_GSB02_slash_Step_0_gml_328_0");
    c_talk_wait();
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_var_instance(id, "tutorial_advance", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* It's LIGHTS OUT!!!/%", "obj_ch3_GSB02_slash_Step_0_gml_329_0");
    c_talk_wait();
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_var_instance(id, "tutorial_advance", true);
    c_sel(te);
    c_tenna_preset(2);
    c_var_lerp_to_instance(te_actor, "x", te_actor.x, 10, 2, "out");
    c_pan(camerax(), cameray(), 15);
    c_wait(15);
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* NOW^1, how about a SOUND CHECK!? This one's just for practice!/%", "obj_ch3_GSB02_slash_Step_0_gml_330_0");
    c_talk_wait();
    c_var_instance(id, "tutorial_advance", true);
    c_sel(te);
    c_var_lerp_to_instance(te_actor, "x", camerax() + 720, 10, 2, "out");
    c_sel(su);
    c_sprite(spr_susie_drum);
    c_sel(kr);
    c_sprite(spr_kris_rock_2);
    c_sel(gu);
    c_visible(0);
    c_pannable(1);
    c_pan(camerax(), cameray() - 100, 15);
    c_wait_if(id, "tutorial_loaded", "=", true);
    c_wait(60);
    c_var_instance(audience_cheer, "audience_active", false);
    c_pan(camerax(), 0, 1);
    c_var_instance(id, "sound_check", true);
    c_var_instance(id, "game_start", true);
    c_waitcustom();
}
if (con == 26 && customcon == 1 && !d_ex())
{
    con = 30;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "sound_check", false);
    c_script_instance(id, snd_play, 60, snd_crowd_crickets);
    c_wait(60);
    c_script_instance_stop(id, snd_play);
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_rock_surprise);
    if (sound_check_won)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E7* Hey^1, we make a pretty good band./", "obj_ch3_GSB02_slash_Step_0_gml_369_0");
        c_facenext("ralsei", "C");
        c_msgnextloc("\\EC* .../", "obj_ch3_GSB02_slash_Step_0_gml_371_0");
        c_msgnextloc("\\EN* (Kris^1, the two of us will need to play perfectly...)/%", "obj_ch3_GSB02_slash_Step_0_gml_372_0");
    }
    else
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\EK* Hey^1, Kris^1, way to make us fail the song./", "obj_ch3_GSB02_slash_Step_0_gml_694_0");
        c_facenext("ralsei", "K");
        c_msgnextloc("\\EK* (I'll..^1. just try to sing as loud as I can...)/%", "obj_ch3_GSB02_slash_Step_0_gml_696_0");
    }
    c_talk();
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_rock_1);
    c_wait_talk();
    c_waitcustom();
}
if (con == 30 && customcon == 1 && !d_ex())
{
    con = 31;
    customcon = 0;
    c_waitcustom_end();
    c_mus2("volume", 0, 30);
    if (global.choice == 0)
    {
        c_snd_play(snd_wing);
        c_sel(te);
        c_var_lerp_to_instance(te_actor, "x", 334, 10, 2, "out");
    }
    else
    {
        c_tenna_sprite(spr_tenna_point_up);
    }
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* ALRIGHT^1! SOUND: Checked^1! DRUMS: Loud^1! BOYS: Fluffy!/", "obj_ch3_GSB02_slash_Step_0_gml_387_0");
    c_msgnextloc("* RALSEI^1! Got those lyrics ready!?/", "obj_ch3_GSB02_slash_Step_0_gml_388_0");
    c_facenext("ralsei", "D");
    c_msgnextloc("\\ED* Umm^1, they seem a little..^1. inappropriate. Do I have to...?/", "obj_ch3_GSB02_slash_Step_0_gml_390_0");
    c_facenext("tenna", 0);
    c_msgnextloc("* TOO BAD^1! NOW^1, AUDIENCE^1! Give it up one last time.../%", "obj_ch3_GSB02_slash_Step_0_gml_392_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_laugh_pose);
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_rock_blush);
    c_wait_box(5);
    c_sel(ra);
    c_sprite(spr_ralsei_rock_surprise);
    c_sel(te);
    c_tenna_preset(2);
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_rock_1);
    if (global.choice == 0)
    {
        c_var_instance(audience_cheer, "base_y_pos", cameray() + view_hport[0] + 150);
        c_var_instance(audience_cheer, "audience_active", true);
        c_var_instance(audience_cheer, "audience_show", true);
    }
    else
    {
        c_var_instance(audience_cheer, "audience_bounce", true);
    }
    c_var_instance(id, "cheercon", 1);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_wait(10);
    c_var_instance(id, "tv_time_active", true);
    c_wait(10);
    c_wait_if(id, "tv_time_active", "=", false);
    c_sel(te);
    c_var_lerp_to_instance(te_actor, "x", camerax() + 760, 10, 2, "out");
    c_wait(15);
    c_var_instance(id, "cheercon", 0);
    c_var_instance(audience_cheer, "audience_hide", true);
    c_pannable(1);
    c_pan(camerax(), cameray() - 100, 15);
    c_wait(60);
    c_pan(camerax(), 0, 1);
    c_var_instance(id, "game_start", true);
    c_waitcustom();
}
if (tv_time_active)
{
    if (tv_time == -4)
    {
        scr_delay_var("tv_time_con", 1, 30);
        tv_time = instance_create(0, 0, obj_tenna_tv_time);
        with (tv_time)
            show_text = true;
    }
    if (tv_time_con == 1)
    {
        if (!tv_time.is_active)
        {
            tv_time_active = false;
            with (tv_time)
                instance_destroy();
            tv_time = -4;
        }
    }
}
if (game_retry)
{
    game_retry = false;
    with (obj_rhythmgame)
        palette_active = false;
    rhythmgame_con = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_var_instance(id, "game_start", true);
    c_waitcustom();
}
if (game_start && !d_ex())
{
    game_start = false;
    game_active = true;
    if (global.plot < 140)
        global.plot = 140;
    var song_id = sound_check ? 1 : 0;
    start_song(song_id);
}
if (game_active)
{
    var is_song_done = false;
    var is_game_won = false;
    var is_replay = global.plot >= 150;
    with (obj_rhythmgame)
    {
        is_song_done = song_done;
        is_game_won = game_won;
    }
    if (is_song_done && !i_ex(obj_minigame_quit_ui))
    {
        end_song(is_game_won || sound_check);
        if (sound_check && is_game_won)
            sound_check_won = true;
        game_active = false;
        customcon = 0;
        var pan_back = sound_check || is_game_won;
        if (pan_back)
        {
            c_waitcustom_end();
            c_pannable(1);
            c_pan(camerax(), cameray() + 100, 15);
            c_wait(45);
        }
        if (sound_check)
        {
            con = 26;
            with (obj_actor)
            {
                y += 100;
                visible = true;
            }
            c_waitcustom();
        }
        else
        {
            con = -1;
            with (audience_cheer)
                instance_destroy();
            c_terminatekillactors();
            with (obj_actor_tenna)
                instance_destroy();
            if (is_game_won && obj_rhythmgame.replayversion == false)
            {
                var _victory = instance_create(0, 0, obj_victory_minigame);
            }
            else
            {
                if (!is_game_won)
                    scr_flag_set(1096, scr_flag_get(1096) + 1);
                var _gameover = instance_create(0, 0, obj_gameover_minigame);
                _gameover.replayversion = obj_rhythmgame.replayversion;
                _gameover.quitversion = obj_rhythmgame.replayquit;
                if (is_game_won)
                {
                    _gameover.replaywin = true;
                    kris_marker = scr_dark_marker(280, 316, spr_kris_rock_2);
                    with (kris_marker)
                        scr_depth();
                    susie_marker = scr_dark_marker(56, 281, spr_susie_drum);
                    with (susie_marker)
                        scr_depth();
                    ralsei_marker = scr_dark_marker(486, 304, spr_ralsei_rock_1);
                    with (ralsei_marker)
                        scr_depth();
                    audience_cheer = instance_create(0, 0, obj_ch3_audience);
                    audience_cheer.depth = depth - 100;
                    audience_cheer.audience_active = true;
                    audience_cheer.blend_mode = 13788985;
                    audience_cheer.base_y_pos = cameray() + view_hport[0] + 500;
                    audience_cheer.target_y_pos = cameray() + 540;
                    audience_cheer.audience_show = true;
                }
            }
        }
    }
    if (is_song_done)
    {
        with (obj_minigame_quit_ui)
            instance_destroy();
    }
}
if (camcon == 1)
{
    with (obj_rhythmgame)
    {
        if (camera_lerp == 0)
        {
            crowd_sound = snd_loop(snd_crowd);
            snd_volume(crowd_sound, 0.25, 0);
            snd_volume(crowd_sound, 1, 90);
            with (performer)
                silhouette = true;
            with (obj_rhythmgame_chart)
            {
                with (performer)
                    silhouette = true;
            }
        }
        camera_lerp++;
        y = lerp(960, -100, scr_ease_inout(clamp01(camera_lerp / 150), 3));
        with (performer)
            y = ystart + other.y + 110;
        with (obj_rhythmgame_chart)
            performer.y = performer.ystart + other.y + 110;
        if (camera_lerp == 180)
        {
            camera_lerp = -1;
            other.camcon = 2;
        }
    }
}
else if (camcon == 2)
{
    with (obj_rhythmgame)
    {
        camera_lerp++;
        var _speed = 1;
        var _dur = 207;
        if (up_h())
            _speed += 0.5;
        if (button2_h())
            _speed += 0.5;
        if (button3_h())
            _speed += 0.5;
        if (down_h())
            _speed -= 0.5;
        if (button1_h())
            _speed -= 0.5;
        _speed = clamp(_speed, 0.5, 2);
        if (camera_lerp > 0)
        {
            if (_speed < 1)
                camera_lerp -= 0.5;
            else if ((camera_lerp % 1) != 0)
                camera_lerp = ceil(camera_lerp);
        }
        other.raiser = scr_movetowards(other.raiser, _dur + 1, _speed);
        var _raiser = other.raiser;
        if (camera_lerp < (_dur + 1) && other.pistonsound != 0)
        {
            if (_raiser >= (_dur + 1))
            {
                camera_lerp = _dur + 1;
                snd_pitch(other.pistonsound, 1);
            }
            else
            {
                snd_pitch(other.pistonsound, _speed);
            }
        }
        if (camera_lerp >= 0 && camera_lerp <= _dur)
        {
            if (camera_lerp == 0)
            {
                other.spotlight_con = 1;
                other.pistonsound = snd_play(snd_wet_tapdancing_elevator);
                snd_play(snd_locker);
                other.cheercon = 1;
                with (obj_ch3_audience)
                    audience_show = true;
            }
            if (camera_lerp == 15)
                snd_volume(crowd_sound, 0, 90);
            if (camera_lerp == 35)
            {
            }
            if (camera_lerp == 45)
                snd_stop(crowd_sound);
            if (other.cheercon != -2 && (camera_lerp == 120 || _raiser > (_dur - 60)))
                other.cheercon = 0;
            with (performer)
                y = ystart + lerp(100, 0, _raiser / _dur) + other.y;
            with (obj_rhythmgame_chart)
                performer.y = performer.ystart + lerp(120, 0, _raiser / _dur) + other.y;
            if (_raiser >= (_dur + 1) && camera_lerp < (_dur + 1))
                camera_lerp = _dur + 1;
        }
        else if (camera_lerp == (_dur + 1))
        {
            scr_shakeobj_ext(performer, 0, 4, 1, 0.1, 2);
            with (obj_rhythmgame_chart)
                scr_shakeobj_ext(performer, 0, 4, 1, 0.1, 1);
        }
        else if (camera_lerp == (_dur + 60))
        {
            effects.con = 1;
            floor_color = #24396D;
        }
        if (camera_lerp >= (_dur + 90))
        {
            other.camcon = 0;
            c_waitcustom_end();
        }
    }
}
if (tutorial_advance)
{
    if (tutorial_con == 0)
    {
        tutorial_con = 1;
        tutorial_loaded = false;
        with (obj_rhythmgame)
            event_user(4);
    }
    if (tutorial_con == 1)
    {
        tutorial_loaded = obj_rhythmgame.tutorial_ready;
        if (tutorial_loaded)
        {
            tutorial_con = 0;
            tutorial_advance = false;
        }
    }
}
if (camcon == 3)
{
}
if (camcon == 4)
{
}
if (cheercon == 1)
{
    var _audience = snd_init("berdly_audience.ogg");
    cheerloop = mus_loop(_audience);
    cheercon = -1;
}
if (cheercon == 2)
{
    mus_volume(cheerloop, 0.5, 15);
    cheercon = -1;
}
if (cheercon == 0)
{
    mus_fade(cheerloop, 60);
    cheercon = -2;
}
if (kris_flash)
{
    kris_flash = false;
    var _flash = instance_create(kr_actor.x, kr_actor.y, obj_oflash);
    _flash.image_xscale = 2;
    _flash.image_yscale = 2;
    _flash.target = kr_actor;
}
if (rhythmgame_con > 0)
{
    if (rhythmgame_con == 2)
    {
        with (obj_rhythmgame)
        {
            freeplay = 0;
            bg_con = 1;
            effects.con = 2;
            with (obj_rhythmgame_spotlight_solo)
                con = 2;
            event_user(0);
        }
    }
    rhythmgame_con = 0;
}
if (border_switch)
{
    border_switch = false;
    with (obj_border_controller)
        show_border();
}
if (laugh_track)
{
    laugh_track_timer++;
    if (laugh_track_timer == 1)
        snd_play(snd_crowd_laughter_single);
    if (laugh_track_timer >= 90 && !d_ex())
    {
        laugh_track = false;
        laugh_track_timer = 0;
        laugh_track_finish = true;
    }
}
