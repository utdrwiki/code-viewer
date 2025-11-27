if (con < 0)
    exit;
if (con == 0 && obj_mainchara.x >= 240 && global.interact == 0)
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
    c_sel(kr);
    c_walkdirect_speed(333, kr_actor.y, 5);
    c_sel(su);
    c_walkdirect_speed_wait(268, su_actor.y, 5);
    c_facing("u");
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Kris..^1. Kris^1, hey^1, wait!^1! Look!!/", "obj_ch4_DCA01_slash_Step_0_gml_31_0");
    c_msgnextloc("\\E7* The fountain's just up there!!/%", "obj_ch4_DCA01_slash_Step_0_gml_32_0");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_facing("u");
    c_wait_talk();
    c_pannable(1);
    c_sel(kr);
    c_walkdirect(333, 3886, 50);
    c_sel(su);
    c_walkdirect_wait(268, 3870, 50);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Well^1, that was easy./%", "obj_ch4_DCA01_slash_Step_0_gml_65_0");
    c_talk_wait();
    c_sel(su);
    c_facing("r");
    c_wait(15);
    c_autowalk(0);
    c_sel(kr);
    c_autowalk(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* Heh^1, too bad^1, was looking forward to another adventure.../", "obj_ch4_DCA01_slash_Step_0_gml_78_0");
    c_msgnextloc("\\EA* But^1, guess we gotta do what we gotta.../%", "obj_ch4_DCA01_slash_Step_0_gml_79_0");
    c_talk_wait();
    c_var_instance(id, "wind_sfx_state", 1);
    c_var_instance(id, "wind_sfx_pitch_target", 0.8);
    c_wait(2);
    c_var_instance(wind_effect, "con", 1);
    c_var_instance(id, "palette_shift", true);
    c_sel(su);
    c_sprite(spr_susie_surprised_step_back);
    c_var_instance(id, "wind_shake_push", true);
    c_wait(150);
    c_wait_if(id, "wind_shake_push", "=", false);
    c_var_instance(wind_effect, "con", 0);
    c_var_instance(id, "wind_sfx_state", 2);
    c_sel(su);
    c_halt();
    c_facing("u");
    c_sel(kr);
    c_halt();
    c_facing("u");
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* What the.../%", "obj_ch4_DCA01_slash_Step_0_gml_117_0");
    c_talk_wait();
    c_wait(30);
    c_mus2("initloop", "knight_appears.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 120);
    c_pannable(1);
    c_var_instance(id, "camera_y_pos", cameray());
    c_var_instance(id, "camera_pan", true);
    c_wait(80);
    c_var_instance(id, "screen_distort", true);
    c_wait(60);
    c_lerp_var_instance(roaring_knight, "image_index", 0, 4, 30);
    c_wait(40);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_shocked_behind);
    c_addxy(4, 0);
    c_var_instance(id, "camera_y_target", 3800);
    c_var_instance(id, "camera_pan", true);
    c_wait(120);
    c_sel(su);
    c_autowalk(1);
    c_facing("susieunhappy");
    c_walkdirect_speed_wait(295, 3900, 8);
    c_autowalk(0);
    c_sprite(spr_susie_point);
    c_imagespeed(0.2);
    c_var_instance(id, "slow_writer", true);
    c_speaker("susie");
    c_msgsetloc(0, "\\EI* Y..^1. You!/%", "obj_ch4_DCA01_slash_Step_0_gml_188_0");
    c_talk_wait();
    c_var_instance(id, "slow_writer", false);
    c_var_instance(id, "slide_noise_duration", 120);
    c_var_instance(id, "slide_noise", true);
    c_var_instance(id, "shake_duration", 120);
    c_var_instance(id, "shake_start", true);
    c_var_instance(id, "wind_sfx_state", 1);
    c_var_instance(id, "wind_sfx_pitch_target", 1.5);
    c_wait(2);
    c_var_instance(wind_effect, "con", 1);
    c_sel(kr);
    c_sprite(spr_kris_block_up_wind);
    c_imageindex(0);
    c_var_lerp_instance(kr_actor, "image_speed", 0.6, 0, 90);
    c_var_instance(kr_actor, "hspeed", 3);
    c_var_instance(kr_actor, "vspeed", 5);
    c_sel(su);
    c_halt();
    c_sprite(spr_susie_block_up_wind);
    c_imageindex(0);
    c_var_lerp_instance(su_actor, "image_speed", 0.6, 0, 90);
    c_var_instance(su_actor, "vspeed", 5);
    c_wait(30);
    c_var_instance(su_actor, "vspeed", 5);
    c_wait(30);
    c_var_instance(id, "sword_susie", true);
    c_wait(18);
    c_var_instance(su_actor, "vspeed", 60);
    c_var_instance(su_actor, "friction", 10);
    c_snd_play(snd_paper_rise);
    c_snd_play(snd_noise);
    c_var_instance(broken_stairs_marker, "visible", 1);
    c_shake();
    c_sound_play(snd_queen_punched_lower_heavy);
    c_sound_play(snd_hurt1);
    c_wait(3);
    c_sel(kr);
    c_sprite(spr_kris_dw_landed);
    c_halt();
    c_delaycmd(6, "imageindex", 1);
    c_shakeobj();
    c_sel(su);
    c_sprite(spr_susie_dw_fell);
    c_shakeobj();
    c_var_instance(wind_effect, "con", 0);
    c_var_instance(id, "wind_sfx_state", 2);
    c_wait(16);
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect(300, 4028, 10);
    c_delayfacing(11, "d");
    c_wait(15);
    var backup_speed = 2;
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(300, 4016, 6 + backup_speed);
    c_delaycmd(7 + backup_speed, "imagespeed", 0);
    c_delaycmd(7 + backup_speed, "imageindex", 0);
    c_shake();
    c_wait(2);
    c_snd_play(snd_paper_rise);
    c_snd_play(snd_noise);
    c_var_instance(broken_stairs_marker, "image_index", 1);
    c_wait(backup_speed + 7);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(300, 4004, 6 + backup_speed);
    c_delaycmd(7 + backup_speed, "imagespeed", 0);
    c_delaycmd(7 + backup_speed, "imageindex", 0);
    c_shake();
    c_wait(2);
    c_snd_play(snd_paper_rise);
    c_snd_play(snd_noise);
    c_var_instance(broken_stairs_marker, "image_index", 2);
    c_wait(backup_speed + 7);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(300, 3992, 6 + backup_speed);
    c_delaycmd(7 + backup_speed, "imagespeed", 0);
    c_delaycmd(7 + backup_speed, "imageindex", 0);
    c_shake();
    c_wait(2);
    c_snd_play(snd_paper_rise);
    c_snd_play(snd_noise);
    c_var_instance(broken_stairs_marker, "image_index", 3);
    c_wait(backup_speed + 7);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(300, 3980, 6 + backup_speed);
    c_delaycmd(7 + backup_speed, "imagespeed", 0);
    c_delaycmd(7 + backup_speed, "imageindex", 0);
    c_shake();
    c_wait(2);
    c_snd_play(snd_paper_rise);
    c_snd_play(snd_noise);
    c_var_instance(broken_stairs_marker, "image_index", 4);
    c_wait(backup_speed + 7);
    c_wait(90 + backup_speed);
    c_snd_play(snd_wing);
    c_sel(su);
    c_sprite(spr_susie_kneel_up);
    c_shakeobj();
    c_wait(30);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\Ec* D..^1. dammit.../", "obj_ch4_DCA01_slash_Step_0_gml_356_0");
    c_msgnextloc("\\EJ* Kris^1! Don't waste any time on me^1! I'll heal myself!/", "obj_ch4_DCA01_slash_Step_0_gml_357_0");
    c_msgnextloc("\\Ec* This is..^1. our chance to get them...^1! Go!/%", "obj_ch4_DCA01_slash_Step_0_gml_358_0");
    c_talk_wait();
    c_panobj(kr_actor, 5);
    c_wait(6);
    c_pannable(0);
    c_mus("free_all");
    c_mus2("initloop", "creepychase.ogg", 0);
    c_var_instance(id, "wind_push", true);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_down_slash);
    c_var_instance(roaring_knight, "image_index", 4);
    c_actortokris();
    c_waitcustom();
}
if (con == 2 && customcon == 1 && !d_ex())
{
    con = 3;
    global.interact = 0;
    global.facing = 0;
    scr_losechar();
    instance_create(x, y, obj_overworld_knight_sword_manager);
    with (broken_stairs_marker)
        create_block();
}
if (i_ex(obj_overworld_knight_sword1))
    chase_start = true;
