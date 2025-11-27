if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("flashback_excerpt.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
    }
}
if (con == 2)
{
    con = 10;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + 530, 260, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_grasp;
    te_actor.preset = 0;
    c_sel(kr);
    c_setxy(camerax() + 200, 200);
    c_facing("r");
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_setxy(camerax() + 60, 188);
    c_sel(su);
    c_setxy(camerax() + 124, 188);
    c_facing("susieunhappy");
    c_facing("r");
    c_halt();
    c_sel(te);
    c_sprite(spr_tenna_pose_headraised);
    c_wait(90);
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* And^1, I've been having SO much fun playing with you all^1,/%", "obj_ch3_BTB06_slash_Step_0_gml_56_0");
    c_talk_wait();
    c_sel(te);
    c_sprite(spr_tenna_pose_headlowered);
    c_speaker("tenna");
    c_msgsetloc(0, "* I..^1. just don't want it to end!/%", "obj_ch3_BTB06_slash_Step_0_gml_64_0");
    c_talk_wait();
    c_sel(te);
    c_sprite(spr_tenna_pose_headraised);
    c_speaker("tenna");
    c_msgsetloc(0, "* So..^1. please..^1. just say it with me./%", "obj_ch3_BTB06_slash_Step_0_gml_72_0");
    c_talk_wait();
    c_mus("free_all");
    c_var_instance(id, "set_tenna_pitch", true);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_wait(30);
    c_var_instance(tv_time, "show_text", true);
    c_wait(10);
    c_wait_if(tv_time, "is_active", "=", false);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_autowalk(0);
    c_imagespeed(0.3);
    c_walkdirect_wait(camerax() + 300, 184, 10);
    c_halt();
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Enough already!!/%", "obj_ch3_BTB06_slash_Step_0_gml_124_0");
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sound_play_x(snd_laz_c, 1, 0.9);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susieb_attack);
    c_animate(0, 5, 0.5);
    c_wait(12);
    c_var_instance(id, "susie_attack_fx", true);
    c_sel(te);
    c_sprite(spr_tenna_desperate);
    c_imageindex(3);
    c_shakeobj();
    c_soundplay(snd_impact);
    c_wait(60);
    c_sel(ra);
    c_facing("r");
    c_sel(te);
    c_tenna_sprite(spr_tenna_tie_adjust_c);
    c_tenna_preset(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* Wh-what are you doing!? I just had this suit DE-AXED!!!/%", "obj_ch3_BTB06_slash_Step_0_gml_159_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_attackready_unhappy);
    c_addxy(0, 2);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* We're done messing around./", "obj_ch3_BTB06_slash_Step_0_gml_168_0");
    c_msgnextloc("\\EX* Give back Toriel. Now./%", "obj_ch3_BTB06_slash_Step_0_gml_169_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_headlowered);
    c_tenna_preset(0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Alright. I get it./%", "obj_ch3_BTB06_slash_Step_0_gml_178_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_up);
    c_tenna_preset(16);
    c_speaker("tenna");
    c_msgsetloc(0, "* I. GET IT^1! I REALLY get it!!/%", "obj_ch3_BTB06_slash_Step_0_gml_187_0");
    c_talk_wait();
    c_tenna_preset(12);
    c_speaker("tenna");
    c_msgsetloc(0, "* Talking!^1! I've been doing too much..^1. TALKING!!/", "obj_ch3_BTB06_slash_Step_0_gml_193_0");
    c_msgnextloc("* NO MORE questions!^1! What you need.../%", "obj_ch3_BTB06_slash_Step_0_gml_194_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_preset(0);
    c_var_instance(id, "tenna_snap", true);
    c_wait(20);
    c_sprite(spr_tenna_snap);
    c_addxy(0, 8);
    c_imageindex(4);
    c_var_instance(id, "border_switch", true);
    c_var_instance(bg_vfx, "split_screen", true);
    var y_offset = (global.lang == "ja") ? -20 : -10;
    scr_funnytext_init(0, 0, y_offset, scr_84_get_sprite("spr_funnytext_physical_challenge"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Is another&\\O0!^1!/%", "obj_ch3_BTB06_slash_Step_0_gml_211_0");
    c_talk_wait();
    c_var_instance(id, "battle_start", true);
    c_waitcustom();
}
if (con == 50)
{
    con = 10;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + 530, 260, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_pose_headlowered;
    te_actor.preset = 0;
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_halt();
    c_sel(te);
    c_tenna_preset(0);
    c_var_instance(id, "tenna_snap", true);
    c_var_instance(id, "border_switch", true);
    c_wait(20);
    c_var_instance(bg_vfx, "split_screen", true);
    c_sel(te);
    c_sprite(spr_tenna_snap);
    c_addxy(0, 8);
    c_imageindex(4);
    c_wait(15);
    c_var_instance(id, "battle_start", true);
    c_waitcustom();
}
if (con == 10 && customcon == 1)
{
    con = 11;
    customcon = 1;
    alarm[0] = 30;
    with (battle_bg)
    {
        scr_script_delayed(scr_lerpvar, 20, "audience_y_pos", audience_y_pos, 360, 20);
        paused = false;
    }
    snd_free_all();
    obj_mainchara.sprite_index = kr_actor.sprite_index;
    obj_mainchara.x = kr_actor.x;
    obj_mainchara.y = kr_actor.y;
    obj_mainchara.visible = 1;
    var sus_pos_x = su_actor.x;
    var sus_pos_y = su_actor.y;
    var sus_sprite = su_actor.sprite_index;
    var ra_pos_x = ra_actor.x;
    var ra_pos_y = ra_actor.y;
    var ra_sprite = ra_actor.sprite_index;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            x = sus_pos_x;
            y = sus_pos_y;
            sprite_index = sus_sprite;
        }
        else if (name == "ralsei")
        {
            x = ra_pos_x;
            y = ra_pos_y;
            sprite_index = ra_sprite;
        }
        visible = 1;
    }
    with (obj_actor)
        visible = 0;
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("tenna_battle.ogg");
    global.batmusic[2] = snd_init("tenna_battle_guitar.ogg");
    global.batmusic[3] = mus_loop(global.batmusic[2]);
    mus_volume(global.batmusic[3], 0, 0);
    encounterflag = 121;
    global.flag[54] = encounterflag;
    scr_battle(121, 1, 0, 0, 0);
    with (obj_battleback)
        instance_destroy();
    global.flag[9] = 1;
    with (bg_vfx)
        scr_delay_var("is_active", false, 30);
    with (te_actor)
        instance_destroy();
}
if (con == 12 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        con = 19;
        alarm[0] = 30;
        with (bg_vfx)
            clean_up();
        snd_volume(global.batmusic[1], 0, 25);
    }
}
if (con == 20)
{
    con = -1;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
    with (obj_actor)
        visible = 0;
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
    global.plot = 310;
    room_goto(room_dw_snow_zone);
}
if (susie_attack_fx)
{
    susie_attack_timer++;
    if (susie_attack_timer == 1)
    {
        attack = instance_create(te_actor.x + 20 + random(6), (te_actor.y - 120) + random(6), obj_basicattack);
        attack.sprite_index = spr_attack_mash2;
        attack.image_speed = 0.5;
        attack.maxindex = 4;
    }
    if (susie_attack_timer == 5)
    {
        susie_attack_fx = false;
        var healamt = instance_create(te_actor.x + 20, te_actor.y - 120, obj_dmgwriter);
        with (healamt)
        {
            delay = 4;
            type = 1;
            specialmessage = 3;
        }
        healamt.damage = 0;
    }
}
if (set_tenna_pitch)
{
    set_tenna_pitch = false;
    global.flag[1054] = 1;
}
if (tenna_snap)
{
    tenna_snap = false;
    tenna_snap_obj = instance_create(te_actor.x, te_actor.y + 8, obj_tenna_snap);
    tenna_snap_obj.con = 1;
    te_actor.visible = 0;
    with (te_actor)
        scr_delay_var("visible", true, 22);
    scr_doom(tenna_snap_obj, 22);
}
if (border_switch)
{
    border_switch = false;
    with (obj_border_controller)
        set_border(border_dw_blue_stars);
}
