if (con < 0)
    exit;
if (con == 0 && obj_mainchara.x >= 1120)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    scr_tempsave();
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(1616, cameray() - 20, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_grasp;
    te_actor.preset = 12;
    tenna = te_actor;
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* Look^1! There^1, I can see it...!/%", "obj_ch3_BTB04_slash_Step_0_gml_39_0");
    c_talk_wait();
    c_sel(kr);
    c_walkdirect(1330, 232, 20);
    c_sel(su);
    c_walkdirect(1230, 196, 20);
    c_sel(ra);
    c_walkdirect(1142, 176, 20);
    c_pannable(1);
    c_panspeed(4, 0, 70);
    c_wait(20);
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_wait(80);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EE* There's the Dark Fountain^1! If we can just.../%", "obj_ch3_BTB04_slash_Step_0_gml_67_0");
    c_talk_wait();
    c_sel(te);
    c_autowalk(0);
    c_sound_play(snd_fall);
    c_wait(8);
    c_var_lerp_instance(te_actor, "y", -20, 290, 20, -3, "out");
    c_wait(8);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sel(kr);
    c_facing("r");
    c_shake();
    c_sound_play(snd_closet_impact);
    c_var_instance(id, "text_shake", true);
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* No!^1! NO!^1! NO!!!!/%", "obj_ch3_BTB04_slash_Step_0_gml_98_0");
    c_talk_wait();
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_var_instance(te_actor, "wobblestate", 4);
    c_speaker("tenna");
    c_msgsetloc(0, "* WHAT are you doing!? WHERE are you going!? Ahaha!!/%", "obj_ch3_BTB04_slash_Step_0_gml_114_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_preset(25);
    c_wait(1);
    c_imagespeed(0.7);
    c_speaker("tenna");
    c_msgsetloc(0, "* There are still GAMES to play!^1! SHOWS to watch!!/%", "obj_ch3_BTB04_slash_Step_0_gml_123_0");
    c_talk_wait();
    c_imagespeed(1);
    c_speaker("tenna");
    c_msgsetloc(0, "* Laughs and SCREAMS!^1! Smiles and TEARS!!/%", "obj_ch3_BTB04_slash_Step_0_gml_130_0");
    c_talk();
    c_var_instance(te_actor, "hspeed", -6);
    c_wait(12);
    c_var_instance(te_actor, "hspeed", 0);
    c_wait(1);
    c_wait_talk();
    c_speaker("tenna");
    c_msgsetloc(0, "* Just wander back to your seats and we can.../%", "obj_ch3_BTB04_slash_Step_0_gml_144_0");
    c_imagespeed(2);
    c_talk();
    c_var_instance(te_actor, "hspeed", -6);
    c_wait(18);
    c_var_instance(te_actor, "hspeed", 0);
    c_wait(1);
    c_wait_talk();
    c_var_instance(id, "text_shake", false);
    c_sound_play_x(snd_weaponpull_fast, 0.8, 1);
    c_sel(su);
    c_autodepth(0);
    c_depth(97000);
    c_autowalk(0);
    c_sprite(spr_susieb_attack);
    c_animate(0, 5, 0.5);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_addxy(15, 5);
    c_shakeobj();
    c_sel(te);
    c_tenna_preset(0);
    c_sprite(spr_tenna_hurt);
    c_jump(1616, 290, 24, 6);
    c_wait(7);
    c_shakeobj();
    c_shake();
    c_snd_play(snd_impact);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* ENOUGH of your dumb games!!/%", "obj_ch3_BTB04_slash_Step_0_gml_181_0");
    c_talk_wait();
    c_sel(ra);
    c_facing("r");
    c_addxy(-15, -5);
    c_sel(su);
    c_sprite(spr_susie_idle_serious);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* Why the hell do you want us to play so bad anyway!?/%", "obj_ch3_BTB04_slash_Step_0_gml_194_0");
    c_talk_wait();
    c_wait(30);
    c_sel(te);
    c_sprite(spr_tenna_pose_headlowered);
    c_wait(30);
    c_var_instance(id, "set_tenna_pitch", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* Kris./%", "obj_ch3_BTB04_slash_Step_0_gml_208_0");
    c_talk_wait();
    c_pan(1300, cameray(), 60);
    c_wait(90);
    c_speaker("tenna");
    c_msgsetloc(0, "* Kris knows why./", "obj_ch3_BTB04_slash_Step_0_gml_216_0");
    c_msgnextloc("* Do you remember it^1, Kris?/%", "obj_ch3_BTB04_slash_Step_0_gml_217_0");
    c_talk_wait();
    c_wait(30);
    c_var_instance(id, "static_noise", true);
    c_sprite(spr_tenna_pose_headraised);
    c_var_instance(faceeffect, "active", true);
    c_var_instance(id, "facestatic", true);
    c_var_lerp_instance(id, "staticalpha", 0, 1, 10);
    c_wait(30);
    c_speaker("tenna");
    c_msgsetloc(0, "* When everyone came over for the holidays?/%", "obj_ch3_BTB04_slash_Step_0_gml_231_0");
    c_talk_wait();
    c_var_lerp_instance(id, "tennafacealpha", 0, 1, 15, 2, "out");
    c_pannable(1);
    c_var_instance(id, "tennaface", 1);
    c_var_lerp_instance(id, "tennafacealpha", 0, 1, 15, 2, "in");
    c_wait(16);
    c_var_lerp_instance(faceeffect, "rad", 0.01, 20, 25, 2, "in");
    c_var_lerp_instance(faceeffect, "whiteoverlayindex", 0, 1, 30, 2, "in");
    c_wait(60);
}
if (static_noise)
{
    static_noise = false;
    snd_free_all();
    snd_loop(snd_tv_static);
    snd_volume(snd_tv_static, 0, 0);
    snd_volume(snd_tv_static, 0.06, 30);
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.plot = 290;
    scr_tempsave();
    room_goto(room_torhouse_sepia);
    con = 99;
}
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (text_shake)
{
    with (obj_writer)
        shake = 1;
}
if (set_tenna_pitch)
{
    set_tenna_pitch = false;
    global.flag[1054] = 0.8;
}
if (con == 10 && obj_mainchara.x >= 1240)
{
    con = 20;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(1622, cameray() - 20, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_grasp;
    te_actor.preset = 12;
    tenna = te_actor;
    c_sel(te);
    c_autodepth(0);
    c_depth(97990);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_sel(kr);
    c_walkdirect(1330, 188, 15);
    c_delayfacing(16, "r");
    c_sel(su);
    c_walkdirect(1230, 196, 15);
    c_delayfacing(16, "r");
    c_sel(ra);
    c_walkdirect(1142, 220, 15);
    c_delayfacing(16, "r");
    c_pannable(1);
    c_pan(1092, 0, 15);
    c_sel(te);
    c_autowalk(0);
    c_sound_play(snd_fall);
    c_wait(8);
    c_var_lerp_instance(te_actor, "y", -20, 260, 15, -3, "out");
    c_wait(8);
    c_shake();
    c_sound_play(snd_closet_impact);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sel(kr);
    c_facing("r");
    c_wait(15);
    c_var_instance(id, "short_bg", true);
    c_sel(te);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_pose_headlowered);
    c_var_instance(id, "short_rooms", true);
    c_wait(12);
    c_waitcustom();
}
if (short_bg)
{
    short_bg = false;
    var false_bg = instance_create(0, 0, obj_dw_snow_zone_battle_bg);
    with (false_bg)
    {
        depth = 99000;
        persistent = true;
    }
}
if (short_rooms && customcon == 1)
{
    short_rooms = false;
    room_goto(room_dw_snow_zone_battle);
}
