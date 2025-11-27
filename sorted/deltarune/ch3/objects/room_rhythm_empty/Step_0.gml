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
    te_actor = instance_create(camerax() + view_wport[0] + 200, cameray() + 386, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_pose_podium;
    te_actor.preset = 0;
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_setxy(95, 260);
    c_sprite(spr_susie_trapped_lean);
    c_sel(ra);
    c_setxy(487, 262);
    c_sprite(spr_ralsei_trapped_despondent);
    c_autowalk(0);
    c_imagespeed(0.1);
    var susie_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    susie_gacha.actor_target = su_actor;
    susie_gacha.mode = 4;
    susie_gacha.depth = 96000;
    with (susie_gacha)
        set_pos(95, 306);
    var ralsei_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    ralsei_gacha.actor_target = ra_actor;
    ralsei_gacha.mode = 2;
    ralsei_gacha.depth = 96100;
    with (ralsei_gacha)
        set_pos(497, 306);
    ralsei_gacha.ball_angle = 0;
    var rhythm_game = instance_create(camerax(), cameray(), obj_rhythmgame);
    if (i_ex(obj_tenna_enemy))
    {
        rhythm_game.tenna_boss = true;
    }
    else
    {
        with (rhythm_game)
        {
            event_user(3);
            show_chart = 1;
        }
    }
    c_wait(1);
    c_var_instance(blackall, "image_alpha", 0);
    c_wait(15);
    c_tenna_sprite(spr_tenna_laugh_pose_teeth);
    c_sound_play(snd_wing);
    c_lerp_var_instance(te_actor, "x", camerax() + view_wport[0] + 200, 433, 15, 3, "out");
    c_wait(30);
    c_msgside("top");
    c_speaker("tenna");
    c_msgsetloc(0, "* That's right^1! A MUSICAL CHALLENGE^1! And this time^1, it's.../%", "obj_room_rhythm_empty_slash_Step_0_gml_88_0");
    c_talk_wait();
    c_wait(30);
    c_var_instance(id, "game_start", true);
    c_wait(30);
    c_imagespeed(0);
    c_tenna_sprite(spr_tenna_pose_headraised_nose);
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* Oh God. Oh God^1, it's coming.^4^4%%", "obj_room_rhythm_empty_slash_Step_0_gml_102_0");
    c_talk_wait();
    c_sel(te);
    c_sprite(spr_tenna_pose_headlowered_nose);
    c_wait(8);
    c_speaker("tenna");
    c_msgsetloc(0, "* The music is coming.^4^4%%", "obj_room_rhythm_empty_slash_Step_0_gml_111_0");
    c_talk_wait();
    c_var_instance(id, "shakey_text", true);
    c_tenna_preset(15);
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* I can't stop it...^4^4%%", "obj_room_rhythm_empty_slash_Step_0_gml_123_0");
    c_talk_wait();
    c_var_instance(id, "shakey_text", false);
    c_lerp_var_instance(te_actor, "x", 433, camerax() + view_wport[0] + 200, 20, 2, "out");
    c_wait(900000000);
    c_waitcustom();
}
if (shakey_text && i_ex(obj_writer))
{
    with (obj_writer)
    {
        shake = 2;
        rate = 2;
        skippable = 0;
    }
}
if (game_start && !d_ex())
{
    game_start = false;
    game_active = true;
    with (obj_rhythmgame)
        event_user(0);
}
if (game_active)
{
    var is_song_done = false;
    with (obj_rhythmgame)
        is_song_done = song_done;
    if (is_song_done)
    {
        game_active = false;
        customcon = 0;
        con = 20;
    }
}
if (con == 20 && !d_ex())
{
    con = -1;
    var screen_wipe = instance_create(0, 0, obj_ch3_screen_wipe);
    screen_wipe.target_room = room_ch3_gameshowroom;
    screen_wipe.start = true;
}