if (con == 3 && customcon == 1 && obj_mainchara.y < 230 && global.interact == 0)
{
    customcon = 0;
    con = 4;
    with (obj_darkcontroller)
        charcon = 0;
    global.interact = 1;
    with (obj_mainchara)
        alarm[1] = -1;
    kris_windy.visible = false;
    snd_stop(snd_paper_surf);
    if (i_ex(obj_overworld_bulletarea))
    {
        with (obj_overworld_bulletarea)
            instance_destroy();
    }
    with (obj_overworld_knight_sword_manager)
        instance_destroy();
    with (obj_darkcontroller)
        charcon = 0;
    with (obj_church_wind_effect)
    {
        con = 0;
        image_alpha = 0;
    }
    c_waitcustom_end();
    c_var_instance(id, "chase_start", false);
    c_var_instance(id, "wind_push", false);
    c_var_lerp_to_instance(1049, "battlealpha", 0, 5);
    c_sel(kr);
    c_setxy(obj_mainchara.x, obj_mainchara.y);
    c_sprite(obj_mainchara.sprite_index);
    c_halt();
    c_visible(1);
    c_var_instance(1049, "visible", 0);
    c_wait(15);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EI* KRIS!!^1! N..^1. NOW'S YOUR CHANCE!!!/", "obj_ch4_DCA01_slash_Step_0_gml_450_0");
    c_msgnextloc("\\Ea* ATTACK THEM!!!/%", "obj_ch4_DCA01_slash_Step_0_gml_451_0");
    c_talk_wait();
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* ..^1. KRIS...!!!/%", "obj_ch4_DCA01_slash_Step_0_gml_457_0");
    c_talk_wait();
    c_mus("free_all");
    c_var_instance(id, "sword_fall", true);
    c_waitcustom();
}
if (slow_writer && i_ex(obj_writer))
{
    with (obj_writer)
        skippable = 0;
}
if (con == 40 && customcon == 1)
{
    con = 49;
    alarm[0] = 120;
    customcon = 0;
    fallsequence = instance_create(0, cameray(), obj_ch4_DCA01_fall);
    prophecy = instance_create(camerax() + 320, cameray() + 500, obj_dw_church_prophecy);
    prophecy.extflag = "initial2";
    prophecy.depth = 60;
    prophecy.destroykind = 2;
    var _hitstop = 10;
    prophecy.hitstop = _hitstop;
    with (obj_darkcontroller)
        charcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "wind_push", false);
    c_var_instance(kris_windy, "auto", false);
    c_var_instance(kris_windy, "visible", true);
    c_var_instance(kris_windy, "depth", 90);
    c_var_instance(kris_windy, "friction", 0);
    c_var_instance(kris_windy, "vspeed", 0);
    c_sel(kr);
    c_autowalk(0);
    c_wait(30);
    c_var_instance(97, "con", 1);
    c_var_instance(97, "depth", 10);
    c_var_instance(kris_windy, "top_anim_speed", 0);
    c_var_instance(id, "wind_sfx_state", 1);
    c_var_instance(id, "wind_sfx_pitch_target", 1);
    c_var_lerp_instance(kris_windy, "top_anim_speed", 0, 0.6, 15);
    c_wait(30);
    c_var_instance(id, "slide_dust", 1);
    c_var_lerp_add_instance(kris_windy, "y", 10, 5);
    c_wait(15);
    c_var_instance(id, "slide_dust", 2);
    c_var_lerp_to_instance(97, "windspeed", 14, 60);
    c_var_instance(id, "wind_sfx_pitch_target", 2);
    c_var_lerp_instance(kris_windy, "top_anim_speed", 0.6, 1, 30);
    c_wait(30);
    c_var_instance(id, "slide_dust", 1);
    c_var_lerp_add_instance(kris_windy, "vspeed", 20, 60, 4, "in");
    c_wait(60);
    c_var_instance(id, "slide_dust", 2);
    c_sel(kr);
    c_sprite(spr_kris_fall_d_dw);
    c_visible(false);
    c_autodepth(false);
    c_depth(70);
    c_imagespeed(0.6);
    c_sel(su);
    c_sprite(spr_susie_dw_fall_d);
    c_visible(true);
    c_imagespeed(0.6);
    c_autodepth(false);
    c_var_instance(id, "start_falling", true);
    c_depth(70);
    c_var_lerp_to_instance(97, "windspeed", 24, 30);
    c_var_instance(id, "wind_sfx_pitch_target", 2.5);
    c_wait(10);
    c_var_instance(id, "foreground_con", 1);
    c_var_lerp_to_instance(id, "foreground_y", 0, 5);
    c_wait(20);
    c_var_lerp_to_instance(id, "foreground_y", -720, 5);
    c_var_instance(kr_actor, "x", (camerax() + 320) - 4);
    c_var_instance(su_actor, "x", camerax() + 320 + 64);
    c_var_instance(kr_actor, "image_xscale", -2);
    c_var_instance(su_actor, "image_xscale", -2);
    c_var_lerp_instance(kr_actor, "y", cameray() - 64, cameray() + 200, 90, 3, "out");
    c_var_lerp_instance(su_actor, "y", cameray() - 64, cameray() + 200, 90, 3, "out");
    c_wait(10);
    c_var_instance(id, "foreground_con", 0);
    c_var_instance(arch, "visible", false);
    c_wait(20);
    c_var_instance(fallsequence, "con", 1);
    c_wait(20);
    c_var_instance(fallsequence, "con", 2);
    c_wait(30);
    c_var_instance(prophecy, "active", true);
    c_var_lerp_to_instance(prophecy, "y", cameray() + 230, 10);
    c_wait(10);
    c_var_instance(prophecy, "destroy", 1);
    c_sel(kr);
    c_sprite(spr_kris_fall_dw_hurt);
    c_var_instance(kr_actor, "image_xscale", "2", (camerax() + 320) - 4);
    c_var_instance(kr_actor, "x", (camerax() + 320) - 68);
    c_imagespeed(0);
    c_imageindex(0);
    c_sel(su);
    c_sprite(spr_susie_dw_fall_brace);
    c_imagespeed(0.1);
    c_var_instance(id, "wind_sfx_pitch", 0);
    c_var_instance(id, "wind_sfx_pitch_target", 0);
    c_var_instance(fallsequence, "delta", 0.05);
    c_var_lerp_add_instance(kr_actor, "y", 5, _hitstop, 2, "out");
    c_var_lerp_add_instance(su_actor, "y", 5, _hitstop, 2, "out");
    c_var_instance(97, "windspeed", 2.2);
    c_wait(_hitstop);
    c_sprite(spr_susie_dw_fall_d);
    c_imagespeed(0.6);
    c_sel(kr);
    c_var_instance(fallsequence, "delta", 1);
    c_var_instance(fallsequence, "con", 3);
    c_var_lerp_to_instance(97, "windspeed", 24, 10);
    c_var_lerp_to_instance(kr_actor, "image_index", 16, 70, 3, "out");
    c_var_instance(id, "wind_sfx_pitch", 2.5);
    c_var_instance(id, "wind_sfx_pitch_target", 2.5);
    c_var_lerp_add_instance(kr_actor, "y", -100, 90, 3, "out");
    c_var_lerp_add_instance(su_actor, "y", 20, 90, 3, "out");
    c_wait(30);
    c_var_instance(fallsequence, "con", 4);
    c_wait(30);
    c_sprite(spr_kris_fall_dw_hurt_wind);
    c_imagespeed(0.6);
    c_wait(50);
    c_var_instance(id, "wind_sfx_state", 2);
    c_var_instance(id, "foreground_con", 1);
    c_var_lerp_instance(id, "foreground_y", 480, 0, 4);
    c_wait(8);
    c_snd_play(snd_closet_impact);
    c_fadeout(1);
    c_wait(62);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 50 && !i_ex(obj_cutscene_master))
{
    con = -1;
    chase_start = false;
    snd_free_all();
    global.plot = 110;
    if (!scr_havechar("ralsei"))
        scr_getchar("ralsei");
    with (susie_collider)
        instance_destroy();
    with (susie_readable)
        instance_destroy();
    room_goto(room_dw_church_glass);
}
if (slide_noise)
{
    slide_noise = false;
    snd_loop(snd_paper_surf);
    scr_script_delayed(snd_stop, slide_noise_duration, 395);
}
if (screen_distort)
{
    screen_distort = false;
    bloom_fx = instance_create(0, 0, obj_fx_screenbloom);
    bloom_fx.style = 3;
    bloom_fx.bloomdist = 0.5;
    bloom_fx.amplitude = 2;
    bloom_fx.period = 10;
    bloom_fx.xoff = 1;
    bloom_fx.yoff = 1;
    scr_doom(bloom_fx, 200);
}
if (wind_shake_push)
{
    wind_shake_timer++;
    if (wind_shake_timer == 1)
    {
        su_actor.vspeed = 8;
        su_actor.friction = 0.4;
        kr_actor.vspeed = 8;
        kr_actor.friction = 0.4;
        shake_start = true;
    }
    var offset = 36;
    if (wind_shake_timer == 3)
    {
        with (su_actor)
        {
            sprite_index = spr_susie_block_up_wind;
            scr_lerpvar("image_speed", 0.6, 0, 150);
        }
        with (kr_actor)
        {
            sprite_index = spr_kris_block_up_wind;
            scr_lerpvar("image_speed", 0.6, 0, 150);
        }
    }
    if (wind_shake_timer == (30 + offset))
        su_actor.vspeed = 2;
    if (wind_shake_timer == (35 + offset))
        kr_actor.vspeed = 3;
    if (wind_shake_timer == (40 + offset))
    {
        su_actor.vspeed = 3;
        kr_actor.vspeed = 1;
    }
    if (wind_shake_timer == (50 + offset))
    {
        su_actor.vspeed = 2;
        kr_actor.vspeed = 2;
    }
    if (wind_shake_timer == (70 + offset))
        su_actor.vspeed = 3;
    if (wind_shake_timer == (75 + offset))
    {
        kr_actor.vspeed = 2;
        wind_shake_push = false;
    }
}
if (shake_start)
{
    shake_start = false;
    wind_shake_screen = instance_create(0, 0, obj_shake);
    var duration = shake_duration;
    with (wind_shake_screen)
    {
        permashake = 1;
        scr_lerpvar("shakex", 2, 0, duration);
        scr_lerpvar("shakey", 2, 0, duration);
    }
}
if (palette_shift)
{
    palette_siner += 0.08;
    with (obj_dw_church_staircase_floor)
    {
        if (!change_palette)
            change_palette = true;
    }
    with (obj_dw_church_stairs)
    {
        if (!change_palette)
            change_palette = true;
    }
    with (broken_stairs_marker)
    {
        if (!change_palette)
            change_palette = true;
    }
    pal_swap_set_layer(3666, palette_index, "TILES", false);
    pal_swap_set_layer(3666, palette_index, "ASSETS_Staircase", false);
    pal_swap_reset();
}
if (sword_susie)
{
    sword_susie_timer++;
    if (sword_susie_timer == 1)
        instance_create(camerax() + (view_wport[0] / 2), cameray(), obj_ch4_DCA01_roaringknight_sword);
    if (sword_susie_timer == 18)
    {
        instance_create(x, y, obj_shake);
        snd_play(snd_explosion_mmx3);
    }
    if (sword_susie_timer == 20)
        sword_susie = false;
}
if (sword_fall)
{
    sword_fall_timer++;
    with (obj_overworld_knight_sword_manager)
        instance_destroy();
    with (obj_darkcontroller)
        charcon = 0;
    with (obj_church_wind_effect)
    {
        con = 0;
        image_alpha = 0;
    }
    if (sword_fall_timer == 1)
    {
        snd_free_all();
        for (var i = 0; i < 35; i++)
        {
            sword[i] = scr_dark_marker((camerax() - 10) + (i * 20), cameray() - 100, spr_roaringknight_sword3);
            sword[i].depth = 5900;
            sword[i].image_angle = 270;
            sword[i].image_xscale = 2;
            sword[i].image_yscale = 2;
            var current_sword = sword[i];
            scr_script_delayed(snd_stop, i * 1, 214);
            scr_script_delayed(sound_play_x, i * 1, 31, 0.5, 1.3);
            with (current_sword)
                scr_delay_var("y", cameray() + 76, i * 1);
            scr_script_delayed(scr_lerp_instance_var, 60, current_sword, "y", cameray() + 76, cameray() + view_hport[0] + 220, 35, 4, "out");
        }
    }
    if (sword_fall_timer >= 1)
    {
        if (abs(sword[0].y - obj_mainchara.y) < 40)
        {
            snd_play(snd_hurt1);
            blackall.depth = 100;
            blackall.image_alpha = 1;
            sword_fall = false;
            con = 40;
            customcon = 1;
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_8, UnknownEnum.Value_937);
        }
    }
}
if (camera_pan)
{
    camera_pan_timer++;
    if (camera_pan_timer == 1)
        scr_lerpvar("camera_y_pos", cameray(), camera_y_target, 90, 3, "inout");
    camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
    if (camera_pan_timer >= 100)
    {
        camera_pan = false;
        camera_pan_timer = 0;
    }
}
if (startfallingcon == 1)
{
    kr_actor.visible = true;
    with (obj_ch4_DCA01_fall)
        visible = true;
    startfallingcon = 2;
}
if (start_falling)
{
    kr_actor.y = cameray() + 500;
    kr_actor.x = (camerax() + 320) - 7000;
    su_actor.y = cameray() + 500;
    su_actor.x = camerax() + 320 + 70;
    kr_actor.visible = false;
    kr_actor.depth = 80;
    su_actor.depth = 80;
    su_actor.visible = true;
    start_falling = false;
    with (obj_ch4_DCA01_fall)
        visible = false;
    startfallingcon = 1;
}
if (wind_sfx_state > 0)
{
    if (wind_sfx_state == 1)
    {
        if (!snd_is_playing(wind_sfx[1]))
        {
            wind_sfx[0] = snd_init("strongwind_loop.ogg");
            wind_sfx[1] = mus_loop_ext(wind_sfx[0], 0.7, 1);
            snd_volume(wind_sfx[1], wind_sfx_volume, 0);
            snd_pitch(wind_sfx[1], 0);
        }
        wind_sfx_pitch = scr_movetowards(wind_sfx_pitch, wind_sfx_pitch_target, 0.08);
        snd_pitch(wind_sfx[1], wind_sfx_pitch);
        wind_sfx_volume = scr_movetowards(wind_sfx_volume, wind_sfx_volume_target, 0.08);
        snd_volume(wind_sfx[1], wind_sfx_volume, 0);
    }
    else if (wind_sfx_state == 2)
    {
        if (snd_is_playing(wind_sfx[1]))
            snd_volume(wind_sfx[1], 0, 30);
        wind_sfx_state = 0;
        wind_sfx_pitch = 0;
        wind_sfx_volume = 0;
    }
}
if (!chase_start)
    exit;
