if (con < 0)
    exit;
if (con == 0)
{
    global.interact = 1;
    global.facing = 0;
    con = 20;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + 500, cameray() + 274, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.preset = 2;
    c_sel(kr);
    c_visible(0);
    c_sel(ra);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_sel(te);
    c_visible(0);
    c_var_instance(blackall, "visible", 0);
    c_wait(5);
    c_var_instance(bg_vfx, "con", 1);
    c_wait(5);
    c_var_instance(id, "border_show", true);
    c_wait(2);
    c_var_instance(blackall, "visible", 1);
    c_var_instance(bg_vfx, "show_overlay", false);
    c_sel(kr);
    c_visible(1);
    c_sel(ra);
    c_visible(1);
    c_sel(su);
    c_visible(1);
    c_sel(te);
    c_visible(1);
    c_var_instance(bg_vfx, "con", -1);
    c_var_instance(gameshow_screen, "screen_state", "tv_logo");
    c_var_instance(gameshow_screen, "visible", "1");
    c_var_instance(bg_vfx, "show_overlay", false);
    c_var_instance(blackall, "visible", 0);
    c_sel(kr);
    c_facing("d");
    c_setxy(84, 177);
    c_sel(su);
    c_sprite(spr_susie_sheeh);
    c_setxy(165, 162);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_down);
    c_setxy(248, 166);
    c_wait(30);
    c_mus2("initloop", "ch3_tvtime.ogg", 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* WELCOME BACK to another ELECTRIFYING episode of TV TIME!/", "obj_ch3_GSC07_slash_Step_0_gml_603_0");
    c_facenext("ralsei", "L");
    c_msgnextloc("\\EL* W-wait a second.../%", "obj_ch3_GSC07_slash_Step_0_gml_605_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_sprite(spr_ralsei_surprised_right_walk);
    c_sel(kr);
    c_facing("r");
    c_wait_talk();
    c_snd_play(snd_item);
    c_var_instance(gameshow_screen, "screen_state", "city_board");
    c_tenna_sprite(spr_tenna_pose);
    c_wait(15);
    c_sel(ra);
    c_facing("r");
    c_var_instance(id, "laugh_track_finish", false);
    c_speaker("tenna");
    c_msgsetloc(0, "* Today's board will take place in beautiful TV CITY.../%", "obj_ch3_GSC07_slash_Step_0_gml_636_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_whisper);
    c_sel(su);
    c_sprite(spr_susie_look_down);
    c_addxy(0, 4);
    c_halt();
    scr_funnytext_init(0, 0, 0, scr_84_get_sprite("spr_funnytext_city_feet"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* \\O0 ^1^1^1\\M1 /%", "obj_ch3_GSC07_slash_Step_0_gml_650_0_b");
    c_talk_wait();
    c_wait_if(id, "laugh_track_finish", "=", true);
    c_wait(15);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_tenna_sprite(spr_tenna_point_up_twofingers);
    c_speaker("tenna");
    c_msgsetloc(0, "* Collect two Q's from each corner of the CITY^1, and.../%", "obj_ch3_GSC07_slash_Step_0_gml_664_0");
    c_talk_wait();
    c_mus("free_all");
    c_shake();
    c_snd_play(snd_impact);
    c_sel(su);
    c_sprite(spr_susie_exasperated);
    c_addxy(0, -4);
    c_halt();
    c_tenna_preset(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* ENOUGH ALREADY!/", "obj_ch3_GSC07_slash_Step_0_gml_680_0");
    c_msgnextloc("\\E4* The game's over. Give back Toriel and let us go home. Now./%", "obj_ch3_GSC07_slash_Step_0_gml_681_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("tenna");
    c_msgsetloc(0, "* Game..^1. over?/%", "obj_ch3_GSC07_slash_Step_0_gml_689_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_look_down_right);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E4* Mr. Tenna^1, I'm not certain what your plan is^1, but.../%", "obj_ch3_GSC07_slash_Step_0_gml_703_0");
    c_talk_wait();
    c_sel(ra);
    c_facing("r");
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EI* We'd like to go seal the Dark Fountain now./", "obj_ch3_GSC07_slash_Step_0_gml_713_0");
    c_msgnextloc("\\EQ* I think..^1. the show's gotten a little old./%", "obj_ch3_GSC07_slash_Step_0_gml_714_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_wait_talk();
    c_wait(60);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_speaker("tenna");
    c_msgsetloc(0, "* ..^1. Old./", "obj_ch3_GSC07_slash_Step_0_gml_870_0");
    c_facenext("ralsei", "L");
    c_msgnextloc("\\EL* Umm^1, sorry^1, Tenna^1, I.../", "obj_ch3_GSC07_slash_Step_0_gml_872_0");
    c_facenext("tenna", 0);
    c_msgnextloc("* No^1, haha^1! Ralsei^1, RALSEI^1! Buddy-BOY^1! It's fine^1! I GET IT^1! Look^1, I get it!/", "obj_ch3_GSC07_slash_Step_0_gml_874_0");
    c_msgnextloc("* CLASSIC TV..^1. sometimes just takes a little TIME to APPRECIATE!/", "obj_ch3_GSC07_slash_Step_0_gml_875_0");
    c_msgnextloc("* So how about this?/", "obj_ch3_GSC07_slash_Step_0_gml_876_0");
    c_msgnextloc("* We'll all do ONE MORE LITTLE GAME.../", "obj_ch3_GSC07_slash_Step_0_gml_877_0");
    c_msgnextloc("* One last ENCORE!/", "obj_ch3_GSC07_slash_Step_0_gml_878_0");
    c_msgnextloc("* And this time^1, we'll play/%", "obj_ch3_GSC07_slash_Step_0_gml_879_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_wait_box(3);
    c_mus2("initloop", "baci_perugina.ogg", 0);
    c_wait_box(4);
    c_sel(ra);
    c_facing("r");
    c_tenna_preset(1);
    c_wait_box(5);
    c_tenna_sprite(spr_tenna_pose);
    c_wait_box(6);
    c_tenna_sprite(spr_tenna_point_up);
    c_wait_box(7);
    c_tenna_sprite(spr_tenna_laugh_pose);
    c_wait_box(8);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_wait_talk();
    c_mus("pause");
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_evil);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right_walk);
    c_sel(su);
    c_sprite(spr_susie_surprised_right);
    c_var_instance(id, "slow_writer", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* Until you LIKE IT./%", "obj_ch3_GSC07_slash_Step_0_gml_743_0");
    c_talk_wait();
    c_var_instance(id, "slow_writer", false);
    c_tenna_preset(0);
    c_var_instance(id, "border_switch", true);
    c_var_instance(id, "capture_gacha_kris", true);
    c_sound_play(snd_wing);
    c_wait(10);
    c_var_instance(bg_vfx, "con", 2);
    c_var_instance(bg_vfx, "palette_index", 0.3);
    c_var_instance(gameshow_screen, "screen_state", "city_ruined");
    c_sel(kr);
    c_facing("d");
    c_var_instance(bg_vfx, "palette_index", 0.6);
    c_var_instance(id, "capture_gacha_susie", true);
    c_sound_play(snd_wing);
    c_sel(su);
    c_sprite(spr_susie_sheeh);
    c_addxy(-2, 5);
    c_shakeobj();
    c_wait(10);
    c_var_instance(id, "capture_gacha_ralsei", true);
    c_sound_play(snd_wing);
    c_wait(10);
    c_var_instance(bg_vfx, "palette_index", 1);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_down);
    c_addxy(4, 0);
    c_shakeobj();
    scr_funnytext_init(1, 0, 0, 2914, 0, 0);
    scr_funnytext_init(2, 0, -14, 4659, 0, 0);
    scr_funnytext_init(3, 0, -14, 130, 0, 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EI* H-hey^1, what the heck are you.../", "obj_ch3_GSC07_slash_Step_0_gml_969_0");
    c_facenext("tenna", 0);
    c_msgnextloc("* \\O1/", "obj_ch3_GSC07_slash_Step_0_gml_971_0");
    c_msgnextloc("* THE \\O2'S never \\O3!!!/", "obj_ch3_GSC07_slash_Step_0_gml_972_0");
    c_msgnextloc("* And if YOU don't wanna play anymore.../", "obj_ch3_GSC07_slash_Step_0_gml_973_0");
    c_msgnextloc("* It's time for ME to TAKE CONTROL!!!/", "obj_ch3_GSC07_slash_Step_0_gml_974_0");
    c_msgnextloc("* MIKE^1, crank it all up to MAX!!!/%", "obj_ch3_GSC07_slash_Step_0_gml_975_0");
    c_talk();
    c_wait_box(2);
    c_sel(te);
    c_tenna_preset(10);
    c_tenna_sprite(spr_tenna_dance_cabbage);
    c_imagespeed(1.5);
    c_mus("resume");
    c_mus2("pitch", 1.5, 0);
    c_var_instance(id, "show_fire", true);
    c_var_instance(bg_vfx, "color_changing", true);
    c_var_instance(gameshow_screen, "shakey_active", true);
    c_var_instance(id, "distort_music", true);
    c_var_lerp_instance(te_actor, "image_speed", 1, 2, 20);
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_trapped_press);
    c_addxy(-2, 0);
    c_autowalk(0);
    c_imagespeed(0.1);
    c_sel(su);
    c_autowalk(0);
    c_facing("d");
    c_addxy(2, -5);
    c_var_instance(id, "susie_punch", true);
    c_wait(30);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_wait(30);
    c_mus("free_all");
    c_var_instance(tv_time, "show_text", true);
    c_wait(10);
    c_wait_if(tv_time, "is_active", "=", false);
    c_waitcustom();
}
if (slow_writer && i_ex(obj_writer))
{
    with (obj_writer)
    {
        rate = 3;
        skippable = 0;
    }
}
if (con == 20 && !d_ex() && customcon == 1)
{
    global.plot = 230;
    var punch_timer = susie_punch_timer;
    with (obj_ch3_GSD01)
    {
        con = 10;
        customcon = 1;
        susie_punch_timer = punch_timer;
    }
    susie_punch = false;
    su_actor.sprite_index = spr_susie_walk_down_dw_unhappy;
    con = -1;
    customcon = 0;
    snd_free_all();
}
if (capture_gacha_kris)
{
    capture_gacha_kris = false;
    var kris_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    kris_gacha.actor_target = kr_actor;
    kris_gacha.mode = 1;
    kris_gacha.depth = 97100;
    with (kris_gacha)
        catch_character();
}
if (capture_gacha_susie)
{
    capture_gacha_susie = false;
    var susie_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    susie_gacha.actor_target = su_actor;
    susie_gacha.mode = 3;
    susie_gacha.depth = 97000;
    with (susie_gacha)
        catch_character();
}
if (capture_gacha_ralsei)
{
    capture_gacha_ralsei = false;
    var ralsei_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    ralsei_gacha.actor_target = ra_actor;
    ralsei_gacha.mode = 2;
    ralsei_gacha.depth = 97100;
    with (ralsei_gacha)
        catch_character();
}
if (capture_gacha_end)
{
    capture_gacha_end = false;
    with (obj_ch3_GSC07_gacha)
        mode = 0;
    with (obj_ch3_GSC07_bg)
    {
        con = 0;
        palette_index = 0;
    }
}
if (show_fire)
{
    show_fire = false;
    var _flames = instance_create(0, 0, obj_dw_gameshow_stage_fire);
    _flames.depth = 99000;
}
if (susie_punch)
{
    susie_punch_timer++;
    if (susie_punch_timer == 8)
    {
        with (su_actor)
        {
            sprite_index = spr_susie_trapped_punch;
            image_index = 0;
            image_speed = 0.5;
        }
    }
    if (susie_punch_timer > 8)
    {
        if (susie_punch_timer == 12)
        {
            with (su_actor)
                scr_shakeobj();
        }
        if (susie_punch_timer == 14)
            snd_play_x(snd_impact, 0.75, 0.8);
        if (susie_punch_timer == 16)
        {
            susie_punch_timer = 0;
            su_actor.image_speed = 0;
        }
    }
}
if (distort_music)
{
    distort_music = false;
    var audio_pos = audio_sound_get_track_position(global.currentsong[1]);
    var audio_pitch = audio_sound_get_pitch(global.currentsong[1]);
    distort_audio[0] = snd_init("baci_distort.ogg");
    distort_audio[1] = mus_loop(distort_audio[0]);
    snd_volume(distort_audio[1], 0, 0);
    audio_sound_set_track_position(distort_audio[1], audio_pos);
    audio_sound_pitch(distort_audio[1], audio_pitch);
    snd_volume(global.currentsong[1], 0, 30);
    snd_volume(distort_audio[1], 1, 30);
}
if (hall_show)
{
    hall_timer++;
    if (hall_timer == 1)
    {
        snd_play(snd_wing);
        scr_lerp_var_instance(hall_left, "y", hall_left.ystart - 200, cameray(), 10, 2, "out");
        scr_lerp_var_instance(hall_right, "y", hall_right.ystart - 200, cameray(), 10, 2, "out");
    }
    if (hall_timer == 10)
    {
        snd_play(snd_impact);
        scr_shakescreen();
    }
    if (hall_timer == 40)
        hall_show = false;
}
if (hall_hide)
{
    hall_hide = false;
    snd_play(snd_wing);
    scr_lerp_var_instance(hall_left, "x", hall_left.xstart, camerax() - (sprite_get_width(spr_gameshow_halloffame_left) * 2), 60, 4, "out");
    scr_lerp_var_instance(hall_right, "x", hall_right.xstart, camerax() + view_wport[0] + (sprite_get_width(spr_gameshow_halloffame_left) * 2), 60, 4, "out");
}
if (global.flag[20] == 1)
    laugh_track = true;
if (laugh_track)
{
    laugh_track_timer++;
    if (laugh_track_timer == 1)
        snd_play(snd_crowd_laughter_single);
    if (laugh_track_timer >= 90 && !d_ex())
    {
        laugh_track = false;
        laugh_track_timer = 0;
        global.flag[20] = 0;
        laugh_track_finish = true;
    }
}
if (border_show)
{
    border_show = false;
    with (obj_border_controller)
    {
        set_border(border_dw_blue_stars, 1);
        show_border(1);
    }
}
if (border_switch)
{
    border_switch = false;
    with (obj_border_controller)
        set_border(border_dw_red_smiles);
}
