if (scr_debug())
{
    if (moveinit == 0)
    {
        moveinit = 1;
        if (global.tempflag[90] == -1)
        {
            with (obj_mainchara)
                setxy(1840, 240);
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                    setxy(1738, 224);
                if (name == "ralsei")
                    setxy(1646, 228);
                scr_caterpillar_interpolate();
            }
        }
    }
}
if (con < 0 || global.plot < 320)
    exit;
if (con == 0 && obj_mainchara.x >= 1840 && global.interact == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    toriel_gacha = instance_create(2062, -205, obj_ch3_PTB02_toriel);
    toriel_gacha.depth = tree_marker.depth - 10;
    if (i_ex(obj_ch3_PTB02_roaringknight))
    {
        with (obj_ch3_PTB02_roaringknight)
            instance_destroy();
    }
    roaring_knight = instance_create(2350, cameray() + 100, obj_ch3_PTB02_roaringknight);
    with (roaring_knight)
    {
        sprite_index = spr_roaringknight_faceaway_eye;
        image_speed = 0;
        depth = 97550;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    te = actor_count + 1;
    te_actor = instance_create(2255, 290, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_laugh_pose;
    te_actor.preset = 1;
    un = actor_count + 2;
    un_actor = instance_create(2255, cameray() - 200, obj_actor);
    scr_actor_setup(un, un_actor, "undyne");
    un_actor.sprite_index = spr_undyne_dw_spear_point;
    c_sel(un);
    c_visible(0);
    c_pannable(1);
    c_panspeed(6, 0, 35);
    c_sel(kr);
    c_walkdirect(1910, 195, 20);
    c_sel(su);
    c_walkdirect(1850, 206, 20);
    c_sel(ra);
    c_walkdirect_wait(1800, 230, 20);
    c_facing("r");
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_wait(40);
    c_mus2("initloop", "tv_hall_of_fame.ogg", 0);
    c_mus2("volume", 0.7, 0);
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* Audience^1, would you please stand up and clap for our winners!!/", "obj_ch3_PTB02_slash_Step_0_gml_89_0");
    c_msgnextloc("* For outstanding kindness and bravery^1, the Lightners have won.../", "obj_ch3_PTB02_slash_Step_0_gml_90_0");
    scr_funnytext_init(0, 0, -14, scr_84_get_sprite("spr_funnytext_grand_prize"), 0, 0);
    c_msgnextloc("* THE \\O0 !!!/%", "obj_ch3_PTB02_slash_Step_0_gml_92_0");
    c_talk_wait();
    c_mus2("initloop", "berdly_audience.ogg", 0);
    c_panspeed(0, -6, 70);
    c_wait(100);
    c_var_instance(id, "drawbot", true);
    c_sound_play_x(snd_wing, 1, 1.2);
    c_var_instance(toriel_gacha, "torielfloatcon", 1);
    c_var_lerp_instance(toriel_gacha, "y", toriel_gacha.y, toriel_gacha.y - 80, 12, 2, "in");
    c_wait(30);
    c_var_lerp_instance(toriel_gacha, "y", toriel_gacha.y - 80, te_actor.y - 140, 60);
    c_var_lerp_instance(toriel_gacha, "shadow_alpha", 0, 0.5, 60);
    c_var_lerp_instance(toriel_gacha, "shadow_x_offset", 0, 40, 60);
    c_var_lerp_instance(toriel_gacha, "shadow_y_offset", 540, 60, 60);
    c_panspeed(0, 6, 70);
    c_wait(100);
    c_sound_play_x(snd_wing, 1, 1.2);
    c_var_instance(toriel_gacha, "ball_open", true);
    c_var_lerp_to_instance(toriel_gacha, "shadow_alpha", 0, 10);
    c_var_lerp_instance(tree_marker, "image_alpha", 1, 0, 10);
    c_wait(30);
    c_var_instance(toriel_gacha, "torielfloatcon", 0);
    c_var_lerp_to_instance(toriel_gacha, "y", te_actor.y - 120, 30);
    c_wait(30);
    c_sound_play(snd_noise);
    c_wait(30);
    c_speaker("tenna");
    c_msgsetloc(0, "* Here you go!^1! She's all yours^1, folks!!/%", "obj_ch3_PTB02_slash_Step_0_gml_143_0");
    c_talk_wait();
    c_tenna_preset(19);
    c_wait(20);
    c_sel(te);
    c_speaker("tenna");
    c_msgsetloc(0, "* How wonderful!^1! The family's all together again!!/", "obj_ch3_PTB02_slash_Step_0_gml_151_0");
    c_msgnextloc("\\M1* Now you can all finally%%", "obj_ch3_PTB02_slash_Step_0_gml_153_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_imagespeed(0);
    c_imageindex(3);
    c_wait_talk();
    c_mus("free_all");
    c_var_instance(id, "tennawhite", 1);
    c_wait(1);
    c_var_instance(blackall, "visible", 1);
    c_wait(5);
    c_var_instance(id, "slash_show", true);
    c_wait(90);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0);
    c_sprite(spr_susie_surprised_step_back);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_var_instance(id, "tenna_hurt", true);
    c_var_instance(te_actor, "visible", 0);
    c_sel(te);
    c_var_instance(id, "tennawhite", 3);
    c_var_instance(blackall, "image_alpha", 0);
    c_wait(120);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* T- TENNA!?/%", "obj_ch3_PTB02_slash_Step_0_gml_204_0");
    c_talk_wait();
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_sel(su);
    c_autowalk(1);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(kr);
    c_walkdirect(2066, 218, 25);
    c_delayfacing(11, "r");
    c_sel(ra);
    c_walkdirect(2014, 232, 25);
    c_delayfacing(11, "r");
    c_sel(su);
    c_walkdirect_wait(2120, 180, 25);
    c_autodepth(0);
    c_depth(97500);
    c_wait(60);
    c_var_instance(id, "drawbot", false);
    c_sound_play(snd_noise);
    c_sprite(spr_susie_point_right_unhappy);
    c_addxy(0, 60);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\Ed* Who..^1. WHO the hell are you!?/%", "obj_ch3_PTB02_slash_Step_0_gml_246_0");
    c_talk_wait();
    c_wait(30);
    c_mus2("initloop", "knight_appears.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 120);
    c_var_instance(blackall, "depth", 1000000);
    c_var_lerp_to_instance(id, "overlay_alpha", 0.4, 120);
    c_var_instance(id, "overlay_pulse", true);
    c_pan(1970, 0, 120);
    c_wait(150);
    c_sel(su);
    c_facing("r");
    c_addxy(0, -60);
    c_speaker("susie");
    c_msgsetloc(0, "\\Eb* If..^1. if you don't tell us who you are^1, then.../%", "obj_ch3_PTB02_slash_Step_0_gml_269_0");
    c_talk_wait();
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_faceaway_eye);
    c_var_instance(roaring_knight, "eye_shine", true);
    c_var_lerp_to_instance(roaring_knight, "eye_shine_anim", 3, 6);
    c_sound_play(snd_stardrop);
    c_wait(15);
    c_var_lerp_to_instance(roaring_knight, "eye_shine_anim", 0, 6);
    c_wait(6);
    c_var_instance(roaring_knight, "eye_shine", false);
    c_wait(5);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_faceaway_turning);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0);
    c_wait(10);
    c_var_instance(roaring_knight, "image_index", 1);
    c_wait(10);
    c_var_instance(roaring_knight, "image_index", 2);
    c_wait(30);
    c_var_instance(roaring_knight, "image_speed", 0.2);
    c_wait_if(roaring_knight, "image_index", ">=", 9);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_droop);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0.1);
    c_wait(90);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_droop_up);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0.2);
    c_wait(30);
    c_var_instance(roaring_knight, "image_speed", 0);
    c_wait(30);
    c_var_instance(id, "roaring_knight_beam_start", true);
    c_wait(8);
    c_sound_play_x(snd_knight_stretch, 1, 0.6);
    c_var_instance(id, "toriel_grab", true);
    c_sel(su);
    c_sprite(spr_susie_surprised_subtle_right);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_wait(110);
    c_var_instance(id, "toriel_grab", false);
    c_var_instance(id, "toriel_grab_timer", 0);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_hit_back_serious);
    c_addxy(-4, 0);
    c_var_instance(id, "susie_slash", true);
    c_wait(10);
    c_var_instance(id, "roaring_knight_beam_stop", true);
    c_wait(60);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\Ed* Like hell we're letting you take her...!/%", "obj_ch3_PTB02_slash_Step_0_gml_330_0");
    c_talk_wait();
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_reach_overworld);
    c_var_instance(roaring_knight, "state", 0);
    c_wait(15);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_transition);
    c_var_instance(roaring_knight, "image_index", 9);
    c_var_instance(roaring_knight, "image_speed", -0.6);
    c_wait(15);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_fly);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0.4);
    c_var_lerp_to_instance(roaring_knight, "x", roaring_knight.x + 310 + 10, 20, -1, "in");
    c_wait(20);
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* Kris^1! Ralsei^1! C'mon!!/%", "obj_ch3_PTB02_slash_Step_0_gml_355_0");
    c_talk_wait();
    c_pan(2230, cameray(), 40);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_run_serious_right);
    c_imagespeed(0.4);
    c_walkdirect(2356, 104, 30);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_run_serious_right);
    c_imagespeed(0.4);
    c_walkdirect(2288, 190, 30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_run_serious_right);
    c_imagespeed(0.4);
    c_walkdirect_wait(2310, 142, 15);
    c_sel(su);
    c_sprite(spr_susie_halt_serious_right);
    c_halt();
    c_animate(0, 2, 0.2);
    c_delaycmd(7, "sprite", spr_susie_idle_serious);
    c_wait(15);
    c_sel(kr);
    c_halt();
    c_facing("r");
    c_sel(kr);
    c_sprite(spr_kris_halt_serious_right);
    c_halt();
    c_animate(0, 2, 0.2);
    c_sel(ra);
    c_sprite(spr_ralsei_halt_serious_right);
    c_halt();
    c_animate(0, 2, 0.2);
    c_wait(6);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_unhappy);
    c_sel(kr);
    c_sprite(spr_krisb_idle);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_transition);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0.4);
    c_wait(22);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_idle_overworld);
    c_var_instance(roaring_knight, "state", 0);
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    con = 3.1;
    customcon = 0;
    with (te_actor)
        instance_destroy();
    c_waitcustom_end();
    c_mus("free_all");
    c_wait(30);
    c_var_instance(roaring_knight, "state", 99);
    c_wait(1);
    c_var_instance(roaring_knight, "visible", 0);
    c_var_instance(id, "roaring_knight_fx", true);
    c_wait(255);
    c_var_instance(roaring_knight, "visible", 1);
    c_var_instance(roaring_knight, "state", 0);
    c_waitcustom();
}
if (con == 3.1 && customcon == 1)
{
    con = 4;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(roaring_knight, "draw_sword", true);
    c_wait_if(roaring_knight, "battle_ready", "=", true);
    c_var_instance(id, "sword_draw", true);
    c_wait_if(id, "sword_draw_ready", "=", true);
    c_waitcustom();
}
if (roaring_knight_beam_start)
{
    roaring_knight_beam_start = false;
    var _post_battle = con >= 9;
    roaring_knight_beam = instance_create(roaring_knight.x, roaring_knight.y, obj_ch3_PTB02_roaringknight_pull_test);
    roaring_knight_beam.depth = roaring_knight.depth - 5;
    roaring_knight_beam.base_sprite = _post_battle ? spr_roaringknight_reach_base_sword : spr_roaringknight_reach_base;
    roaring_knight_state = roaring_knight.state;
    with (roaring_knight)
    {
        state = 4;
        hover_pause = true;
        state = 4;
        visible = 0;
    }
}
if (roaring_knight_beam_stop)
{
    roaring_knight_beam_stop = false;
    with (roaring_knight_beam)
        con = 7;
    scr_doom(roaring_knight_beam, 17);
    var _post_battle = con >= 9;
    if (_post_battle)
    {
        roaring_knight_beam.susie_active = true;
        with (roaring_knight)
        {
            scr_delay_var("sword_active", true, 17);
            scr_delay_var("state", 1, 17);
            scr_delay_var("reach_sprite", 1930, 17);
        }
    }
    else
    {
        var temp_state = roaring_knight_state;
        with (roaring_knight)
        {
            scr_delay_var("state", temp_state, 17);
            scr_delay_var("hover_pause", false, 17);
        }
    }
    with (roaring_knight)
        scr_delay_var("visible", true, 17);
}
if (sword_draw)
{
    if (knight_marker == -4)
    {
        knight_marker = scr_dark_marker(roaring_knight.x, roaring_knight.y, spr_roaringknight_sword_appear_new);
        knight_marker.image_index = 7;
        roaring_knight.visible = 0;
        roaring_knight.state = 99;
    }
    sword_draw_timer--;
    if (sword_draw_timer <= 0)
    {
        sword_draw_index++;
        if (sword_draw_index >= array_length(sword_draw_timestamps))
        {
            sword_draw = false;
        }
        else
        {
            sword_draw_timer = sword_draw_timestamps[sword_draw_index];
            knight_marker.image_index = 7 + sword_draw_index;
            if (knight_marker.image_index == 11)
                sword_draw_ready = true;
        }
    }
}
if (con == 4 && !d_ex() && customcon == 1 && sword_draw_ready)
{
    con = 5;
    alarm[0] = 30;
    global.tempflag[93] = 1;
    obj_mainchara.x = kr_actor.x;
    obj_mainchara.y = kr_actor.y;
    var sus_x = su_actor.x;
    var sus_y = su_actor.y;
    var ral_x = ra_actor.x;
    var ral_y = ra_actor.y;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            x = sus_x;
            y = sus_y;
        }
        if (name == "ralsei")
        {
            x = ral_x;
            y = ral_y;
        }
    }
    snd_free_all();
    global.knight_battle_items = [];
    for (var i = 0; i < 13; i++)
        global.knight_battle_items[i] = global.item[i];
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("knight.ogg");
    encounterflag = 115;
    global.flag[54] = encounterflag;
    scr_battle(115, 1, knight_marker, 0, 0);
    with (obj_battleback)
        instance_destroy();
    global.flag[9] = 1;
    with (obj_actor)
        visible = 0;
}
if (con == 6 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        con = 7;
        alarm[0] = 30;
        snd_volume(global.batmusic[1], 0, 25);
    }
}
if (con == 8)
{
    var defeated = global.flag[50] == 1;
    con = defeated ? 49 : 9;
    alarm[0] = 30;
    var battle_result = defeated ? 1 : 2;
    scr_flag_set(1047, battle_result);
    var iniwrite = ossafe_ini_open("dr.ini");
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "UraBoss", battle_result);
    ossafe_ini_close();
    ossafe_savedata_save();
    if (defeated)
    {
        whiteall.visible = 1;
        with (obj_fadeout)
            instance_destroy();
    }
    global.hp[0] = 1;
    global.hp[1] = 1;
    global.hp[2] = 1;
    global.hp[3] = 1;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    obj_mainchara.x = obj_herokris.x;
    obj_mainchara.y = obj_herokris.y;
    kr_actor.x = obj_herokris.x;
    kr_actor.y = obj_herokris.y;
    if (teamdefeated == true)
        kr_actor.sprite_index = spr_krisb_defeat;
    else
        kr_actor.sprite_index = spr_krisr_dark;
    su_actor.x = obj_herosusie.x;
    su_actor.y = obj_herosusie.y;
    if (teamdefeated == true)
        su_actor.sprite_index = spr_susie_dw_fell;
    else
        su_actor.sprite_index = spr_susie_walk_right_dw_unhappy;
    ra_actor.x = obj_heroralsei.x;
    ra_actor.y = obj_heroralsei.y;
    if (teamdefeated == true)
        ra_actor.sprite_index = spr_ralsei_defeat;
    else
        ra_actor.sprite_index = spr_ralsei_walk_right_unhappy;
    roaring_knight.x = obj_knight_enemy.x;
    roaring_knight.ystart = obj_knight_enemy.y;
    roaring_knight.sprite_index = spr_roaringknight_idle_overworld_sword;
    roaring_knight_hurt_pos = roaring_knight.x;
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
    with (obj_actor)
        visible = 1;
    roaring_knight.visible = 1;
    roaring_knight.state = 0;
    roaring_knight.sword_active = false;
    roaring_knight.grab_hand = false;
    if (i_ex(obj_monsterparent))
    {
        with (obj_monsterparent)
            instance_destroy();
    }
    if (i_ex(obj_bulletparent))
    {
        with (obj_bulletparent)
            instance_destroy();
    }
    if (i_ex(obj_heroparent))
    {
        with (obj_heroparent)
            instance_destroy();
    }
    if (i_ex(obj_battlecontroller))
        instance_destroy(obj_battlecontroller);
}
if (con == 10 && !i_ex(obj_battlecontroller) && customcon == 1)
{
    con = 11;
    customcon = 0;
    c_waitcustom_end();
    c_mus2("initloop", "knight_appears.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 60);
    c_var_lerp_instance(roaring_knight, "x", roaring_knight.x, roaring_knight.x - 347, 40, -1, "inout");
    c_var_lerp_instance(roaring_knight, "ystart", roaring_knight.ystart, 60, 40);
    c_wait(10);
    c_panspeed(-6, 0, 30);
    c_wait(120);
    c_var_instance(roaring_knight, "hover_pause", true);
    c_var_instance(roaring_knight, "y", 72);
    c_var_instance(id, "roaring_knight_beam_start", true);
    c_sound_play_x(snd_knight_stretch, 0.8, 0.6);
    c_sound_play_x(snd_knight_stretch, 0.8, 0.4);
    c_var_instance(id, "toriel_grab", true);
    c_wait(180);
    c_mus("free_all");
    c_var_instance(roaring_knight, "reach_sprite", 1930);
    c_var_instance(roaring_knight, "susie_grab", true);
    c_wait(10);
    c_var_instance(id, "roaring_knight_beam_stop", true);
    c_var_instance(id, "toriel_grab", false);
    c_wait(40);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* No..^1. you... you can't.../", "obj_ch3_PTB02_slash_Step_0_gml_629_0");
    c_msgnextloc("\\EV* You can't..^1. take her.../%", "obj_ch3_PTB02_slash_Step_0_gml_753_0");
    c_talk_wait();
    c_wait(60);
    c_sel(un);
    c_visible(1);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_setxy(3135, 100);
    c_script_instance(id, snd_play, 15, snd_spearappear);
    c_wait(40);
    c_script_instance_stop(id, snd_play);
    c_wait(18);
    c_var_instance(roaring_knight, "sword_active", false);
    c_var_instance(id, "spear_throw_start", true);
    c_wait(18);
    c_sel(su);
    c_autodepth(1);
    c_sprite(spr_susieb_defeat);
    c_shakeobj();
    c_wait(30);
    c_var_instance(id, "spear_throw_stop", true);
    c_wait(60);
    c_var_instance(id, "roaring_knight_turn", true);
    c_wait(10);
    c_pan(2720, cameray(), 30);
    c_wait(30);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_transition_sword);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0.4);
    c_wait(20);
    c_var_instance(roaring_knight, "image_speed", 0);
    c_var_instance(roaring_knight, "reach_interrupt", false);
    c_var_instance(roaring_knight, "hover_pause", false);
    c_wait(10);
    c_mus2("initloop", "creepychase.ogg", 0);
    c_speaker("undyne");
    c_msgsetloc(0, "\\E1* Hey!^1! You!^1! Stop!^1! Police!!/", "obj_ch3_PTB02_slash_Step_0_gml_709_0");
    c_msgnextloc("\\E4* Wh..^1. What the hell is going on here!!?/", "obj_ch3_PTB02_slash_Step_0_gml_710_0");
    c_msgnextloc("\\E3* You've got some explaining to do^1, punk!!/%", "obj_ch3_PTB02_slash_Step_0_gml_711_0");
    c_talk_wait();
    c_var_instance(roaring_knight, "hover_pause", true);
    c_var_instance(id, "roaring_knight_bird", true);
    c_wait(1);
    c_snd_play(snd_drake_dodge);
    c_snd_play(snd_jump_bc);
    c_var_instance(roaring_knight, "image_speed", 0.6);
    c_wait(5);
    c_var_instance(id, "bird_loop", true);
    c_var_lerp_to_instance(roaring_knight, "x", 6200, 160, 2, "in");
    c_wait(20);
    c_var_instance(id, "camera_pan", true);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_fly);
    c_wait_if(roaring_knight, "x", ">=", 3040);
    c_wait(1);
    c_sel(un);
    c_visible(0);
    c_var_instance(roaring_knight, "undyne_catch", true);
    c_sound_play(snd_grab);
    c_msgzurasu(1);
    c_speaker("undyne");
    c_msgsetloc(0, "\\E8* Hey^1, what are you doing!?/", "obj_ch3_PTB02_slash_Step_0_gml_741_0");
    c_msgnextloc("\\E9* Put me..^1. PUT ME DOWN!!!/%", "obj_ch3_PTB02_slash_Step_0_gml_742_0");
    c_talk();
    c_wait_if(roaring_knight, "x", ">=", 4500);
    c_lerp_var_instance(id, "bird_pitch", 0.6, 0.1, 60, 2, "in");
    c_lerp_var_instance(id, "bird_volume_multiplier", 1, 0, 60, 2, "in");
    c_wait_talk();
    c_wait_if(id, "bird_volume_multiplier", "<=", 0);
    c_var_instance(id, "bird_loop", false);
    c_sel(ra);
    c_sprite(spr_ralsei_kneel_serious);
    c_setxy(2227, 248);
    c_wait(60);
    c_var_instance(id, "camera_pan", false);
    c_var_instance(id, "camera_pan_timer", 0);
    c_var_instance(id, "camera_pan_back", true);
    c_wait(120);
    c_var_instance(id, "camera_pan_back", false);
    c_sel(su);
    c_shakeobj();
    c_sound_play(snd_noise);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Hey.../%", "obj_ch3_PTB02_slash_Step_0_gml_768_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_crouch);
    c_halt();
    c_shakeobj();
    c_sound_play(snd_noise);
    c_wait(5);
    c_imageindex(1);
    c_wait(15);
    c_sound_play(snd_wing);
    c_sprite(spr_susie_run_serious_right);
    c_imagespeed(0.4);
    c_walkdirect(3400, 122, 90);
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* Hey^1, where the hell are you going?!/%", "obj_ch3_PTB02_slash_Step_0_gml_789_0");
    c_talk_wait();
    c_wait(60);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_dw_landed);
    c_halt();
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(4);
    c_imagespeed(0);
    c_wait(15);
    c_waitcustom();
}
if (bird_loop)
{
    bird_loop_timer++;
    if (bird_loop_timer == 6)
        snd_play_x(snd_knight_puff, 0.85 * bird_volume_multiplier, bird_pitch);
    if (bird_loop_timer >= 10)
    {
        bird_loop_timer = 0;
        snd_play_x(snd_heavy_passing, bird_volume_multiplier, 1);
    }
}
if (con == 11 && customcon == 1)
{
    con = 12;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_autowalk(1);
    c_facing("d");
    c_addxy(8, 4);
    c_wait(15);
    c_var_instance(id, "make_npcs", true);
    c_pan_wait(2063, cameray(), 15);
    c_wait(16);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (spear_throw_start)
{
    spear_throw_start = false;
    spear_throw_controller = instance_create(roaring_knight.x, roaring_knight.y, obj_ch3_PTB02_roaringknight_speardodge_sequence);
    with (roaring_knight)
    {
        after_active = false;
        visible = 0;
    }
}
if (spear_throw_stop)
{
    spear_throw_stop = false;
    with (spear_throw_controller)
    {
        done = 1;
        spear_dodge = 1;
    }
    scr_doom(spear_throw_controller, 13);
    with (roaring_knight)
    {
        sprite_index = spr_roaringknight_ball_fly;
        image_speed = 0.2;
        state = 0;
        scr_delay_var("visible", true, 13);
        scr_delay_var("after_active", true, 13);
    }
}
if (con == 12 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    con = 60;
    camera_lock = true;
    with (obj_mainchara)
        cutscene = 0;
    with (roaring_knight)
        instance_destroy();
    with (obj_tennadeath_event)
        instance_destroy();
}
if (con == 50 && !i_ex(obj_battlecontroller))
{
    con = 10;
    customcon = 0;
    snd_stop_all();
    c_waitcustom_end();
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_setxy(2288, 190);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_sel(su);
    c_setxy(2310, 142);
    c_facing("susieunhappy");
    c_facing("r");
    c_wait(60);
    c_var_lerp_to_instance(whiteall, "image_alpha", 0, 60);
    c_mus2("initloop", "wind_highplace.ogg", 0);
    c_mus2("pitch", 0.5, 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 60);
    c_wait(60);
    c_wait(60);
    c_var_instance(roaring_knight, "after_active", false);
    c_var_instance(roaring_knight, "reach_interrupt", true);
    c_wait(15);
    c_mus("free_all");
    c_var_instance(id, "roaring_knight_warp", true);
    c_wait(30);
    c_wait_if(id, "roaring_knight_warp", "=", false);
    c_wait(90);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* We..^1. we actually beat it?/%", "obj_ch3_PTB02_slash_Step_0_gml_927_0");
    c_talk_wait();
    c_pannable(1);
    c_pan(2400, 0, 30);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(2510, 142, 30);
    c_msgzurasu(1);
    c_speaker("susie");
    c_var_instance(su_actor, "rsprite", 686);
    c_msgsetloc(0, "\\EW* What^1, don't tell me you've had ENOUGH already?/", "obj_ch3_PTB02_slash_Step_0_gml_873_0");
    c_msgnextloc("\\EY* C'mon^1, we were just getting started!/%", "obj_ch3_PTB02_slash_Step_0_gml_1060_0");
    c_talk_wait();
    c_wait(30);
    c_wait_if(su_actor, "x", ">=", 2510);
    c_sel(su);
    c_autowalk(0);
    c_autodepth(0);
    c_var_instance(id, "susie_knight_slash", true);
    c_delaycmd4(380, "pan", camerax(), 0, 60);
    c_wait_if(id, "susie_knight_slash", "=", false);
    c_wait(40);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_transition_sword);
    c_var_lerp_instance(roaring_knight, "image_index", 8, 5, 8);
    c_wait(8);
    c_var_instance(roaring_knight, "reach_interrupt", false);
    c_var_instance(roaring_knight, "hover_pause", false);
    c_var_instance(roaring_knight, "after_active", true);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_fly);
    c_var_instance(roaring_knight, "image_speed", 0.4);
    c_mus2("initloop", "wind_highplace.ogg", 0);
    c_mus2("pitch", 0.5, 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 60);
    c_wait(145);
    c_speaker("susie");
    c_sel(su);
    c_sprite(spr_susieb_idle);
    c_imagespeed(0.334);
    c_msgsetloc(0, "\\EX* Heheh.../%", "obj_ch3_PTB02_slash_Step_0_gml_877_0");
    c_talk_wait();
    c_flip("x");
    c_sprite(spr_susie_laugh_dw);
    c_imagespeed(0.25);
    c_imageindex(0);
    c_soundplay(snd_suslaugh);
    c_wait(60);
    c_imagespeed(0);
    c_msgsetloc(0, "\\EY* Not so tough NOW^1, are you!?/%", "obj_ch3_PTB02_slash_Step_0_gml_1125_0");
    c_talk_wait();
    c_sprite(spr_susie_laugh_dw);
    c_imagespeed(0.25);
    c_mus2("loopsfx", 169, 0);
    c_wait(26);
    c_mus("loopsfxstop");
    c_mus("pause");
    c_snd_play_x(snd_knight_cut2, 8, 0.06);
    c_snd_play_x(snd_knight_cut2, 8, 0.1);
    c_snd_play_x(snd_knight_cut2, 8, 0.12);
    c_snd_play_x(snd_knight_cut2, 8, 0.18);
    c_snd_play_x(snd_knight_cut2, 8, 0.24);
    c_var_instance(whiteall, "image_blend", 0);
    c_var_instance(whiteall, "image_alpha", 1);
    c_var_instance(whiteall, "visible", 1);
    c_var_instance(white_slash, "depth", -120);
    c_var_instance(white_slash, "x", 2420);
    c_var_instance(white_slash, "y", 182);
    c_var_instance(white_slash, "visible", 1);
    c_var_instance(roaring_knight, "x", camerax() + view_wport[0] + 300);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_idle_overworld);
    c_flip("x");
    c_sel(su);
    c_setxy(2410, 142);
    c_sprite(spr_susie_dw_fell);
    c_autodepth(1);
    c_sel(ra);
    c_facing("u");
    c_wait(55);
    c_sel(su);
    c_var_lerp_to("x", 2310, 40, 2, "in");
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_behind);
    c_wait(25);
    c_mus("resume");
    c_var_instance(id, "big_shake", true);
    c_var_instance(whiteall, "visible", 0);
    c_var_instance(white_slash, "visible", 0);
    c_var_instance(id, "swoon_target", su_actor);
    c_wait(60);
    c_var_instance(id, "unskip_writer", true);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EY* S-Susie!^1!!/%", "obj_ch3_PTB02_slash_Step_0_gml_881_0");
    c_talk_wait();
    c_var_instance(ra_actor, "rsprite", 359);
    c_autowalk(1);
    c_walkwait("r", 8, 10);
    c_facing("u");
    c_wait(60);
    c_msgsetloc(0, "\\EZ* H..^1. how could you.../%", "obj_ch3_PTB02_slash_Step_0_gml_1209_0");
    c_talk_wait();
    c_mus("pause");
    c_var_instance(id, "unskip_writer", false);
    c_snd_play_x(snd_knight_cut2, 8, 0.06);
    c_snd_play_x(snd_knight_cut2, 8, 0.1);
    c_snd_play_x(snd_knight_cut2, 8, 0.12);
    c_snd_play_x(snd_knight_cut2, 8, 0.18);
    c_snd_play_x(snd_knight_cut2, 8, 0.24);
    c_var_instance(whiteall, "visible", 1);
    c_var_instance(white_slash, "depth", -120);
    c_var_instance(white_slash, "x", 2408);
    c_var_instance(white_slash, "y", 240);
    c_var_instance(white_slash, "visible", 1);
    c_sel(ra);
    c_setxy(2328, 190);
    c_sprite(spr_ralsei_defeat);
    c_wait(90);
    c_mus("resume");
    c_var_instance(id, "big_shake", true);
    c_var_instance(whiteall, "visible", 0);
    c_var_instance(white_slash, "visible", 0);
    c_var_lerp_to("x", 2280, 30, 2, "out");
    c_var_instance(id, "swoon_target", ra_actor);
    c_sel(kr);
    c_wait(180);
    c_mus("pause");
    c_var_instance(whiteall, "visible", 1);
    c_var_instance(roaring_knight, "sprite_index", spr_roaring_knight_kris_knighting);
    c_var_instance(roaring_knight, "y", 44);
    c_var_instance(roaring_knight, "x", 2326);
    c_var_instance(roaring_knight, "hover_pause", true);
    c_var_instance(roaring_knight, "image_index", 1);
    c_var_instance(roaring_knight, "image_speed", 0);
    c_var_instance(roaring_knight, "after_active", false);
    c_sel(kr);
    c_visible(0);
    c_wait(90);
    c_var_instance(whiteall, "visible", 0);
    c_mus("resume");
    c_wait(30);
    c_var_lerp_instance(roaring_knight, "image_index", 1, 4, 90, 2, "in");
    c_wait(120);
    c_mus("pause");
    c_var_instance(whiteall, "visible", 1);
    c_sel(kr);
    c_sprite(spr_krisb_defeat);
    c_visible(1);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_idle_overworld_sword);
    c_var_instance(roaring_knight, "hover_pause", false);
    c_var_instance(roaring_knight, "after_active", true);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "x", 2655);
    c_wait(120);
    c_var_instance(whiteall, "visible", 0);
    c_mus("free_all");
    c_wait(60);
    c_wait(60);
    c_waitcustom();
}
if (roaring_knight_warp)
{
    roaring_knight_warp_timer++;
    if (roaring_knight_warp_timer == 1)
    {
        if (roaring_knight_warp_cache == 0)
            roaring_knight_warp_cache = new Vector2(roaring_knight.x, roaring_knight.y);
        with (roaring_knight)
        {
            hover_pause = true;
            state = 2;
        }
    }
    if (roaring_knight_warp_timer == 31)
        roaring_knight_warp_start = true;
    if (roaring_knight_warp_timer == 56)
        roaring_knight_warp_start = true;
    if (roaring_knight_warp_timer == 69)
        roaring_knight_warp_start = true;
    if (roaring_knight_warp_timer == 82)
        roaring_knight_warp_start = true;
    if (roaring_knight_warp_timer == 95)
    {
        roaring_knight_warp = false;
        sprite_index = spr_roaring_knight_overworld_warp;
        image_index = 5;
        roaring_knight.x = roaring_knight_warp_cache.x;
        roaring_knight.y = roaring_knight_warp_cache.y;
        with (roaring_knight)
            state = 3;
    }
    if (roaring_knight_warp_start)
    {
        roaring_knight_warp_start = false;
        with (roaring_knight)
        {
            sprite_index = spr_roaring_knight_static;
            image_index = 0;
            x += choose(-20, -10, 10, 20);
            y += choose(-20, -10, 10, 20);
            state = 2;
        }
    }
}
if (unskip_writer && i_ex(obj_writer))
{
    with (obj_writer)
        skippable = 0;
}
if (swoon_target != -4)
{
    swoon_display(swoon_target);
    swoon_target = -4;
}
if (con == 51 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 340;
    global.tempflag[90] = 0;
    con = 60;
    with (obj_mainchara)
        cutscene = 0;
    camera_lock = true;
    with (roaring_knight)
        instance_destroy();
    with (obj_tennadeath_event)
        instance_destroy();
}
if (left_exit_block == -4 && con == 60 && camerax() >= 2800)
{
    left_exit_block = instance_create(camerax() - 40, cameray(), obj_solidblocksized);
    with (left_exit_block)
        image_yscale = 20;
}
if (con == 60 && obj_mainchara.x >= (7100 - grand_door_offset))
{
    con = 61;
    global.interact = 1;
    camera_lock = false;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_facing("r");
    c_wait(15);
    c_pannable(1);
    c_pan(7100 - grand_door_offset, 0, 60);
    c_sel(kr);
    c_walkdirect(7200 - grand_door_offset, 266, 60);
    c_wait(60);
    c_sel(kr);
    c_facing("r");
    c_wait(15);
    c_msgside("top");
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Can't..^1. see..^1. anything.../", "obj_ch3_PTB02_slash_Step_0_gml_1493_0");
    c_msgnextloc("* .../", "obj_ch3_PTB02_slash_Step_0_gml_1494_0");
    c_msgnextloc("* Kris..^1. Kris!/", "obj_ch3_PTB02_slash_Step_0_gml_1495_0");
    c_msgnextloc("* There's.../%", "obj_ch3_PTB02_slash_Step_0_gml_1496_0");
    c_talk_wait();
    c_var_instance(susie_marker, "sprite_index", spr_susie_walk_up_dw);
    c_var_lerp_to_instance(grand_door, "image_alpha", 0.25, 30);
    c_wait(30);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* There's some kind of..^1. door here...!/%", "obj_ch3_PTB02_slash_Step_0_gml_1507_0");
    c_talk_wait();
    c_var_lerp_to_instance(susie_marker, "y", susie_marker.y - 40, 8);
    c_var_instance(susie_marker, "image_speed", 0.2);
    c_wait(4);
    c_var_lerp_to_instance(susie_marker, "image_alpha", 0, 8);
    c_wait(30);
    c_sel(kr);
    c_walkdirect_wait(7395 - grand_door_offset, 266, 45);
    c_facing("u");
    c_wait(15);
    c_walkdirect(7395 - grand_door_offset, 222, 30);
    c_mus2("volume", 0, 30);
    c_wait(15);
    c_var_lerp_to("image_alpha", 0, 15);
    c_wait(45);
    c_waitcustom();
}
if (con == 61 && customcon == 1)
{
    con = 62;
    alarm[0] = 90;
    snd_free_all();
    snd_play(snd_revival);
    var glow = instance_create(camerax(), cameray(), obj_ch3_PTB02_white_glow);
}
if (con == 63 && customcon == 1)
{
    con = 64;
    customcon = 0;
    _blackall = scr_dark_marker(camerax() - 10, cameray() - 10, spr_pixel_white);
    _blackall.image_xscale = 999;
    _blackall.image_yscale = 999;
    _blackall.depth = -110;
    _blackall.image_blend = c_black;
    _blackall.image_alpha = 0;
    c_waitcustom_end();
    c_var_lerp_instance(_blackall, "image_alpha", 0, 1, 60);
    c_wait(120);
    c_waitcustom();
}
if (con == 64 && customcon == 1)
{
    con = -1;
    global.plot = 340;
    room_goto(room_town_krisyard_dark);
}
if (roaring_knight_waver)
{
    roaring_knight_waver_timer++;
    if (roaring_knight_hurt_pos == 0)
        roaring_knight_hurt_pos = roaring_knight.x;
    if (roaring_knight_waver_timer >= 1 && roaring_knight_waver_timer < 30)
    {
        roaring_knight_waver_siner += 0.3;
        roaring_knight.x = roaring_knight_hurt_pos + (sin(roaring_knight_waver_siner) * 20);
    }
    else
    {
        roaring_knight_waver_siner = 0;
        roaring_knight.x = scr_movetowards(roaring_knight.x, roaring_knight_hurt_pos, 2);
        if (roaring_knight.x == roaring_knight_hurt_pos)
        {
            roaring_knight_waver = false;
            roaring_knight_waver_timer = 0;
        }
    }
}
if (big_shake)
{
    big_shake = false;
    snd_play(snd_impact);
    snd_play_x(snd_closet_impact, 1, 1);
    snd_play_x(snd_closet_impact, 1, 0.5);
    snd_play_x(snd_bageldefeat, 0.8, 0.8);
    snd_play(snd_damage);
    snd_play_x(snd_glassbreak, 0.8, 0.4);
    snd_play_x(snd_glassbreak, 0.6, 0.3);
    var _big_shake = instance_create(0, 0, obj_shake);
    with (_big_shake)
    {
        shakex = 10;
        shakespeed = 2;
        shakesign = 2;
    }
}
if (susie_knight_slash)
{
    susie_knight_slash_timer++;
    if (susie_knight_slash_timer == 1)
    {
        snd_play(snd_jump);
        su_actor.depth = 6000;
        with (su_actor)
        {
            scr_lerpvar("hspeed", 0, 20, 5);
            vspeed = -14;
            gravity = 2;
            sprite_index = spr_susie_clash_jump;
            image_index = 1;
            friction = 0;
        }
        show_clash_overlay();
    }
    if (susie_knight_slash_timer == 10)
    {
        susie_knight_shake_sequence = true;
        scr_shakescreen();
        sound_play_x(snd_laz_c, 1, 0.7);
        snd_play(snd_heavyswing);
        sound_play_x(snd_closet_impact, 1, 0.9);
        sound_play_x(snd_impact, 1, 0.7);
        with (su_actor)
        {
            friction = 0;
            vspeed = 0;
            gravity = 0;
            hspeed = 0;
            visible = 0;
        }
        su_actor.x = roaring_knight.x - 30;
        su_actor.y = roaring_knight.y - 40;
        with (roaring_knight)
        {
            sprite_index = spr_roaring_knight_susie_clash;
            image_speed = 0.4;
            state = 0;
            shakeamt = 2;
            scr_shakeobj_ext(id, 24, 10, 3, 2);
        }
    }
    if (susie_knight_shake_sequence)
    {
        susie_knight_shake_timer++;
        if ((susie_knight_shake_timer % susie_knight_shake_time) == 1)
        {
            susie_knight_shake_time -= 10;
            if (susie_knight_shake_time <= 30)
                susie_knight_shake_sequence = false;
            scr_shakescreen();
            var _clash_vfx = scr_dark_marker(roaring_knight.x - 90, roaring_knight.y - 90, spr_fx_hitback);
            with (_clash_vfx)
                scr_lerpvar("image_index", 0, 4, 12);
            _clash_vfx.image_xscale = 2;
            _clash_vfx.image_yscale = 2;
            with (_clash_vfx)
                scr_afterimage_grow();
            scr_doom(_clash_vfx, 16);
            _clash_vfx = scr_dark_marker(roaring_knight.x - 90, roaring_knight.y - 90, spr_fx_hitback);
            with (_clash_vfx)
                scr_lerpvar("image_index", 0, 4, 24);
            _clash_vfx.image_xscale = 2;
            _clash_vfx.image_yscale = 2;
            _clash_vfx.image_alpha = 0.5;
            scr_doom(_clash_vfx, 24);
            scr_lerpvar_instance(_clash_vfx, "image_alpha", 0.5, 0, 24);
            snd_stop(snd_damage);
            snd_play(snd_damage);
            snd_play_x(snd_metal_hit_strong, 0.5, 0.8);
            snd_stop(snd_closet_impact);
            snd_stop(snd_impact);
            snd_play_x(snd_closet_impact, 1, 0.9);
            snd_play_x(snd_impact, 1, 0.7);
            show_clash_overlay(8, 0.5);
            with (roaring_knight)
            {
                var afterimage = scr_afterimage();
                afterimage.speed = 4;
                afterimage.direction = random_range(-60, 20);
                var afterimageb = scr_afterimage();
                afterimageb.speed = 2;
                afterimageb.direction = afterimage.speed;
                afterimageb = scr_afterimage();
                afterimageb.speed = 1;
                afterimageb.direction = afterimage.speed;
                scr_shakeobj_ext(id, 24, 10, 3, 2);
            }
        }
    }
    else
    {
        var _susie_finish_time = 300;
        var _jump_back_time = _susie_finish_time + 20;
        if (susie_knight_slash_timer == _susie_finish_time)
        {
            var _clash_vfx = scr_dark_marker(roaring_knight.x - 90, roaring_knight.y - 90, spr_fx_hitback);
            with (_clash_vfx)
                scr_lerpvar("image_index", 0, 4, 12);
            _clash_vfx.image_xscale = 2;
            _clash_vfx.image_yscale = 2;
            scr_doom(_clash_vfx, 12);
            snd_stop(snd_damage);
            snd_play(snd_damage);
            show_clash_overlay(8, 0.5);
            with (roaring_knight)
            {
                hspeed = 8;
                friction = 2;
                shakeamt = 0;
                image_index = 2;
                image_speed = 0;
            }
        }
        if (susie_knight_slash_timer == _jump_back_time)
        {
            sound_play_x(snd_laz_c, 1, 0.9);
            snd_play(snd_glassbreak);
            snd_play(snd_sparkle_glock);
            with (su_actor)
            {
                visible = 1;
                sprite_index = spr_susie_clash_jump;
                vspeed = -4;
                gravity = 2;
                hspeed = -14;
                image_index = 0;
                image_speed = 0;
            }
            with (roaring_knight)
            {
                sprite_index = spr_roaring_knight_clash_pull_back;
                image_index = 0;
                image_speed = 0;
                state = 0;
                scr_delay_var("image_index", 1, 4);
            }
            piece_marker = scr_dark_marker(roaring_knight.x, roaring_knight.y, spr_roaringknight_sword_break_piece_small);
            with (piece_marker)
            {
                scr_depth();
                vspeed = -8;
                gravity = 2;
                hspeed = -7;
                scr_lerpvar("image_angle", 0, 1280, 20);
                scr_var_delay("gravity", 0, 16);
                scr_var_delay("hspeed", 0, 16);
                scr_var_delay("vspeed", 0, 16);
            }
        }
        if (susie_knight_slash_timer == (_jump_back_time + 10))
        {
            with (su_actor)
            {
                sprite_index = spr_susieb_idle_serious;
                vspeed = 0;
                gravity = 0;
                friction = 2;
                image_index = 0;
                image_speed = 0;
            }
        }
        if (susie_knight_slash_timer == (_jump_back_time + 20))
        {
            susie_knight_slash = false;
            sword_shiny = scr_dark_marker(piece_marker.x - 4, piece_marker.y - 4, spr_shine_white);
            with (sword_shiny)
            {
                image_speed = 0.1;
                scr_depth();
            }
        }
    }
}
if (tenna_hurt)
{
    tenna_hurt = false;
    if (i_ex(obj_tennadeath_event))
    {
        with (obj_tennadeath_event)
            instance_destroy();
    }
    instance_create(te_actor.x - 80, te_actor.y - 220, obj_tennadeath_event);
}
if (susie_slash)
{
    susie_slash_timer++;
    var anim_speed = 2;
    if (susie_slash_timer == 1)
    {
        with (su_actor)
        {
            scr_lerpvar("hspeed", 0, 14, 5);
            vspeed = -14;
            gravity = 2;
            sprite_index = spr_susie_hit_back_serious;
            image_index = 1;
        }
    }
    if (susie_slash_timer == (1 + anim_speed))
    {
        with (roaring_knight)
        {
            reach_speed = 8;
            reach_retract = true;
        }
        with (su_actor)
            image_index = 3;
    }
    if (susie_slash_timer == (1 + (anim_speed * 3)))
    {
        sound_play_x(snd_laz_c, 1, 0.9);
        with (su_actor)
        {
            friction = 1.5;
            image_index = 12;
        }
    }
    if (susie_slash_timer == (1 + (anim_speed * 4)))
    {
        with (su_actor)
        {
            vspeed = 0;
            gravity = 0;
            image_index = 13;
        }
    }
    if (susie_slash_timer == (1 + (anim_speed * 5)))
    {
        with (su_actor)
            image_index = 14;
    }
    if (susie_slash_timer == (1 + (anim_speed * 6)))
    {
        with (su_actor)
            sprite_index = spr_susie_idle_serious;
    }
}
if (tennawhite == 1)
{
    tennawhite = 2;
    var teflash;
    with (obj_actor_tenna)
    {
        sprite_index = spr_tenna_hooray_armsup;
        teflash = scr_dark_marker(x, y, spr_roaringknight_slash_tenna);
    }
    teflash.image_index = 13;
    teflash.image_speed = 0;
    teflash.depth = blackall.depth - 5;
    tennaslash = teflash;
    with (obj_border_controller)
        hide_border();
}
if (tennawhite == 3)
{
    with (tennaslash)
        instance_destroy();
    tennawhite = 0;
}
if (roaring_knight_fx)
{
    roaring_knight_fx = false;
    if (i_ex(obj_knight_roaring_fx))
    {
        with (obj_knight_roaring_fx)
            instance_destroy();
    }
    instance_create(roaring_knight.x + 20, roaring_knight.y - 20, obj_knight_roaring_fx);
}
if (slash_show)
{
    slash_show = false;
    var endframe = 40;
    snd_play_delay(snd_damage, 4, 0.8, 1);
    snd_play_delay(snd_damage, 4, 0.8, 0.6);
    with (tennaslash)
    {
        scr_lerpvar("image_index", 0, 15, endframe, 3, "out");
        scr_script_delayed(scr_shakeobj, 10);
    }
}
if (roaring_knight_turn)
{
    roaring_knight_turn = false;
    with (roaring_knight)
    {
        scr_flip("x");
        x += 20;
        after_image_dir = -1;
        scr_lerpvar("x", x, x + 440, 40, -1, "inout");
    }
}
if (roaring_knight_bird)
{
    roaring_knight_bird = false;
    with (roaring_knight)
    {
        sprite_index = spr_roaringknight_fly_transition;
        image_index = 0;
        image_xscale = 2;
        x -= 234;
    }
}
if (make_npcs)
{
    make_npcs = false;
    global.facing = 0;
    if (sword_shiny != -4)
    {
        sword_shiny_readable = instance_create(sword_shiny.x, sword_shiny.y, obj_readable_room1);
        with (sword_shiny_readable)
            extflag = "shard";
    }
    var defeated_knight = scr_flag_get(1047) == 1;
    var ralsei_npc = instance_create(ra_actor.x, ra_actor.y, obj_npc_room);
    ralsei_npc.sprite_index = ra_actor.sprite_index;
    ralsei_npc.normalanim = 4;
    ralsei_npc.extflag = defeated_knight ? "ralsei_down_knight" : "ralsei_down";
    with (ralsei_npc)
        scr_depth();
    var tor_readable = instance_create(toriel_gacha.x - 20, toriel_gacha.y + 10, obj_readable_room1);
    tor_readable.image_xscale = 2.5;
    tor_readable.image_yscale = 2;
    tor_readable.extflag = defeated_knight ? "toriel_sleep_knight" : "toriel_sleep";
    var tor_collider = instance_create(toriel_gacha.x - 30, 0, obj_soliddark);
    with (tor_collider)
    {
        image_xscale = 2;
        image_yscale = 5.5;
    }
    var tor_collider_angle = instance_create(toriel_gacha.x - 30, toriel_gacha.y + 37, obj_sul_dark);
    scr_losechar();
    with (obj_caterpillarchara)
        instance_destroy();
    var smoke = instance_create(0, 0, obj_dw_blacksmoke);
    var collider_top = instance_create(2920, 40, obj_solidblocksized);
    with (collider_top)
        image_xscale = 150;
    var collider_bottom = instance_create(2920, 440, obj_solidblocksized);
    with (collider_bottom)
        image_xscale = 150;
    susie_marker = scr_dark_marker(grand_door.x + 90, grand_door.y + 240, spr_susieu_dark_benddown);
    susie_marker.depth = grand_door.depth - 10;
    var east_collider = instance_create(7740, 0, obj_solidblocksized);
    with (east_collider)
        image_yscale = 20;
    var door_collider = instance_create(grand_door.x - 70, grand_door.y - 10, obj_solidblocksized);
    with (door_collider)
    {
        image_xscale = 9;
        image_yscale = 8;
    }
}
if (remove_shiny && !d_ex() && global.interact == 0)
{
    remove_shiny = false;
    with (sword_shiny)
        instance_destroy();
    with (sword_shiny_readable)
        instance_destroy();
    with (piece_marker)
        instance_destroy();
}
if (camera_pan)
{
    camera_pan_timer++;
    if (camera_pan_timer == 1)
    {
        scr_lerpvar("camera_x_pos", camerax(), 5000, 112, 2, "in");
        with (roaring_knight)
            scr_delay_var("undyne_hat", true, 30);
    }
    camera_set_view_pos(view_get_camera(0), camera_x_pos, cameray());
}
if (camera_pan_back)
{
    camera_pan_timer++;
    if (camera_pan_timer == 1)
        scr_lerpvar("camera_x_pos", camerax(), 1990, 120, 4, "inout");
    camera_set_view_pos(view_get_camera(0), camera_x_pos, cameray());
}
if (toriel_grab)
{
    toriel_grab_timer++;
    if ((toriel_grab_timer % 2) == 0)
    {
        with (toriel_gacha)
        {
            shake_offset_x = choose(-1, 0, 1);
            shake_offset_y = choose(-1, 0, 1);
        }
    }
    if (toriel_grab_timer == 1)
    {
        toriel_grab_x = 2080;
        toriel_grab_y = 160;
        with (toriel_gacha)
        {
            scr_lerpvar("hspeed", 0, 12, 10);
            friction = 10;
        }
    }
    if (toriel_grab_timer == 11)
    {
        with (toriel_gacha)
        {
            scr_lerpvar("hspeed", 0, 12, 30);
            friction = 10;
        }
    }
    if (toriel_grab_timer == 41)
    {
        with (toriel_gacha)
        {
            scr_lerpvar("hspeed", 0, 12, 50);
            friction = 10;
        }
    }
}
if (global.flag[20] == 1)
{
    global.flag[20] = 0;
    with (obj_writer)
        rate = 3;
}
if (overlay_pulse)
{
    overlay_siner += 0.08;
    blackall.image_alpha = clamp(overlay_alpha + (sin(overlay_siner) * 0.08), 0, 0.4);
}
if (susie_hide)
{
    susie_shadow = clamp(susie_shadow + 0.2, 0, 1);
    var shadow = susie_shadow;
    with (susie_marker)
        image_blend = merge_color(c_white, make_color_hsv(1, 1, 1), shadow);
    if (susie_shadow >= 1)
        susie_hide = false;
}