if (chase_timer == 1)
    snd_loop(snd_paper_surf);
if (chase_timer >= 690)
{
    chase_start = false;
    wind_push = false;
    snd_stop(snd_paper_surf);
    global.interact = 1;
    with (obj_mainchara)
        alarm[1] = -1;
    sword_fall = true;
}
if (wind_push)
{
    if (obj_mainchara.y >= 3720 || obj_mainchara.y < 285)
    {
        with (kris_windy)
            battle_mode_stop();
        exit;
    }
    with (kris_windy)
        battle_mode_start();
    obj_mainchara.y += 2;
}
if (wind_state != 0)
{
    if (wind_state == 1)
    {
        debug_print("resuming wind");
        wind_sound = snd_loop(snd_paper_surf);
    }
    else if (wind_state == 2)
    {
        debug_print("pitch-shifting wind");
        snd_pitch_time(wind_sound, 2, 60);
    }
    wind_state = 0;
}
if (slide_dust == 1)
{
    if (slidetimer >= 0)
    {
        dust = instance_create(kris_windy.x + 20, kris_windy.y + 30, obj_slidedust);
        dust.depth = kris_windy.depth + 5;
        with (dust)
        {
            vspeed = -2;
            hspeed = -1 + random(2);
        }
        slidetimer = -6;
    }
    slidetimer++;
}
if (slide_dust == 2)
{
    slidetimer = 0;
    slide_dust = 0;
}
if (foreground_con == 1)
{
    arch.visible = true;
    arch.y = cameray() + foreground_y;
}
else if (foreground_con == 2)
{
    debug_print("foreground con 2");
    blackall.depth = -100;
    blackall.image_alpha = 1;
    foreground_con = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_937 = 937
}
