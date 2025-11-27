if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    global.interact = 1;
    scr_maincharacters_actors();
    c_mus2("initloop", "tinnitus.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 300);
    c_sel(kr);
    c_setxy(150, 190);
    c_autowalk(0);
    c_sprite(spr_dkris_ur);
    c_wait(30);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_sel(kr);
    c_shakestep(0, -8);
    c_wait(60);
    c_shakestep(0, -8);
    c_wait(60);
    c_shakestep(0, -8);
    c_wait(60);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 5);
    c_wait(15);
    c_setxy(185, 140);
    c_wait(15);
    c_sprite(spr_homealone_kris_throw_right);
    c_imagespeed(0);
    c_imageindex(7);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 5);
    c_wait(75);
    c_autodepth(0);
    c_depth(50000);
    c_sndplay_x(motor_swing_down, 0.8, 1);
    c_sndplay_x(motor_swing_down, 0.8, 1.5);
    c_imageindex(8);
    c_var_instance(id, "trash_hit_snd", 1);
    c_shakex(8, 0, 1);
    c_var_instance(id, "trash_hit", true);
    c_wait(6);
    c_imageindex(9);
    c_wait(6);
    c_imageindex(10);
    c_wait(6);
    c_imageindex(11);
    c_wait_if(id, "trash_hit_timer", ">=", 30);
    c_var_instance(id, "trash_hit", false);
    c_sel(kr);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 5);
    c_wait(15);
    c_sprite(spr_kris_kick_heavy);
    c_imageindex(1);
    c_setxy(184, 136);
    c_halt();
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 5);
    c_wait(5);
    c_var_instance(id, "kick_start", true);
    repeat (4)
    {
        c_wait(30);
        c_var_lerp_instance(blackall, "image_alpha", 0, 1, 5);
        c_wait(10);
        c_var_lerp_instance(blackall, "image_alpha", 1, 0, 5);
    }
    c_wait_if(id, "kick_start", "=", false);
    c_wait_if(id, "kick_loop", "=", false);
    c_wait(20);
    c_sound_play(snd_knock);
    c_mus("free_all");
    c_var_instance(id, "bloom_stop", true);
    c_speaker("asgore");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Kris?/", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_139_0");
    c_msgnextloc("* Kris^1, are you..^1. okay in there?/", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_140_0");
    c_msgnextloc("* .../", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_141_0");
    c_msgnextloc("* Umm^1, just thought I'd let you know.../", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_142_0");
    c_msgnextloc("* Mayor Carol is asking everyone to leave./", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_143_0");
    c_msgnextloc("* .../", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_144_0");
    c_msgnextloc("* ..^1. and^1, umm^1, I thought you looked a little down today.../", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_145_0");
    c_msgnextloc("* So^1, um^1, I made a special treat for you./", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_146_0");
    c_msgnextloc("* Your friend and I will be waiting for you outside with it./", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_147_0");
    c_msgnextloc("* ..^1. feel better^1, Kris./%", "obj_ch4_PDC14A_bathroom_slash_Step_0_gml_148_0");
    c_talk_wait();
    c_wait(60);
    c_sprite(spr_dkris_ur);
    c_halt();
    c_addxy(0, 4);
    c_wait(90);
    c_sound_play(snd_wing);
    c_sprite(spr_kris_remove_soul);
    c_flip("x");
    c_imageindex(39);
    c_addxy(-2, -4);
    c_shakeobj();
    c_wait(30);
    c_imageindex(38);
    c_wait(2);
    c_imageindex(37);
    c_wait(30);
    c_shake();
    c_imageindex(13);
    c_imagespeed(0.5);
    c_instance(210, 122, 1273);
    c_soundplay(snd_grab);
    c_soundplay(snd_hurt1);
    c_wait(14);
    c_imagespeed(0);
    c_wait(30);
    c_soundplay(snd_bump);
    c_shakeobj();
    c_wait(80);
    c_autowalk(1);
    c_facing("u");
    c_flip("x");
    c_setxy(203, 100);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk_wait("d", 1, 8);
    c_halt();
    c_wait(5);
    c_autowalk(1);
    c_facing("d");
    c_var_instance(trashcan, "depth", 99900);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.plot = 91;
    global.interact = 0;
    global.facing = 0;
    global.lhp = 10;
    kris_fall_x = obj_mainchara.x - 10;
    kris_fall_y = obj_mainchara.y;
    kris_move = true;
    var trash_collider = instance_create(trashcan.x - 15, trashcan.y, obj_solidblockLight);
    trash_collider.image_yscale = 0.5;
    trash_collider.image_xscale = 0.8;
}
if (kris_move)
{
    if (global.facing != 2 && (obj_mainchara.x < kris_fall_x || obj_mainchara.y != kris_fall_y))
    {
        kris_move_timer++;
        if (kris_move_timer >= 5)
        {
            global.interact = 1;
            kris_fall = true;
            kris_move = false;
        }
    }
}
if (kris_fall)
{
    kris_fall_timer++;
    if (kris_fall_timer == 1)
    {
        sound_play(snd_wing);
        with (obj_mainchara)
        {
            cutscene = 1;
            fun = 1;
            sprite_index = spr_kris_fall_side_b;
            image_speed = 0;
            image_index = 1;
            x += 6;
            vspeed = 6;
            scr_lerpvar("image_index", 1, 4, 12);
            if (global.facing == 1)
            {
                x += 6;
                scr_flip("x");
            }
        }
    }
    if (kris_fall_timer == 2)
    {
        with (obj_mainchara)
            friction = 3;
    }
    if (kris_fall_timer == 3)
    {
        snd_play(snd_noise);
        with (obj_mainchara)
            scr_shakeobj();
    }
    if (kris_fall_timer == 60)
    {
        snd_play(snd_noise);
        with (obj_mainchara)
            scr_shakeobj();
    }
    if (kris_fall_timer == 150)
    {
        snd_play_x(snd_wing, 1, 1.2);
        with (obj_mainchara)
        {
            image_index = 0;
            sprite_index = spr_kris_rise_side_b;
            scr_lerpvar("image_index", 1, 5, 12);
        }
    }
    if (kris_fall_timer == 162)
    {
        with (obj_mainchara)
        {
            if (global.facing == 1)
            {
                x -= 6;
                scr_flip("x");
            }
            image_index = 0;
            sprite_index = spr_krisd;
            cutscene = 0;
            fun = 0;
            x -= 6;
        }
    }
    if (kris_fall_timer >= 167)
    {
        kris_fall = false;
        global.interact = 0;
        global.facing = 0;
    }
}
if (trash_hit)
{
    trash_hit_timer++;
    if (trash_hit_timer == 1)
    {
        with (trashcan)
        {
            hspeed = 1;
            vspeed = -4;
            gravity = 1.4;
            image_angle = -45;
            depth = 60000;
            scr_shakeobj();
        }
    }
    if (trash_hit_timer == 5)
    {
        with (trashcan)
        {
            friction = 0.7;
            vspeed = 0;
            gravity = 0;
            image_angle = -90;
            hspeed = -7;
            y -= 4;
        }
    }
}
if (trash_shake)
{
    trash_shake = false;
    with (trashcan)
    {
        image_index++;
        scr_shakeobj();
    }
}
if (kick_start)
{
    kick_timer++;
    if (kick_timer == 1)
    {
        if (kick_index < 4)
        {
            with (kr_actor)
                scr_animate(1, 8, 0.33);
        }
        if (kick_index == 0)
        {
            kr_actor.x = 185;
            kr_actor.y = 140;
        }
        if (kick_index == 1)
        {
            with (kr_actor)
                scr_flip("x");
            kr_actor.x = 200;
            kr_actor.y = 120;
        }
        if (kick_index == 2)
        {
            with (kr_actor)
                scr_flip("x");
            kr_actor.x = 190;
            kr_actor.y = 110;
        }
        if (kick_index == 3)
        {
            with (kr_actor)
                scr_flip("x");
            kr_actor.x = 160;
            kr_actor.y = 130;
        }
        if (kick_index == 4)
        {
            kr_actor.image_index = 1;
            with (kr_actor)
                scr_flip("x");
            kr_actor.x = 207;
            kr_actor.y = 100;
            with (trashcan)
                image_angle *= -1;
            kick_timer = 15;
        }
        trashcan.x = kr_actor.x + 12;
        trashcan.y = kr_actor.y + 28;
        if (kick_index == 1 || kick_index == 3)
            trashcan.x = kr_actor.x - 32;
        if (kick_index == 4)
        {
            trashcan.x += 15;
            trashcan.y -= 5;
        }
        with (kr_actor)
            depth = 8000;
    }
    if (kick_index < 4 && kick_timer == 8)
        swing_snd = 1;
    if (kick_index < 4 && kick_timer == 12)
    {
        var kick_direction = (kick_index == 1 || kick_index == 3) ? -10 : 10;
        with (trashcan)
        {
            other.trash_hit_snd = 1;
            var shakex = instance_create(x, y, obj_shake);
            shakex.shakey = 9;
            shakex.shakex = 0;
            image_index = (image_index < 4) ? (image_index + 1) : 1;
            scr_shakeobj();
            hspeed = kick_direction;
            vspeed = -3;
            friction = 1;
        }
    }
    if (kick_index < 4 && kick_timer == 20)
    {
        with (trashcan)
        {
            hspeed = 0;
            vspeed = 0;
            gravity = 0;
            friction = 0;
        }
    }
    if (kick_timer == 40)
    {
        kick_timer = 0;
        kick_index++;
        if (kick_index == 5)
        {
            kick_loop = true;
            kick_start = false;
        }
    }
}
if (kick_loop)
{
    kick_loop_timer++;
    if (kick_loop_timer == 1)
    {
        kr_actor.image_index = 1;
        kr_actor.image_speed = 0.33;
    }
    if (kr_actor.image_index >= 8)
        kr_actor.image_speed = 0;
    if (kick_loop_timer == 8)
        swing_snd = 1;
    if (kick_loop_timer == 12)
    {
        with (trashcan)
        {
            other.trash_hit_snd = 1;
            var shakex = instance_create(x, y, obj_shake);
            shakex.shakey = 9;
            shakex.shakex = 0;
            scr_shakeobj();
            vspeed = -8;
            friction = 1;
        }
    }
    if (kick_loop_timer == 15)
    {
        with (trashcan)
        {
            vspeed = 8;
            friction = 1;
        }
    }
    if (kick_loop_timer == 18)
    {
        with (trashcan)
        {
            hspeed = 0;
            vspeed = 0;
            gravity = 0;
            friction = 0;
        }
    }
    if (kick_loop_timer >= (20 + kick_loop_time))
    {
        kr_actor.image_speed = 0;
        kick_loop_timer = 0;
        kick_loop_count++;
        if (kick_loop_count >= 1)
            kick_loop_time *= 0.5;
        if (kick_loop_count == 10)
        {
            kick_loop = false;
            kr_actor.image_index = 1;
        }
    }
}
if (bloom_stop)
{
    bloom_stop = false;
    with (bloom_fx)
        instance_destroy();
}
if (trash_hit_snd == 1)
{
    with (obj_event_manager)
        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_8, UnknownEnum.Value_937);
    trash_hit_snd = 0;
    snd_play_x(snd_hurt1, 1, 1);
    snd_play_x(snd_locker, 1, 0.8);
    snd_play_x(snd_locker, 1, 1);
    snd_play_x(snd_punchheavythunder, 0.8, 0.6);
}
if (swing_snd == 1)
{
    swing_snd = 0;
    snd_play_x(motor_upper_quick_mid, 1, 1);
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_937 = 937
}
