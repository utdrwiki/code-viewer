if (con < 0)
    exit;
if (con == 0 && obj_mainchara.x >= 410 && global.interact == 0 && !d_ex())
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 4;
    alarm[0] = 30;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    gerson_npc = instance_create(camerax() - 100, cameray() - 100, obj_npc_gerson);
    gerson_npc.depth = 96000;
    c_var_instance(gerson_npc, "facing_right", true);
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_emote("!");
    c_wait(30);
    c_mus2("volume", 0, 60);
    c_pannable(1);
    c_pan(520, cameray(), 60);
    c_sel(su);
    c_walkdirect_wait(805, su_actor.y, 60);
    c_walkdirect_wait(805, 185, 15);
    c_facing("u");
    c_mus("free_all");
    c_msgside("bottom");
    if (scr_flag_get(1548) == 1)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* Damn..^1. so this is the Magic Axe^1, huh./%", "obj_dw_church_arena_slash_Step_0_gml_54_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* Damn..^1. I dunno what this axe is^1, but it looks awesome!/%", "obj_dw_church_arena_slash_Step_0_gml_59_0");
        c_talk_wait();
    }
    c_customfunc(function()
    {
        fanfare[0] = snd_init("fanfare.ogg");
        fanfare[1] = mus_play(fanfare[0]);
    });
    c_var_instance(id, "axe_hover", true);
    c_var_instance(axe_marker, "image_index", 1);
    c_var_lerp_to_instance(axe_marker, "y", axe_marker.y - 60, 30, 3, "inout");
    c_wait(8);
    c_sel(su);
    c_facing("r");
    c_wait(4);
    c_sprite(spr_susie_catch);
    c_wait(30);
    c_var_instance(id, "slow_writer", true);
    c_speaker("no_name");
    c_msgsetloc(0, "* (You got the%%", "obj_dw_church_arena_slash_Step_0_gml_85_0");
    c_talk_wait();
    c_var_instance(id, "slow_writer", false);
    c_mus("free_all");
    c_var_instance(id, "axe_hover", false);
    c_var_instance(axe_marker, "image_index", 0);
    c_var_lerp_to_instance(axe_marker, "y", axe_marker.y, 8, 3, "inout");
    c_wait(6);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_shakeobj();
    c_snd_play(snd_impact);
    c_shake();
    c_wait(15);
    c_speaker("gerson");
    c_msgsetloc(0, "* Wait a tick^1! You gotta pay for that!/%", "obj_dw_church_arena_slash_Step_0_gml_107_0");
    c_talk_wait();
    c_mus2("initloop", "gerson_theme_intro.ogg", 0);
    c_sel(su);
    c_facing("l");
    c_var_instance(gerson_npc, "x", 485);
    c_var_instance(gerson_npc, "y", 200);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 760, 120);
    c_wait(120);
    c_var_instance(gerson_npc, "current_state", 0);
    c_wait(15);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. Pay!? The heck are you talking about?/%", "obj_dw_church_arena_slash_Step_0_gml_130_0");
    c_talk_wait();
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 955, 70);
    c_delaycmd4(71, "var", gerson_npc, "current_state", 2);
    c_sel(su);
    c_autowalk(0);
    c_delaycmd4(20, "facing", "d");
    c_delaycmd(20, "imagespeed", 0.2);
    c_delaycmd4(20, "walk", "u", 2, 4);
    c_delaycmd4(60, "walk", "d", 2, 4);
    c_delaycmd(65, "autowalk", 1);
    c_delayfacing(65, "r");
    c_speaker("gerson");
    c_msgsetloc(0, "* This is still the inside of my study^1, ain't it?/%", "obj_dw_church_arena_slash_Step_0_gml_147_0");
    c_talk();
    c_wait(72);
    c_var_instance(gerson_npc, "facing_right", false);
    c_wait(15);
    c_wait_talk();
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait(60);
    c_var_instance(gerson_npc, "current_state", 0);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_look_diagonal);
    c_speaker("gerson");
    c_msgsetloc(0, "* Nothin' else was free^1, so why'd ya think we'd start here?/", "obj_dw_church_arena_slash_Step_0_gml_171_0");
    c_facenext("susie", "2");
    c_msgnextloc("\\E2* Haha^1, good one. I'm taking the axe now./", "obj_dw_church_arena_slash_Step_0_gml_173_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* ..^1. don't think I'm serious? Check the price tag!/", "obj_dw_church_arena_slash_Step_0_gml_175_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* Huh...? Price..^1. what?/%", "obj_dw_church_arena_slash_Step_0_gml_177_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait_box(4);
    c_var_instance(gerson_npc, "current_state", 8);
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_flip("x");
    c_wait_talk();
    c_var_instance(gerson_npc, "current_state", 9);
    c_sel(su);
    c_facing("u");
    c_flip("x");
    c_wait(4);
    c_sprite(spr_susie_hand_hips);
    c_flip("x");
    c_addxy(0, -4);
    c_speaker("susie");
    c_msgsetloc(0, "\\EB* ..^1. it says it costs..^1. uh.../%", "obj_dw_church_arena_slash_Step_0_gml_208_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_shocked_behind);
    c_flip("x");
    c_addxy(-8, 4);
    c_emote("!", 30, 16, 1);
    c_shakeobj();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* $999^1,999^1,999!?/", "obj_dw_church_arena_slash_Step_0_gml_222_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Geh heh heh^1, didn't realize it was still on discount!/", "obj_dw_church_arena_slash_Step_0_gml_224_0");
    c_msgnextloc("* ..^1. But I know. You worked real hard to get here. So how 'bout a trade?/", "obj_dw_church_arena_slash_Step_0_gml_225_0");
    c_msgnextloc("* If you^1, and you alone^1, can best my challenge..^1. I give it to ya. For free./", "obj_dw_church_arena_slash_Step_0_gml_226_0");
    c_facenext("susie", "2");
    c_msgnextloc("\\E2* Heh^1, knew you'd say that. What do you want?/", "obj_dw_church_arena_slash_Step_0_gml_228_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Hmm..^1. how about.../", "obj_dw_church_arena_slash_Step_0_gml_230_0");
    c_msgnextloc("* ..^1. a haircut?/", "obj_dw_church_arena_slash_Step_0_gml_231_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* ..^1. a HAIRCUT?/", "obj_dw_church_arena_slash_Step_0_gml_233_0");
    c_msgnextloc("\\E9* Alright^1, sure. Which hair you want me to cut?/", "obj_dw_church_arena_slash_Step_0_gml_234_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Oh^1, any of 'em./%", "obj_dw_church_arena_slash_Step_0_gml_236_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_flip("x");
    c_addxy(-18, 0);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait_box(3);
    c_var_instance(gerson_npc, "current_state", 6);
    c_wait_box(4);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw);
    c_flip("x");
    c_wait_box(8);
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait_box(9);
    c_var_instance(gerson_npc, "current_state", 9);
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_flip("x");
    c_wait_box(12);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw);
    c_flip("x");
    c_wait_box(14);
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait_talk();
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait(60);
    c_var_instance(gerson_npc, "current_state", 9);
    c_speaker("gerson");
    c_msgsetloc(0, "* They're all too long^1, see^1! Just get one^1, and I'll give it to ya./%", "obj_dw_church_arena_slash_Step_0_gml_290_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk("l", 4, 18);
    c_delaycmd(19, "halt");
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Alright^1, I'll start with your beard.../%", "obj_dw_church_arena_slash_Step_0_gml_300_0");
    c_talk_wait();
    c_wait(30);
    c_mus2("volume", 0, 30);
    c_var_instance(id, "susie_attack_timer", 0);
    c_var_instance(id, "susie_attack_fx", true);
    c_wait(10);
    c_var_instance(gerson_npc, "current_state", 0);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_head_tilt_forward);
    c_wait(4);
    c_wait(30);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_walk_cane);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* H..^1. huh?/%", "obj_dw_church_arena_slash_Step_0_gml_326_0");
    c_talk_wait();
    c_var_instance(id, "susie_attack_timer", 0);
    c_wait(12);
    c_var_instance(gerson_npc, "current_state", 0);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_head_tilt_forward);
    c_wait(24);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_walk_cane);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* STAY STILL!!!/%", "obj_dw_church_arena_slash_Step_0_gml_342_0");
    c_talk_wait();
    c_var_instance(id, "susie_attack_timer", 0);
    c_wait(12);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_duck);
    c_var_lerp_to_instance(gerson_npc, "x", 921, 12, 3, "out");
    c_wait(8);
    c_var_instance(id, "susie_attack_timer", 0);
    c_wait(8);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_genki);
    c_var_lerp_to_instance(gerson_npc, "x", 881, 12, 3, "out");
    c_wait(8);
    c_var_instance(id, "susie_attack_timer", 0);
    c_wait(8);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_head_tilt_forward);
    c_var_lerp_to_instance(gerson_npc, "x", 901, 12, 3, "out");
    c_wait(24);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_walk_cane);
    c_var_instance(id, "susie_attack_fx", false);
    c_wait(30);
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_idle);
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* ..^1. Heheheh..^1.  I get it./", "obj_dw_church_arena_slash_Step_0_gml_390_0");
    c_msgnextloc("\\E2* You think I'm gonna go easy on you^1, huh?/%", "obj_dw_church_arena_slash_Step_0_gml_391_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autodepth(0);
    c_depth(95000);
    c_sprite(spr_susieb_attackready);
    c_shakeobj();
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait_talk();
    c_wait(15);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_idle);
    c_halt();
    c_wait(5);
    c_var_instance(gerson_npc, "current_state", -1);
    c_var_instance(gerson_npc, "anim_speed", 0.2);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_cane_spin);
    c_sound_play_x(snd_laz_c, 1, 0.9);
    c_sprite(spr_susieb_attack);
    c_var_lerp_to("image_index", 5, 6);
    c_var_lerp_to("x", 840, 6);
    c_wait(3);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_cane_spin_loop);
    c_wait(3);
    c_var_instance(gerson_npc, "visible", 0);
    c_wait(1);
    c_shakeobj();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_idle_surprise);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* What the.../", "obj_dw_church_arena_slash_Step_0_gml_437_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Ah^1, so you wanna get serious^1, do ya...?/", "obj_dw_church_arena_slash_Step_0_gml_439_0");
    c_msgnextloc("* Then tell me first^1, can you hear it?/", "obj_dw_church_arena_slash_Step_0_gml_440_0");
    c_msgnextloc("* Can you hear its song^1, singing from the deep...?/", "obj_dw_church_arena_slash_Step_0_gml_441_0");
    c_msgnextloc("* That..^1. is the ringing.../%", "obj_dw_church_arena_slash_Step_0_gml_442_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_idle);
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_idle_surprise);
    c_waitcustom();
}
if (con == 5 && customcon == 1 && !d_ex())
{
    con = 9;
    alarm[0] = 12;
    snd_play_x(motor_upper_quick_mid, 0.7, 0.7);
    var _inst = instance_create_depth(camerax() + (view_wport[0] / 2) + 50, cameray() + 140, su_actor.depth + 1, obj_gerson_swing_down_new);
}
if (scr_debug() && con == 8)
{
    con = -1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    gerson_npc = instance_create(camerax() - 100, cameray() - 100, obj_npc_gerson);
    gerson_npc.depth = 96000;
    gerson_npc.visible = 0;
    c_pannable(1);
    c_pan(520, cameray(), 1);
    if (global.tempflag[90] == 1)
    {
        con = 9;
        alarm[0] = 30;
        c_var_instance(gerson_npc, "current_state", -1);
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susieb_attack);
        c_imageindex(5);
        c_setxy(840, 200);
    }
    else if (global.tempflag[90] < 5)
    {
        con = 19;
        alarm[0] = 30;
        if (i_ex(whiteall))
            whiteall.image_alpha = 1;
        c_var_instance(gerson_npc, "current_state", -1);
        with (gerson_npc)
            visible = 1;
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susie_walk_right_dw);
        c_setxy(840, 180);
    }
    else if (global.tempflag[90] == 5)
    {
        con = 29;
        alarm[0] = 30;
        scr_flag_set(851, 2);
        scr_flag_set(852, 1);
        with (gerson_npc)
            visible = 1;
        if (i_ex(whiteall))
            whiteall.image_alpha = 1;
        su_actor.sprite_index = spr_susie_walk_right_dw;
    }
    c_waitcustom();
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 11;
    customcon = 0;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_defend);
    c_halt();
    c_var_lerp_to("image_index", 4, 12);
    c_lerp_var_instance(su_actor, "x", su_actor.x, su_actor.x - 120, 12, 3, "out");
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_idle);
    c_wait(30);
    c_var_instance(gerson_npc, "facing_right", false);
    c_var_instance(gerson_npc, "x", 980);
    c_var_instance(gerson_npc, "y", 161);
    c_var_instance(gerson_npc, "visible", 1);
    c_var_instance(gerson_npc, "current_state", 19);
    c_wait(30);
    c_msgside("bottom");
    c_speaker("gerson");
    c_msgsetloc(0, "* ..^1. of the Hammer of Justice!/%", "obj_dw_church_arena_slash_Step_0_gml_568_0");
    c_talk_wait();
    c_wait(4);
    c_var_instance(gerson_npc, "current_state", 11);
    c_snd_play(snd_jump);
    c_sel(su);
    c_sprite(spr_susie_jump_back);
    c_jump(623, 149, 16, 16);
    c_wait(16);
    c_sprite(spr_susie_idle);
    c_shakeobj();
    c_wait(20);
    c_waitcustom();
}
if (con == 11 && !d_ex() && customcon == 1)
{
    con = 12;
    alarm[0] = 30;
    scr_flag_set(851, 2);
    if (scr_flag_get(1629) == 0)
        scr_flag_set(1629, 1);
    var sus_x = su_actor.x;
    var sus_y = su_actor.y;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            x = sus_x;
            y = sus_y;
            cutscene = 1;
            fun = 1;
        }
    }
    global.char[0] = 2;
    global.char[1] = 0;
    global.char[2] = 0;
    snd_free_all();
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("ch4_extra_boss.ogg");
    gerson_marker = scr_dark_marker(gerson_npc.x, gerson_npc.y, gerson_npc.current_sprite_index);
    gerson_marker.image_index = gerson_npc.anim_index;
    gerson_marker.image_speed = gerson_npc.anim_speed;
    encounterflag = 160;
    global.flag[54] = encounterflag;
    bg_stage_one = scr_marker(520, 0, bg_dw_gerson_arena_dark);
    bg_stage_one.image_alpha = 0;
    bg_stage_one.depth = 600;
    black_underlay = scr_marker(0, 0, spr_pixel_white);
    black_underlay.image_xscale = room_width;
    black_underlay.image_yscale = room_height;
    black_underlay.depth = 850000;
    black_underlay.image_alpha = 0;
    black_underlay.image_blend = c_black;
    var d = anvil_npc.depth;
    anvil_npc.depth = 0;
    with (anvil_npc)
        scr_delay_var("depth", d, 15);
    scr_lerp_instance_var(anvil_npc, "image_alpha", 1, 0, 15, 2, "out");
    if (i_ex(axe_marker))
        scr_lerp_instance_var(axe_marker, "image_alpha", 1, 0, 15, 2, "out");
    scr_battle(160, 1, gerson_marker, 0, 0);
    with (obj_doom)
        alarm[0] += obj_encounterbasic.battlestartdelay;
    with (obj_battleback)
        instance_destroy();
    background = instance_create(520, 0, obj_dw_church_arena_bg);
    if (scr_flag_get(853) > 0)
        background.delay = 50;
    
    var _flash_step_two = function()
    {
        flash_sprite = scr_marker(0, 0, spr_pixel_white);
        flash_sprite.image_xscale = room_width;
        flash_sprite.image_yscale = room_height;
        flash_sprite.image_blend = #FFCEB2;
        flash_sprite.image_alpha = 0;
        flash_sprite.depth = -999;
        with (background)
        {
            scr_var_delay("con", 0, 4);
            scr_var_delay("image_alpha", 1, 4);
        }
        scr_lerp_instance_var(flash_sprite, "image_alpha", 0, 1, 4);
    };
    
    var _flash_step_three = function()
    {
        scr_lerp_instance_var(flash_sprite, "image_alpha", 1, 0, 25);
        with (bg_stage_one)
            instance_destroy();
    };
    
    if (scr_flag_get(853) > 0)
    {
        var _flash_step_two_ts = call_later(44, 1, _flash_step_two, false);
        var _flash_step_three_ts = call_later(48, 1, _flash_step_three, false);
        background.con = -1;
    }
    global.flag[9] = 1;
    with (obj_actor)
    {
        if (scr_flag_get(853) == 0 || name == "susie")
        {
            visible = 0;
        }
        else
        {
            scr_lerpvar("image_alpha", 1, 0, 16);
            scr_delay_var("visible", 0, 16);
            scr_delay_var("image_alpha", 1, 44);
        }
    }
    with (gerson_npc)
        visible = 0;
}
if (con == 13 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        con = 14;
        alarm[0] = 30;
        snd_volume(global.batmusic[1], 0, 25);
    }
}
if (con == 15)
{
    con = 16;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    with (obj_darkcontroller)
    {
        chartotal = 0;
        havechar[0] = 0;
        havechar[1] = 0;
        havechar[2] = 0;
        havechar[3] = 0;
        global.faceaction[0] = 0;
        global.faceaction[1] = 0;
        global.faceaction[2] = 0;
    }
    global.char[0] = 0;
    global.char[1] = 0;
    global.char[2] = 0;
    scr_getchar("kris");
    scr_getchar("ralsei");
    scr_getchar("susie");
    su_actor.sprite_index = spr_susie_walk_right_dw;
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
    with (obj_actor)
        visible = 1;
    with (gerson_npc)
        visible = 1;
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
    if (i_ex(whiteall))
        whiteall.image_alpha = 1;
    with (black_underlay)
        instance_destroy();
    anvil_npc.image_alpha = 1;
    if (i_ex(axe_marker))
        axe_marker.image_alpha = 1;
    var lay_id = layer_get_id("TILES");
    layer_set_visible(lay_id, true);
    lay_id = layer_get_id("ASSETS_BG");
    layer_set_visible(lay_id, true);
    with (obj_gerson_windowbg)
        instance_destroy();
    anvil_npc.visible = 1;
    if (scr_flag_get(36) > 0)
    {
        con = 20;
        scr_flag_set(853, scr_flag_get(853) + 1);
    }
    else
    {
        con = 30;
        scr_flag_set(852, 1);
        var iniwrite = ossafe_ini_open("dr.ini");
        ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "UraBoss", 1);
        ossafe_ini_close();
        ossafe_savedata_save();
    }
}
if (con == 20 && customcon == 1 && !i_ex(obj_battlecontroller))
{
    con = 21;
    customcon = 0;
    alarm[0] = 30;
    global.fighting = 0;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_setxy(790, 197);
    if (scr_flag_get(853) < 2)
    {
        c_sel(kr);
        c_setxy(470, 251);
        c_facing("r");
        c_sel(ra);
        c_setxy(380, 238);
        c_facing("r");
    }
    else
    {
        c_sel(kr);
        c_setxy(737, 214);
        c_facing("r");
        c_sel(ra);
        c_setxy(682, 202);
        c_facing("r");
    }
    c_var_instance(gerson_npc, "facing_right", false);
    c_var_instance(gerson_npc, "current_state", 9);
    c_var_instance(gerson_npc, "x", 840);
    c_var_instance(gerson_npc, "y", 210);
    c_wait(30);
    with (background)
        disappear();
    if (i_ex(whiteall))
        c_var_lerp_to_instance(whiteall, "image_alpha", 0, 60);
    c_wait(90);
    if (scr_flag_get(853) == 1)
    {
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_speaker("susie");
        c_msgsetloc(0, "\\EV* ..^1. damn..^1. I..^1. couldn't keep up.../", "obj_dw_church_arena_slash_Step_0_gml_869_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Geheheh..^1. well^1, you gave it your best shot!/%", "obj_dw_church_arena_slash_Step_0_gml_871_0");
        c_talk();
        c_wait_box(2);
        c_var_instance(gerson_npc, "current_state", 6);
        c_wait_talk();
        c_var_instance(gerson_npc, "current_state", 9);
        c_var_instance(gerson_npc, "facing_up", true);
        c_var_instance(gerson_npc, "facing_right", true);
        c_wait(4);
        c_var_instance(gerson_npc, "current_state", 1);
        c_var_lerp_to_instance(gerson_npc, "y", 190, 20);
        c_wait(21);
        c_var_instance(gerson_npc, "current_state", 9);
        c_sel(su);
        c_facing("u");
        c_speaker("gerson");
        c_msgsetloc(0, "* Here./", "obj_dw_church_arena_slash_Step_0_gml_897_0");
        c_facenext("susie", "6");
        c_msgnextloc("\\E6* ..^1. huh?/%", "obj_dw_church_arena_slash_Step_0_gml_899_0");
        c_talk_wait();
        c_sel(su);
        c_autowalk(1);
        c_walkdirect_wait(790, 178, 16);
        c_facing("u");
        c_speaker("gerson");
        c_msgsetloc(0, "* I saw the fire in your eyes..^1. that's proof enough for me./", "obj_dw_church_arena_slash_Step_0_gml_909_0");
        c_msgnextloc("* Take it. And this crystal^1, too./%", "obj_dw_church_arena_slash_Step_0_gml_910_0");
        c_talk_wait();
        c_sel(su);
        c_emote("...", 30);
        c_wait(30);
        c_sprite(spr_susie_hand_hips);
        c_flip("x");
        c_addxy(0, -4);
        c_speaker("susie");
        c_msgsetloc(0, "\\EV* .../", "obj_dw_church_arena_slash_Step_0_gml_923_0");
        c_msgnextloc("\\EL* Nah. Keep it./", "obj_dw_church_arena_slash_Step_0_gml_924_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* ..^1. you don't want it?/", "obj_dw_church_arena_slash_Step_0_gml_926_0");
        c_facenext("susie", "V");
        c_msgnextloc("\\EV* Of course I do. But.../", "obj_dw_church_arena_slash_Step_0_gml_928_0");
        c_msgnextloc("\\EW* You're gonna need something to give me.../", "obj_dw_church_arena_slash_Step_0_gml_929_0");
        c_msgnextloc("\\EY* ..^1. after our rematch!/", "obj_dw_church_arena_slash_Step_0_gml_930_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* ..^1. Wahahahaha!!!/", "obj_dw_church_arena_slash_Step_0_gml_932_0");
        c_msgnextloc("* You've got guts^1, kid^1! I like that!/%", "obj_dw_church_arena_slash_Step_0_gml_933_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_sprite(spr_susie_hand_up);
        c_addxy(0, -2);
        c_wait_box(3);
        c_sel(su);
        c_facing("r");
        c_flip("x");
        c_addxy(0, 6);
        c_var_instance(gerson_npc, "facing_up", false);
        c_var_instance(gerson_npc, "facing_right", false);
        c_wait_box(5);
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_wait_box(6);
        c_sel(su);
        c_facing("r");
        c_wait_box(7);
        c_sel(su);
        c_sprite(spr_susie_pose);
        c_shakeobj();
        c_wait_box(9);
        c_sel(su);
        c_facing("r");
        c_snd_play(snd_gerlaugh);
        c_var_instance(gerson_npc, "current_state", 5);
        c_wait_box(10);
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_talk();
    }
    else if (scr_flag_get(853) == 2)
    {
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_speaker("susie");
        c_msgsetloc(0, "\\EV* D..^1. damnit!/", "obj_dw_church_arena_slash_Step_0_gml_980_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* You aren't giving up^1, are ya?/", "obj_dw_church_arena_slash_Step_0_gml_982_0");
        c_facenext("susie", "Q");
        c_msgnextloc("\\EQ* Hell no^1! Kris^1, let's try again!/%", "obj_dw_church_arena_slash_Step_0_gml_984_0");
        c_talk();
        c_wait_box(2);
        c_var_instance(gerson_npc, "current_state", 2);
        c_wait_box(4);
        c_sel(su);
        c_facing("l");
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_talk();
    }
    else
    {
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_var_instance(gerson_npc, "current_state", 6);
        c_speaker("gerson");
        c_msgsetloc(0, "* It's all right^1, it's all right./", "obj_dw_church_arena_slash_Step_0_gml_1005_0");
        c_msgnextloc("* How 'bout you give it another shot?/%", "obj_dw_church_arena_slash_Step_0_gml_1006_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_facing("r");
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_talk();
    }
    c_waitcustom();
}
if (con == 22 && customcon == 1 && !d_ex())
{
    con = 50;
    customcon = 0;
    c_wait(16);
    c_waitcustom_end();
    if (scr_flag_get(853) < 2)
    {
        c_mus2("volume", 0, 60);
        c_pannable(1);
        c_panobj(kr_actor, 60);
        c_sel(su);
        c_autowalk(1);
        c_walkdirect_wait(660, 232, 30);
        c_walkdirect_wait(546, 232, 30);
        c_facing("l");
        c_sel(su);
        c_walkdirect_wait(416, 234, 20);
        c_facing("r");
    }
    else
    {
        c_mus2("volume", 0, 20);
        c_pannable(1);
        c_panobj(kr_actor, 20);
        c_sel(su);
        c_facing("l");
        c_wait(21);
    }
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 25 && !d_ex() && global.interact == 0)
{
    global.interact = 1;
    con = 11;
    customcon = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_pan(520, cameray(), 15);
    c_wait(16);
    c_waitcustom();
}
if (con == 30 && customcon == 1 && !i_ex(obj_battlecontroller))
{
    with (obj_fadeout)
        instance_destroy();
    with (background)
        disappear();
    con = 50;
    customcon = 0;
    if (!scr_keyitemcheck(13))
        scr_keyitemget(13);
    scr_get_shadow_crystal(global.chapter);
    scr_itemget_anytype(52, "weapon");
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_hold_hair);
    c_setxy(750, 197);
    c_sel(kr);
    c_setxy(470, 251);
    c_facing("r");
    c_sel(ra);
    c_setxy(380, 238);
    c_facing("r");
    c_var_instance(gerson_npc, "facing_right", false);
    c_var_instance(gerson_npc, "current_state", 0);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_shocked);
    c_var_instance(gerson_npc, "x", 840);
    c_var_instance(gerson_npc, "y", 210);
    c_wait(30);
    if (i_ex(whiteall))
        c_var_lerp_to_instance(whiteall, "image_alpha", 0, 60);
    c_wait(60);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* H..^1. How's that^1, old man!?/%", "obj_dw_church_arena_slash_Step_0_gml_1131_0");
    c_talk_wait();
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait(60);
    c_mus2("initloop", "gerson_defeated.ogg", 0);
    c_speaker("gerson");
    c_msgsetloc(0, "* Wahahahahaha!^1! That was the most fun I ever had!/", "obj_dw_church_arena_slash_Step_0_gml_1142_0");
    c_facenext("susie", "9");
    c_msgnextloc("\\E9* See how I used my healing just now!?/", "obj_dw_church_arena_slash_Step_0_gml_1144_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Geheheheh!/%", "obj_dw_church_arena_slash_Step_0_gml_1146_0");
    c_talk();
    c_wait_box(2);
    c_var_instance(gerson_npc, "current_state", 9);
    c_sel(su);
    c_facing("r");
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(790, 197, 8);
    c_var_instance(gerson_npc, "facing_up", true);
    c_var_instance(gerson_npc, "facing_right", true);
    c_sel(su);
    c_walkdirect_wait(790, 178, 8);
    c_facing("u");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Guess this is mine now^1, huh./%", "obj_dw_church_arena_slash_Step_0_gml_1173_0");
    c_talk_wait();
    c_wait(5);
    c_snd_play(snd_noise);
    c_sel(su);
    c_sprite(spr_susie_up_reach);
    c_wait(6);
    if (noroom == 0)
    {
        global.flag[1688] = 1;
        c_var_instance(axe_marker, "visible", 0);
        c_facing("u");
    }
    c_sound_play(snd_item);
    c_speaker("no_name");
    c_msgsetloc(0, "* (JusticeAxe was added to your WEAPONS.)/%", "obj_dw_church_arena_slash_Step_0_gml_1193_0");
    c_talk_wait();
    if (noroom == 1)
    {
        global.flag[1688] = 2;
        c_wait(30);
        c_speaker("no_name");
        c_msgsetloc(0, "* (..^1. but^1, there wasn't enough room.)/", "obj_dw_church_arena_slash_Step_0_gml_1202_0");
        c_facenext("susie", 17);
        c_msgnextloc("\\EH* Dammit Kris^1, the hell did you get so much stupid stuff?!/", "obj_dw_church_arena_slash_Step_0_gml_1204_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Geh ha ha ha^1! Well^1, that Axe ain't going anywhere.../", "obj_dw_church_arena_slash_Step_0_gml_1206_0");
        c_msgnextloc("* ..^1. So just pick it up later!/%", "obj_dw_church_arena_slash_Step_0_gml_1207_0");
        c_talk();
        c_wait_box(2);
        c_sel(su);
        c_autodepth(0);
        c_depth(96100);
        c_customfunc(function()
        {
            with (obj_actor)
            {
                if (name == "susie")
                {
                    sprite_index = spr_susie_turn_around_dw;
                    image_xscale = -2;
                    setxy(844, 186);
                }
            }
        });
        c_snd_play(snd_whip_crack_only);
        c_customfunc(function()
        {
            with (obj_actor)
            {
                if (name == "susie")
                    scr_shakeobj();
            }
        });
        c_wait_box(4);
        c_sel(su);
        c_depth(95000);
        c_customfunc(function()
        {
            with (obj_shakeobj)
            {
                target = -4;
                show_debug_message_concat("goodbye world");
            }
            with (obj_actor)
            {
                if (name == "susie")
                {
                    sprite_index = spr_susie_walk_right_dw_unhappy;
                    image_xscale = 2;
                    setxy(790, 178);
                }
            }
        });
        c_var_instance(gerson_npc, "facing_right", false);
        c_var_instance(gerson_npc, "current_state", 5);
        c_wait_box(5);
        c_sel(su);
        c_facing("u");
        c_var_instance(gerson_npc, "facing_right", true);
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_talk();
    }
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "y", 190, 20);
    c_wait(21);
    c_var_instance(gerson_npc, "current_state", 9);
    c_speaker("gerson");
    c_msgsetloc(0, "* And..^1. take this^1, too./", "obj_dw_church_arena_slash_Step_0_gml_1245_0");
    c_msgnextloc("* For some reason^1, I found this weird piece-a glass in my desk./", "obj_dw_church_arena_slash_Step_0_gml_1246_0");
    c_msgnextloc("* Felt like someone really wanted me to use this thing./", "obj_dw_church_arena_slash_Step_0_gml_1247_0");
    c_msgnextloc("* But it didn't interest me^1, so you can take it./", "obj_dw_church_arena_slash_Step_0_gml_1248_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* (ShadowCrystal was added to your KEY ITEMS.)/%", "obj_dw_church_arena_slash_Step_0_gml_1250_0");
    c_talk();
    c_wait_box(4);
    c_sound_play(snd_item);
    c_wait_talk();
    c_wait(15);
    if (scr_flag_get(853) == 0)
    {
        c_var_instance(gerson_npc, "facing_up", false);
        c_var_instance(gerson_npc, "facing_right", false);
        c_sel(su);
        c_facing("r");
        c_speaker("gerson");
        c_msgsetloc(0, "* The truth is^1, I was gonna give you it all if you beat me or not./", "obj_dw_church_arena_slash_Step_0_gml_1270_0");
        c_msgnextloc("* But woomph^1, you actually put up quite a fight!/%", "obj_dw_church_arena_slash_Step_0_gml_1271_0");
        c_talk();
        c_wait_box(1);
        c_var_instance(gerson_npc, "current_state", 20);
        c_wait_talk();
        c_wait_if(gerson_npc, "state_loaded", "=", true);
        c_wait(5);
        c_snd_play(snd_gerlaugh);
        c_var_instance(gerson_npc, "current_state", 5);
        c_wait(60);
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susie_head_scratch_dw);
        c_imagespeed(0.2);
        c_addxy(0, -6);
        c_var_instance(gerson_npc, "current_state", 9);
        c_speaker("susie");
        c_msgsetloc(0, "\\EL* Well^1, maybe you're losing your touch./", "obj_dw_church_arena_slash_Step_0_gml_1296_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Oh^1, far from it!/", "obj_dw_church_arena_slash_Step_0_gml_1298_0");
        c_msgnextloc("* ..^1. You weren't truly fighting by yourself^1, were ya?/", "obj_dw_church_arena_slash_Step_0_gml_1299_0");
        c_facenext("susie", "K");
        c_msgnextloc("\\EK* ..^1. huh?/", "obj_dw_church_arena_slash_Step_0_gml_1301_0");
        c_msgnextloc("\\E6* ..^1. oh^1, you mean Kris. Yeah./", "obj_dw_church_arena_slash_Step_0_gml_1302_0");
        c_msgnextloc("\\EK* Guess I kinda needed their help to win./", "obj_dw_church_arena_slash_Step_0_gml_1303_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Well^1, don't sell your own skills short either./", "obj_dw_church_arena_slash_Step_0_gml_1305_0");
        c_msgnextloc("* You're something real special yourself.../", "obj_dw_church_arena_slash_Step_0_gml_1306_0");
        c_facenext("susie", "9");
        c_msgnextloc("\\E9* Heh. You weren't bad either./", "obj_dw_church_arena_slash_Step_0_gml_1308_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Now go enjoy that Axe^1! Geh heh heh!/", "obj_dw_church_arena_slash_Step_0_gml_1310_0");
        c_facenext("susie", "2");
        c_msgnextloc("\\E2* Alright. Heh./%", "obj_dw_church_arena_slash_Step_0_gml_1312_0");
        c_talk();
        c_wait_box(2);
        c_sel(su);
        c_halt();
        c_var_instance(gerson_npc, "current_state", 5);
        c_wait_box(3);
        c_var_instance(gerson_npc, "current_state", 2);
        c_wait_box(5);
        c_sel(su);
        c_facing("susieunhappy");
        c_facing("r");
        c_addxy(0, 6);
        c_var_instance(gerson_npc, "anim_speed", 0);
        c_wait_box(6);
        c_sel(su);
        c_facing("susieunhappy");
        c_facing("r");
        c_wait_box(7);
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_wait_box(9);
        c_var_instance(gerson_npc, "current_state", 12);
        c_wait_box(10);
        c_sel(su);
        c_facing("susiedarkeyes");
        c_facing("r");
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_box(12);
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susie_head_scratch_dw);
        c_imagespeed(0.2);
        c_addxy(0, -6);
        c_wait_box(14);
        c_var_instance(gerson_npc, "current_state", 20);
        c_sel(su);
        c_facing("susiedarkeyes");
        c_facing("r");
        c_addxy(0, 6);
        c_halt();
        c_wait_box(16);
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_talk();
    }
    else
    {
        c_var_instance(gerson_npc, "facing_up", false);
        c_var_instance(gerson_npc, "facing_right", false);
        c_sel(su);
        c_sprite(spr_susie_pose);
        c_shakeobj();
        if (scr_flag_get(853) < 5)
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E9* Knew it was worth having a rematch!/%", "obj_dw_church_arena_slash_Step_0_gml_1387_0");
            c_talk_wait();
        }
        else
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E9* FINALLY!!/", "obj_dw_church_arena_slash_Step_0_gml_1392_0");
            c_msgnextloc("\\E2* Was starting to wonder if I'd ever win.../%", "obj_dw_church_arena_slash_Step_0_gml_1393_0");
            c_talk_wait();
        }
        c_sel(su);
        c_facing("r");
        c_var_instance(gerson_npc, "current_state", 6);
        c_speaker("gerson");
        c_msgsetloc(0, "* Perseverance. Each time^1, you get a little better./", "obj_dw_church_arena_slash_Step_0_gml_1403_0");
        c_msgnextloc("* ..^1. that's all I wanted to see./", "obj_dw_church_arena_slash_Step_0_gml_1404_0");
        c_msgnextloc("* Can't think I'm gonna be the toughest thing you'll face./", "obj_dw_church_arena_slash_Step_0_gml_1405_0");
        c_msgnextloc("* But next time^1, you'll be ready./", "obj_dw_church_arena_slash_Step_0_gml_1406_0");
        c_msgnextloc("* Don't give up^1, and give 'em hell!/", "obj_dw_church_arena_slash_Step_0_gml_1407_0");
        c_facenext("susie", "9");
        c_msgnextloc("\\E9* Don't have to tell me that^1, old man!!/%", "obj_dw_church_arena_slash_Step_0_gml_1409_0");
        c_talk();
        c_wait_box(1);
        c_wait_if(gerson_npc, "state_loaded", "=", true);
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_box(2);
        c_wait_if(gerson_npc, "state_loaded", "=", true);
        c_var_instance(gerson_npc, "current_state", 2);
        c_wait_box(3);
        c_wait_if(gerson_npc, "state_loaded", "=", true);
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_box(4);
        c_wait_if(gerson_npc, "state_loaded", "=", true);
        c_var_instance(gerson_npc, "current_state", 20);
        c_wait_box(6);
        c_wait_if(gerson_npc, "state_loaded", "=", true);
        c_var_instance(gerson_npc, "current_state", 9);
        c_wait_talk();
    }
    c_mus2("volume", 0, 60);
    c_pannable(1);
    c_panobj(kr_actor, 60);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(660, 232, 30);
    c_walkdirect_wait(546, 232, 30);
    c_facing("l");
    c_sel(su);
    c_walkdirect_wait(416, 234, 20);
    c_facing("r");
    c_var_instance(gerson_npc, "facing_up", true);
    c_var_instance(gerson_npc, "facing_right", true);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 50 && !i_ex(obj_cutscene_master))
{
    con = (scr_flag_get(851) == 2) ? 60 : 99;
    if (scr_flag_get(36) > 0)
        con = 99;
    snd_free_all();
    global.interact = 0;
    global.facing = 0;
    with (gerson_npc)
    {
        current_state = 9;
        scr_depth();
    }
    if (scr_debug())
        global.tempflag[90] = 0;
}
if (con == 60 && obj_mainchara.x < 360 && obj_mainchara.y >= 240 && global.interact == 0 && !d_ex())
{
    con = 61;
    alarm[0] = 30;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_var_instance(gerson_npc, "facing_up", false);
    c_var_instance(gerson_npc, "facing_right", false);
    c_msgside("top");
    c_speaker("gerson");
    c_msgsetloc(0, "* Well^1, I'll be seeing you around now./%", "obj_dw_church_arena_slash_Step_0_gml_1519_0");
    c_talk_wait();
    c_var_instance(gerson_npc, "x", 680);
    c_var_instance(gerson_npc, "y", 250);
    c_var_instance(gerson_npc, "depth", 95000);
    var kr_x_pos = 346;
    var kr_y_pos = 251;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, 4);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "r");
    var su_x_pos = 520;
    var su_y_pos = 235;
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, 4);
    c_sel(su);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "r");
    var ra_x_pos = 440;
    var ra_y_pos = 239;
    var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, 4);
    c_sel(ra);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "r");
    c_pannable(1);
    c_pan(220, cameray(), 60);
    c_wait(61);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. yeah. I guess we will./%", "obj_dw_church_arena_slash_Step_0_gml_1564_0");
    c_talk_wait();
    c_wait(5);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait(30);
    c_sel(su);
    c_walkdirect_wait(583, 234, 30);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* Why'd you..^1. help me so much?/", "obj_dw_church_arena_slash_Step_0_gml_1580_0");
    c_msgnextloc("\\ED* You didn't have to./", "obj_dw_church_arena_slash_Step_0_gml_1581_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* You remind me a bit of someone I used to know./", "obj_dw_church_arena_slash_Step_0_gml_1583_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* ..^1. Who?/", "obj_dw_church_arena_slash_Step_0_gml_1585_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Just a character from that old story.../", "obj_dw_church_arena_slash_Step_0_gml_1587_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* ..^1. Lord of the Hammer^1, huh. Hell if I'm reading that./", "obj_dw_church_arena_slash_Step_0_gml_1589_0");
    c_msgnextloc("\\E0* ..^1. though^1, wait a sec./", "obj_dw_church_arena_slash_Step_0_gml_1590_0");
    c_msgnextloc("\\E1* Isn't that..^1. what Dragon Blazers was based on?/", "obj_dw_church_arena_slash_Step_0_gml_1591_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Yep^1, yep. And so they changed parts of the story./", "obj_dw_church_arena_slash_Step_0_gml_1593_0");
    c_msgnextloc("* Of course^1, the biggest fans got mad..^1. but^1, isn't it interesting?/", "obj_dw_church_arena_slash_Step_0_gml_1594_0");
    c_msgnextloc("* The book was already just an interpretation of something else./", "obj_dw_church_arena_slash_Step_0_gml_1595_0");
    c_msgnextloc("* Stories can be retold. They can be changed..^1. That's what I believe./", "obj_dw_church_arena_slash_Step_0_gml_1596_0");
    c_facenext("susie", "0");
    c_msgnextloc("\\E0* ..^1. huh./", "obj_dw_church_arena_slash_Step_0_gml_1598_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* The words on a wall called you a hero./", "obj_dw_church_arena_slash_Step_0_gml_1600_0");
    c_msgnextloc("* ..^1. Whatever you end up being^1, I'm sure it'll be tremendous./%", "obj_dw_church_arena_slash_Step_0_gml_1601_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_surprised_step_back);
    c_halt();
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait_box(5);
    c_sel(su);
    c_facing("r");
    c_walk("r", 2, 4);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait_box(7);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 6);
    c_wait_box(9);
    c_sel(su);
    c_facing("r");
    c_wait_box(10);
    c_sel(su);
    c_sprite(spr_susie_surprised_step_back);
    c_halt();
    c_wait_box(11);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch_dw);
    c_imagespeed(0.2);
    c_addxy(0, -6);
    c_wait_box(13);
    c_sel(su);
    c_facing("r");
    c_addxy(0, 6);
    c_halt();
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait_box(14);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 6);
    c_wait_box(15);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait_box(16);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 2);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait_box(18);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait_box(20);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait_box(21);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 6);
    c_wait_talk();
    c_wait_if(gerson_npc, "state_loaded", "=", true);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../", "obj_dw_church_arena_slash_Step_0_gml_1700_0");
    c_msgnextloc("\\E7* ..^1. anyway^1, which Dragon Blazers character am I?/%", "obj_dw_church_arena_slash_Step_0_gml_1701_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(1);
    c_sprite(spr_susie_walk_right_dw);
    c_wait_talk();
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_wait(60);
    c_speaker("gerson");
    c_msgsetloc(0, "* Gahahaha^1, right!/%", "obj_dw_church_arena_slash_Step_0_gml_1717_0");
    c_talk_wait();
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "y", 270, 20);
    c_wait(20);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait(8);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 284, 120);
    c_wait(30);
    c_sel(su);
    c_facing("d");
    c_delayfacing(10, "l");
    c_sel(ra);
    c_delayfacing(40, "d");
    c_delayfacing(50, "l");
    c_sel(kr);
    c_delayfacing(60, "d");
    c_delayfacing(70, "l");
    c_wait(90);
    c_var_instance(gerson_npc, "current_state", 9);
    c_var_instance(gerson_npc, "facing_right", true);
    c_wait(30);
    c_speaker("gerson");
    c_msgsetloc(0, "* You are..^1. the Dragon./%", "obj_dw_church_arena_slash_Step_0_gml_1752_0");
    c_talk_wait();
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "y", 500, 90);
    c_wait(30);
    c_panobj(kr_actor, 60);
    c_sel(su);
    c_walkdirect_wait(385, 236, 60);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Heheh. That's what I was hoping./%", "obj_dw_church_arena_slash_Step_0_gml_1774_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("d");
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 62 && !i_ex(obj_cutscene_master))
{
    con = -1;
    scr_flag_set(851, 3);
    with (gerson_npc)
        scr_depth();
    if (scr_debug())
        global.tempflag[90] = 0;
    global.interact = 0;
    global.facing = 0;
    disable_anvil();
    scr_tempsave();
}
if (susie_attack_fx)
{
    susie_attack_timer++;
    if (susie_attack_timer == 1)
    {
        snd_play_x(snd_laz_c, 1, 0.9);
        with (su_actor)
        {
            sprite_index = spr_susieb_attack;
            scr_animate(0, 5, 0.5);
        }
    }
    if (susie_attack_timer == 12)
    {
        attack = instance_create(gerson_npc.x + 60 + random(6), (gerson_npc.y - 10) + random(6), obj_basicattack);
        attack.sprite_index = spr_attack_mash2;
        attack.image_speed = 0.5;
        attack.maxindex = 4;
    }
    if (susie_attack_timer == 16)
        miss_fx = true;
}
if (miss_fx)
{
    miss_fx = false;
    miss_counter++;
    var offset = (miss_counter > 3) ? (miss_counter - 3) : 0;
    miss_fx_offset = -10 + (-18 * offset);
    var healamt = instance_create(gerson_npc.x, gerson_npc.y + miss_fx_offset, obj_dmgwriter);
    with (healamt)
    {
        delay = 4;
        type = 1;
        specialmessage = 3;
    }
    healamt.damage = 0;
}
if (slow_writer && i_ex(obj_writer))
{
    with (obj_writer)
    {
        rate = 6;
        skippable = 0;
    }
}
if (axe_hover)
{
    axe_timer++;
    axe_marker.y -= sin(axe_timer / 8) / 2;
    if ((axe_timer % 4) == 0)
    {
        var shine = instance_create(axe_marker.x + 16 + irandom_range(-20, 30), axe_marker.y + 10, obj_afterimage);
        shine.image_speed = 0.25;
        shine.image_alpha = 2;
        shine.sprite_index = spr_shine;
        shine.visible = true;
        shine.gravity = 0.25;
        shine.depth = axe_marker.depth - 10;
        shine.fadeSpeed = 0.08;
        scr_darksize(shine);
    }
}
