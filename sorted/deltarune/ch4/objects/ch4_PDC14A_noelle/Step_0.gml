if (con < 0)
    exit;
if (i_ex(obj_homealone_vent_loader))
{
    if (!obj_homealone_vent_loader.loaded)
        exit;
}
if (pause_heart)
{
    pause_heart = false;
    global.interact = 1;
}
if (unpause_heart)
{
    unpause_heart = false;
    global.interact = 0;
}
if (con == 0)
{
    start_timer++;
    if (start_timer == 1)
    {
        mus_volume(global.currentsong[1], 0, 14);
        vent_cover_marker = scr_marker(245, 62, spr_noellehouse_vent_closed_noelle_cover);
        vent_cover_marker.depth = 4999;
        vent_panel_marker = scr_marker(vent_cover_marker.x, vent_cover_marker.y - 2, spr_pixel_white);
        vent_panel_marker.depth = vent_cover_marker.depth + 10;
        vent_panel_marker.image_xscale = 7;
        vent_panel_marker.image_yscale = 0.8;
        vent_panel_marker.image_blend = #CEE7FF;
    }
    if (start_timer >= 60)
    {
        if (i_ex(obj_homealone_vent_hidden))
        {
            if (obj_homealone_vent_hidden.fadeout)
            {
                con = -1;
                exit;
            }
        }
        scr_flag_set(7, 1);
        with (desaturate_fx)
            con = 5;
        con = 1;
        alarm[0] = 1;
        global.facing = 0;
        exit_block = instance_create(320, 40, obj_homealone_solid);
        with (obj_homealone_vent_hidden)
            instance_destroy();
    }
}
if (con == 2)
{
    con = 3;
    auto_text = true;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    no = actor_count + 1;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    c_sel(kr);
    c_autowalk(0);
    c_setxy(kris_marker.x, kris_marker.y);
    c_sprite(spr_kris_sit);
    c_wait(30);
    c_var_instance(noelle_npc, "visible", 0);
    c_var_instance(kris_marker, "visible", 0);
    c_sel(no);
    c_autowalk(0);
    c_sprite(spr_noelle_sit_look_down_neutral);
    c_wait(30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ec* To be honest^1, I've kind of been waiting for.../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_104_0");
    c_msgnextloc("\\Eb* A chance for us to be alone all day./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_105_0");
    c_msgnextloc("\\Ec* .../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_106_0");
    c_msgnextloc("\\Ee* There's..^1. something I want to talk to you about^1, Kris./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_107_0");
    c_msgnextloc("\\Ee* .../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_108_0");
    c_msgnextloc("\\Ee* I want to talk to you about.../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_109_0");
    c_msgnextloc("\\EW* ..^1. last night./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_110_0");
    c_talk();
    c_wait_box(2);
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_waittalk();
    c_var_instance(id, "pause_heart", true);
    c_fadeout(150);
    c_wait(150);
    c_mus("free_all");
    c_wait(30);
    c_mus2("initloop", "flashback_excerpt.ogg", 0);
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_neutral);
    c_wait(30);
    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Last night^1, I..^1. I couldn't sleep./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_139_0");
    c_msgnextloc("* Every time I closed my eyes.../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_140_0");
    c_msgnextloc("* All I could see&was snow./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_141_0");
    c_msgnextloc("* I was terrified^1, Kris./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_142_0");
    c_msgnextloc("* Terrified it was all real./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_143_0");
    c_msgnextloc("* I went out on the porch to breathe^1, and.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_144_0");
    c_talk();
    c_wait_box(1);
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_wait_box(3);
    c_sel(kr);
    c_sprite(spr_kris_sit);
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_unhappy);
    c_wait_talk();
    c_wait(30);
    c_sprite(spr_noelle_sit_look_down_neutral);
    if (scr_flag_get(708) == 1)
    {
        c_msgsetloc(0, "\\Ea* That's when I felt it./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_168_0");
        c_msgnextloc("\\Ec* A hand on my wrist./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_169_0");
        c_msgnextloc("\\EZ* I froze./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_170_0");
        c_msgnextloc("\\EZ* And then I heard your voice./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_171_0");
        c_msgnextloc("\\EZ* Kris's voice./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_172_0");
        c_msgnextloc("\\Ec* You said^1, sorry for taking your watch^1, Noelle./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_173_0");
        c_msgnextloc("\\Ea* You said^1, it was all a stupid prank./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_174_0");
        c_msgnextloc("\\Eb* You said^1, Berdly is going to get better./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_175_0");
        c_msgnextloc("\\EZ* And you put the watch back on my wrist./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_176_0");
        c_talk();
        c_wait_box(3);
        c_sel(no);
        c_sprite(spr_noelle_sit_closed_eyes_side_b);
        c_wait_talk();
    }
    else
    {
        c_msgsetloc(0, "\\Ea* That's when I felt it./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_186_0");
        c_msgnextloc("\\EZ* A hand on my shoulder./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_187_0");
        c_msgnextloc("\\EZ* I froze./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_188_0");
        c_msgnextloc("\\Ea* And then I heard your voice./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_189_0");
        c_msgnextloc("\\Ec* Kris's voice./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_190_0");
        c_talk();
        c_wait_box(3);
        c_sel(no);
        c_sprite(spr_noelle_sit_closed_eyes_side_b);
        c_wait_talk();
    }
    c_wait(30);
    if (global.flag[915] == 20)
        c_msgsetloc(0, "\\Ec* You said^1, sorry for being weird at the hospital^1, Noelle./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_206_0");
    else
        c_msgsetloc(0, "\\Ec* You said^1, sorry for being weird yesterday^1, Noelle./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_210_0");
    c_msgnextloc("\\Eb* You said^1, it was all a stupid prank./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_212_0");
    c_msgnextloc("\\Ec* You said^1, Berdly was going to get better./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_213_0");
    c_talk_wait();
    c_wait(30);
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_neutral);
    c_msgsetloc(0, "\\Eb* ..^1. Kris^1, your voice^1, your deadpan^1, mumbly voice.../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_223_0");
    c_msgnextloc("\\Ec* Even if you sounded kind of weak and shaky.../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_224_0");
    c_msgnextloc("\\Ea* I don't know why^1, but it felt so long since I heard it./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_225_0");
    c_msgnextloc("\\E4* I even started sniffling^1! Haha!/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_226_0");
    c_msgnextloc("\\E8* Kris^1, Kris^1, you're back...!/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_227_0");
    c_talk_wait();
    c_fadein(60);
    c_mus2("volume", 0, 59);
    c_wait(60);
    c_var_instance(id, "unpause_heart", true);
    c_mus("free_all");
    c_wait(1);
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down);
    c_wait(15);
    c_sprite(spr_noelle_sit_laugh);
    c_imagespeed(0.25);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E8* Kris^1, thank you..^1. well^1, NO thanks for pranking me^1, but.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_249_0");
    c_talk_wait();
    c_wait(30);
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_wait(15);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* ..^1. Kris^1, can I..^1. say something else?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_259_0");
    c_talk_wait();
    c_waitcustom();
}
if (auto_text)
{
    if (i_ex(obj_writer))
    {
        if (!auto_text_start)
        {
            auto_text_start = true;
            auto_text_stop = false;
            auto_text_buffer = auto_text_buffer_time;
        }
        with (obj_writer)
            skippable = 0;
        if (!auto_text_stop && obj_writer.reachedend == 1)
        {
            auto_text_stop = true;
            auto_text_buffer = auto_text_buffer_time;
        }
        if (auto_text_stop)
        {
            auto_text_buffer--;
            if (variable_instance_exists(1026, "button1") && obj_writer.button1 == 1)
                auto_text_start = false;
            if (auto_text_buffer <= 0)
            {
                auto_text_start = false;
                auto_text_stop = false;
                auto_text_buffer = auto_text_buffer_time;
                with (obj_writer)
                    forcebutton1 = 1;
            }
        }
    }
    else if (auto_text_start)
    {
        auto_text_start = false;
    }
}
if (con == 3 && customcon == 1 && !d_ex())
{
    con = 4;
    auto_text = false;
    with (vent_cover_marker)
        visible = 0;
    with (vent_panel_marker)
        visible = 0;
    with (obj_homealone_heart)
        visible = 0;
    global.choicemsg[0] = stringsetloc("#Proceed", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_323_0");
    global.choicemsg[1] = stringsetloc("#Please don't", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_324_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("no_name");
    msgset(0, "\\C2 ");
    instance_create(0, 0, obj_ch4_PDC14A_choicer);
}
if (con == 4 && !i_ex(obj_ch4_PDC14A_choicer))
{
    con = (global.choice == 1) ? 15 : 20;
    with (obj_homealone_heart)
        visible = 1;
    obj_homealone_heart.x = heart_choice_x;
    obj_homealone_heart.y = heart_choice_y;
}
if (con == 10 && !d_ex() && customcon == 1)
{
    con = 11;
    customcon = 0;
    c_waitcustom_end();
    c_mus("free_all");
    if (scr_flag_get(707) == 0)
    {
        c_sel(no);
        c_visible(0);
        c_sound_play(snd_grab);
        c_sel(kr);
        c_sprite(spr_kris_grab_arm);
        c_halt();
        c_addxy(0, -7);
        c_imageindex(0);
        c_shakeobj();
        c_wait(15);
        c_speaker("noelle");
        c_msgsetloc(0, "\\EB* K..^1. Kris!? Kris^1, what are you.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_370_0");
        c_talk_wait();
        c_imageindex(2);
        c_wait(6);
        c_sound_play(snd_wing);
        c_sprite(spr_kris_noelle_run_down);
        c_addxy(0, 7);
        c_imagespeed(0.3);
        c_var_instance(id, "heart_bump_check", true);
        c_walkdirect_wait(kr_actor.x, 116, 8);
        c_sprite(spr_kris_noelle_run_down);
        c_walkdirect_wait(225, 170, 20);
        c_sprite(spr_kris_noelle_run_down);
        c_walkdirect_wait(225, 250, 10);
        c_wait(10);
        c_sound_play(snd_doorclose);
        c_wait(60);
        c_var_instance(desaturate_fx, "palette_index", 2);
        c_var_instance(id, "heart_bump_check", false);
        c_wait(161);
        c_var_instance(desaturate_fx, "palette_index", 0);
    }
    c_sound_play(snd_dooropen);
    c_wait(15);
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect_wait(224, 180, 30);
    c_wait(30);
    c_var_instance(blackall, "visible", 1);
    c_sound_play(snd_grab);
    c_wait(60);
    if (scr_flag_get(916) == 0)
    {
        scr_sideb_fail();
        c_sound_play(snd_ominous_cancel);
        c_wait(90);
    }
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (ticking_sfx)
{
    ticking_sfx_timer++;
    if ((ticking_sfx_timer % 60) == 1)
        snd_play(snd_tick_tock);
}
if (heart_bump_check)
{
    if (!heart_fall)
    {
        if (point_in_rectangle(obj_homealone_heart.x + (sprite_get_width(obj_homealone_heart.sprite_index) / 2), obj_homealone_heart.y + (sprite_get_height(obj_homealone_heart.sprite_index) / 2), kr_actor.x - 4, kr_actor.y - 4, kr_actor.x + sprite_get_width(kr_actor.sprite_index) + 4, kr_actor.y + sprite_get_height(kr_actor.sprite_index) + 4))
        {
            heart_fall = true;
            global.interact = 1;
            with (obj_homealone_heart)
                cutscene = 1;
        }
    }
    else
    {
        heart_fall_timer++;
        if (heart_fall_timer == 1)
        {
            snd_play(snd_noise);
            snd_play(snd_hurt1);
            with (obj_homealone_heart)
            {
                scr_jump_to_point(126, 174, 15, 16);
                image_angle -= 45;
            }
        }
        if (heart_fall_timer >= 16)
            heart_bump_check = false;
    }
}
if (con == 11 && !i_ex(obj_cutscene_master))
{
    con = -1;
    instance_create(0, 0, obj_persistentfadein);
    scr_flag_set(7, 0);
    global.plot = 64;
    global.flag[1704] = 1;
    room_goto(room_lw_noellehouse_closet);
}
if (con == 15 && !d_ex() && customcon == 1)
{
    con = 16;
    customcon = 0;
    with (vent_cover_marker)
        visible = 1;
    with (vent_panel_marker)
        visible = 1;
    c_waitcustom_end();
    c_var_instance(id, "auto_text", true);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ee* .../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_513_0");
    c_msgnextloc("\\Ec* (..^1. I guess..^1. I guess I shouldn't.)/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_514_0");
    c_msgnextloc("\\EW* (I mean^1, I know you didn't say anything^1, but...)/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_515_0");
    c_msgnextloc("\\Ee* (I guess let's just leave it at...)/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_516_0");
    c_msgnextloc("\\Ea* (I'm glad you're back.)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_517_0");
    c_talk_wait();
    c_var_instance(id, "auto_text", false);
    c_wait(30);
    c_var_instance(blackall, "image_alpha", 0);
    c_var_instance(blackall, "visible", 1);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(60);
    c_var_instance(id, "pause_heart", true);
    scr_sideb_fail();
    c_sound_play(snd_ominous_cancel);
    c_wait(60);
    c_sel(no);
    c_visible(0);
    c_sel(kr);
    c_visible(0);
    c_setxy(-100, 100);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_wait(30);
    c_var_instance(id, "unpause_heart", true);
    c_var_instance(blackall, "visible", 0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 16 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.plot = 63;
    global.interact = 0;
    with (obj_homealone_heart)
        cutscene = 0;
    if (exit_block != -4)
        instance_destroy(exit_block);
    if (!i_ex(obj_homealone_vent_hidden))
    {
        var vent_hidden = instance_create(320, 38, obj_homealone_vent_hidden);
        with (vent_hidden)
        {
            room_name = room_lw_noellehouse_vents_west;
            vent_name = "noelle";
            load_type = "left";
        }
    }
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = 25;
    heart_explore = true;
}
if (heart_explore)
{
    if (heart_explore_con == 0)
        heart_explore_con = 1;
    if (heart_explore_con == 1)
    {
        if (con == 99 && !d_ex() && customcon == 1)
        {
            heart_explore_con = -1;
            heart_explore = false;
            con = 10;
            exit;
        }
        if (point_in_rectangle(obj_homealone_heart.x + (sprite_get_width(obj_homealone_heart.sprite_index) / 2), obj_homealone_heart.y + (sprite_get_height(obj_homealone_heart.sprite_index) / 2), kr_actor.x - 4, kr_actor.y - 4, kr_actor.x + sprite_get_width(kr_actor.sprite_index) + 4, kr_actor.y + sprite_get_height(kr_actor.sprite_index) + 4))
            heart_explore_con = 2;
    }
    if (heart_check)
    {
        if (heart_explore_con < 2)
        {
            krishandshakecon = 0;
            krishandshakeval = 0;
            with (kr_actor)
                sprite_index = spr_kris_sit_look;
        }
        else
        {
            with (kr_actor)
                sprite_index = spr_kris_sit_arm_twitch_side_b;
            krishandshakecon = 1;
            krishandshakeval = 0.1;
        }
    }
    if (heart_explore_con == 2)
    {
        heart_explore_timer++;
        if (heart_explore_timer == 1)
        {
            global.interact = 1;
            var heart_target_x = kr_actor.x + 4;
            var heart_target_y = kr_actor.y + 18;
            with (obj_homealone_heart)
            {
                cutscene = 1;
                scr_move_to_point_over_time(heart_target_x, heart_target_y, 8);
            }
        }
        if (heart_explore_timer == 12)
        {
            with (obj_homealone_heart)
                visible = 0;
            instance_create(kr_actor.x, kr_actor.y + 10, obj_heartburst);
            snd_play(snd_heavyswing);
            snd_play(snd_break2);
        }
        if (heart_explore_timer == 20)
        {
            heart_explore_timer = 0;
            heart_explore_con = 3;
        }
    }
    if (heart_explore_con == 3 && customcon == 1)
    {
        con = 30;
        heart_explore_con = -1;
        heart_explore = false;
    }
}
if (con == 25 && !d_ex() && customcon == 1)
{
    con = 99;
    customcon = 0;
    auto_text = true;
    c_waitcustom_end();
    c_mus2("initloop", "noelle_normal.ogg", 0);
    c_wait(1);
    c_wait(15);
    c_imagespeed(0);
    c_wait(30);
    c_msgside("top");
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ee* .../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_703_0");
    c_talk_wait();
    c_wait(10);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* Kris.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_709_0");
    c_talk();
    c_var_lerp_instance(no_actor, "x", no_actor.x, no_actor.x - 6, 10, 2, "out");
    c_wait(10);
    c_wait_talk();
    c_wait(10);
    c_msgsetloc(0, "\\E3* Kris^1, there..^1. there was something else you did./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_717_0");
    c_talk();
    c_var_lerp_instance(no_actor, "x", no_actor.x - 6, no_actor.x - 12, 10, 2, "out");
    c_wait(10);
    c_wait_talk();
    c_wait(10);
    c_msgsetloc(0, "\\E9* Something else..^1. I have to ask you about./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_725_0");
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_talk();
    c_var_lerp_instance(no_actor, "x", no_actor.x - 12, no_actor.x - 18, 10, 2, "out");
    c_wait(10);
    c_wait_talk();
    c_wait(10);
    c_msgsetloc(0, "\\E1* After you said all of that..^1. you.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_735_0");
    c_talk();
    c_var_lerp_instance(no_actor, "x", no_actor.x - 18, no_actor.x - 24, 10, 2, "out");
    c_wait(10);
    c_wait_talk();
    c_wait(10);
    c_msgsetloc(0, "\\E3* Took my hand..^1. and.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_744_0");
    c_talk();
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_var_lerp_instance(no_actor, "x", no_actor.x - 24, no_actor.x - 31, 10, 2, "out");
    c_var_lerp_instance(kr_actor, "x", kris_marker.x, kris_marker.x - 2, 10, 2, "out");
    c_wait(10);
    c_wait_talk();
    c_wait(10);
    c_msgsetloc(0, "\\E2* Pulled..^1. a thorn out of my finger./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_759_0");
    c_talk();
    c_sel(kr);
    c_sprite(spr_kris_sit_arm_twitch_side_b);
    c_var_instance(id, "krishandshakecon", 1);
    c_var_instance(id, "krishandshakeval", 0.1);
    c_var_lerp_instance(no_actor, "x", no_actor.x - 31, no_actor.x - 38, 10, 2, "out");
    c_var_lerp_instance(kr_actor, "x", kris_marker.x - 2, kris_marker.x - 4, 10, 2, "out");
    c_wait(10);
    c_wait_talk();
    c_wait(10);
    c_msgsetloc(0, "\\E3* Then you said.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_772_0");
    c_talk_wait();
    c_var_instance(id, "heart_check", true);
    c_wait(20);
    c_msgsetloc(0, "\\E2* You said..^1. you said that when I saw you again.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_779_0");
    c_talk();
    c_var_lerp_instance(no_actor, "x", no_actor.x - 38, no_actor.x - 44, 10, 2, "out");
    c_var_lerp_instance(kr_actor, "x", kris_marker.x - 4, kris_marker.x - 6, 10, 2, "out");
    c_var_instance(id, "krishandshakeval", 0.3);
    c_wait(10);
    c_wait_talk();
    c_waitcustom();
}
if (con == 30 && !d_ex() && customcon == 1)
{
    con = 31;
    customcon = 0;
    auto_text = false;
    c_waitcustom_end();
    c_wait(10);
    c_msgside("bottom");
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* You said..^1. not to mention you did any of this..^1. or.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_805_0");
    c_talk();
    c_sel(kr);
    c_sprite(spr_kris_sit_arm_shake_side_b);
    c_var_lerp_instance(no_actor, "x", no_actor.x, no_actor.x - 4, 10, 2, "out");
    c_var_lerp_instance(kr_actor, "x", kr_actor.x, kr_actor.x - 2, 10, 2, "out");
    c_var_instance(id, "krishandshakeval", 0.5);
    c_wait(10);
    c_wait_talk();
    c_wait(10);
    c_var_instance(id, "krishandshakecon", 0);
    c_mus("free_all");
    c_wait(1);
    c_sel(kr);
    c_imagespeed(0);
    c_sprite(spr_kris_noelle_sit_shush_side_b);
    c_imageindex(6);
    c_soundplay(snd_wing);
    c_wait(4);
    c_imageindex(7);
    c_sel(no);
    c_visible(0);
    c_wait(2);
    c_sel(kr);
    c_imagespeed(0);
    c_wait(45);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EG* ?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_839_0");
    c_talk_wait();
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_kris_noelle_sit_unshush_side_b);
    c_soundplay(snd_noise);
    c_imageindex(0);
    c_wait(8);
    c_imageindex(1);
    c_wait(8);
    c_imageindex(2);
    c_wait(15);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E8* Kris^1, it's okay^1! It's just us!/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_857_0");
    c_msgnextloc("\\E4* You just said not to mention any of that.../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_858_0");
    c_msgnextloc("\\E2* Because it'd get..^1. heard./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_859_0");
    c_talk();
    c_wait_box(2);
    c_var_instance(id, "krishandshakecon", 1);
    c_var_instance(id, "krishandshakeval", 1.1);
    c_wait_talk();
    c_var_instance(id, "krishandshakecon", 0);
    c_sel(kr);
    c_sprite(spr_kris_noelle_sit_shush_side_b);
    c_imageindex(7);
    c_soundplay(snd_wing);
    c_wait(30);
    c_sprite(spr_kris_noelle_sit_unshush_side_b);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(8);
    c_imageindex(2);
    c_wait(30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E8* ..^1. Kris..^1. Kris^1, it's okay^1, it's just us./%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_888_0");
    c_var_instance(id, "krishandshakecon", 1);
    c_var_instance(id, "krishandshakeval", 1.2);
    c_talk_wait();
    c_wait(30);
    c_msc(1270);
    c_talk_wait();
}
if (con == 50 && !d_ex())
{
    con = 11;
    scr_sideb_fail();
    c_var_instance(id, "krishandshakecon", 0);
    c_sel(kr);
    c_sprite(spr_kris_sit);
    c_sel(no);
    c_visible(1);
    c_sprite(spr_noelle_sit_look_left);
    c_addxy(2, 0);
    c_wait(30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EG* .../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_923_0");
    c_msgnextloc("\\E8* Fahaha!/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_924_0");
    c_msgnextloc("\\E4* Kris^1, you can't fool me!/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_925_0");
    c_msgnextloc("\\E8* Ugh^1, this had to be your worst prank ever!/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_926_0");
    c_msgnextloc("\\E2* Never do something like that again^1, okay?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_927_0");
    c_talk();
    c_wait_box(1);
    c_sel(no);
    c_sprite(spr_noelle_sit_laugh);
    c_imagespeed(0.25);
    c_wait_talk();
    c_wait(30);
    c_var_instance(blackall, "image_alpha", 0);
    c_var_instance(blackall, "visible", 1);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(60);
    c_soundplay(snd_ominous_cancel);
    c_wait(60);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 52 && !d_ex())
{
    con = 53;
    c_var_instance(id, "krishandshakecon", 0);
    c_var_instance(desaturate_fx, "snowflakes_start", true);
    c_var_lerp_to_instance(desaturate_fx, "palette_index", 1, 15);
    c_wait(2);
    c_mus("free_all");
    c_soundplay(snd_me3);
    c_sel(kr);
    c_sprite(spr_kris_noelle_hair_loop_side_b);
    c_var_lerp_instance(kr_actor, "image_speed", 0.5, 1, 90, 1, "in");
    c_wait(90);
    c_var_lerp_instance(kr_actor, "image_speed", 0.5, 0, 60, 1, "in");
    c_var_instance(desaturate_fx, "snowflakes_stop", true);
    c_wait(60);
    c_imagespeed(0);
    c_sprite(spr_kris_noelle_hair_stop_side_b);
    c_wait(60);
    c_var_instance(id, "fadecon", 1);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ek* Kris...?/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_987_0");
    c_msgnextloc("\\Ek* K..^1. Kris^1, your voice..^1. it.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_988_0");
    c_talk();
    c_mus2("initloop", "me.ogg", 0);
    c_wait_box(0);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_kris_noelle_hair_trysmile_side_b);
    c_wait(15);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ej* Ha..^1. ha..^1. Kris^1, that's..^1. another joke^1, right...?/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1010_0");
    c_msgnextloc("\\Ek* (That voice..^1. how..^1. the voice from my dream...)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1011_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_wait_box(1);
    c_sel(kr);
    c_sprite(spr_kris_noelle_hair_stop_side_b);
    c_waittalk();
    c_wait(30);
    c_msc(1272);
    c_talk_wait();
}
if (con == 54 && !d_ex())
{
    con = 11;
    with (obj_homealone_heart)
    {
        scr_delay_var("x", 160, 15);
        scr_delay_var("y", 150, 15);
        scr_delay_var("visible", 1, 15);
    }
    snd_free_all();
    c_var_instance(id, "fadecon", 3);
    c_var_instance(blackall, "visible", 1);
    c_wait(60);
    c_soundplay(snd_whip_crack_only);
    c_wait(60);
    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgsetloc(0, "* THEN DON'T SCARE ME LIKE THAT ANYMORE!/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1061_0");
    c_msgnextloc("* .../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1062_0");
    c_msgnextloc("* S-sorry^1, Kris.../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1063_0");
    c_msgnextloc("* .../", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1064_0");
    c_msgnextloc("* Let's..^1. let's get back to doing our projects^1, okay?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1065_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "shake_amount", 2);
    c_var_instance(id, "shake_text", true);
    c_wait_box(2);
    c_var_instance(id, "shake_amount", 0);
    c_var_instance(id, "shake_text", true);
    c_waittalk();
    scr_flag_set(707, 1);
    c_wait(60);
    scr_sideb_fail();
    c_soundplay(snd_ominous_cancel);
    c_wait(90);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 56 && !d_ex())
{
    con = 57;
    c_sel(kr);
    c_sprite(spr_kris_sit_side_b);
    c_sel(no);
    c_sprite(spr_noelle_sit_shock_side_b);
    c_visible(1);
    c_soundplay_x(snd_noelle_scared, 0.4, 1.2);
    c_sel(no);
    c_walkdirect(no_actor.x + 18, no_actor.y + 1, 8);
    c_wait(60);
    c_wait(30);
    c_sprite(spr_noelle_sit_5_side_b);
    c_speaker("noelle");
    c_msgsetloc(0, "\\El* S..^1. Sorry^1, Kris..^1. What did you say? I must have misheard you./", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1118_0");
    c_msgnextloc("\\Ek* (No..^1. there's no way they..^1. they heard...)/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1119_0");
    c_msgnextloc("\\Ek* (There's no way they heard..^1. my thoughts.)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1120_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_wait_box(1);
    c_sel(no);
    c_var_instance(no_actor, "shaketype", 1);
    c_var_instance(no_actor, "shakeamt", 1);
    c_delaycmd4(12, "var", no_actor, "shakeamt", 0);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_waittalk();
    c_wait(30);
    c_msc(1274);
    c_talk_wait();
}
if (con == 60 && !d_ex())
{
    con = 61;
    c_soundplay(snd_wing);
    c_sel(no);
    c_sprite(spr_noelle_sit_shock_side_b);
    c_var_instance(no_actor, "shaketype", 1);
    c_var_instance(no_actor, "shakeamt", 1);
    c_delaycmd4(12, "var", no_actor, "shakeamt", 0);
    c_wait(60);
    c_sprite(spr_noelle_sit_2_side_b);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Eh* W..^1. What are you talking about^1, Kris?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1170_0");
    c_talk();
    c_var_lerp_instance(no_actor, "x", no_actor.x, no_actor.x + 5, 10, 2, "out");
    c_wait(10);
    c_waittalk();
    c_msgsetloc(0, "\\Ei* I..^1. I didn't say anything!/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1176_0");
    c_talk();
    c_var_lerp_instance(no_actor, "x", no_actor.x + 5, no_actor.x + 7, 10, 2, "out");
    c_wait(10);
    c_waittalk();
    c_sprite(spr_noelle_sit_shock_side_b);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ek* (It's impossible. That's impossible.)/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1186_0");
    c_msgnextloc("\\Ek* (It's just a coincidence.)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1187_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_sel(no);
    c_var_instance(no_actor, "shaketype", 1);
    c_var_instance(no_actor, "shakeamt", 0.6);
    c_waittalk();
    c_wait(30);
    c_msc(1276);
    c_talk_wait();
}
if (con == 62 && !d_ex())
{
    con = 63;
    c_wait(60);
    c_var_instance(no_actor, "shakeamt", 0);
    c_sel(no);
    c_sprite(spr_noelle_sit_5_side_b);
    c_wait(60);
    c_sprite(spr_noelle_sit_1_side_b);
    c_wait(60);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EZ* (If you can..^1.  hear me...)/", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1225_0");
    c_msgnextloc("\\EZ* (Say \"red\" or \"blue\".)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1226_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(15);
    c_msc(1278);
    c_talk_wait();
}
if (con == 64 && !d_ex())
{
    con = 65;
    c_speaker("noelle");
    c_msgsetloc(0, "\\EZ* (Say..^1. \"green\" or \"black\".)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1246_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(15);
    c_msc(1280);
    c_talk_wait();
}
if (con == 68 && !d_ex())
{
    con = 69;
    c_wait(30);
    c_sel(no);
    c_var_instance(no_actor, "shakeamt", 0.6);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ee* (Say..^1. say..^1. \"it didn't happen.\" Say \"it didn't snow.\")/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1273_0");
    c_talk();
    c_sprite(spr_noelle_sit_3_side_b);
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(30);
    c_msc(1284);
    c_talk_wait();
    c_var_instance(no_actor, "shakeamt", 0);
}
if (con == 70 && !d_ex())
{
    con = 71;
    c_sel(no);
    c_sprite(spr_noelle_sit_3_side_b);
    c_var_instance(no_actor, "shakeamt", 0.6);
    c_var_instance(no_actor, "shaketype", 1);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EW* (You're..^1. lying. You're lying.)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1303_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(30);
    c_msc(1286);
    c_talk_wait();
    c_var_instance(no_actor, "shakeamt", 0);
}
if (con == 72 && !d_ex())
{
    con = 73;
    snd_free_all();
    c_wait(15);
    c_sound_play_x(snd_ominous, 1, 0.8);
    c_wait(45);
    c_sel(no);
    c_var_instance(no_actor, "shaketype", 1);
    c_var_instance(no_actor, "shakeamt", 1);
    c_delaycmd4(12, "var", no_actor, "shakeamt", 0);
    c_sprite(spr_noelle_sit_4_side_b);
    c_wait(45);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ek* K..^1. Kris? Kris^1, what did you say?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1341_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(30);
    c_msc(1288);
    c_talk_wait();
}
if (con == 74 && !d_ex())
{
    con = 75;
    c_sound_play_x(snd_ominous, 1, 0.8);
    c_var_instance(desaturate_fx, "snowflakes_start", true);
    c_sel(kr);
    c_sprite(spr_kris_sit_hand_raise_side_b);
    c_wait(4);
    c_imageindex(1);
    c_wait(12);
    c_sel(kr);
    c_imageindex(2);
    c_wait(12);
    c_imageindex(3);
    c_wait(45);
    c_sel(no);
    c_sprite(spr_noelle_sit_hand_raise_side_b);
    c_mus2("initloop", "sinedrone_danger_high.ogg", 0);
    c_mus2("pitch", 0.05, 0);
    c_wait(30);
    c_wait(30);
    c_wait(5);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ek* K..^1. Kris? Kris^1, what is that?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1392_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(30);
    c_msc(1290);
    c_talk_wait();
}
if (con == 76 && !d_ex())
{
    con = 77;
    c_wait(30);
    kr_xval = kr_actor.x;
    no_xval = kr_actor.x + 30;
    c_sel(kr);
    c_walkdirect(kr_xval + 8, kr_actor.y, 30);
    c_mus2("pitchtime", 0.1, 30);
    c_wait(20);
    c_sel(no);
    c_walkdirect(no_actor.x + 4, no_actor.y, 5);
    c_wait(35);
    c_sel(no);
    c_sprite(spr_noelle_sit_2_side_b);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ej* Kris..^1. that's..^1. not the thorn^1, is it?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1431_0");
    c_talk();
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_waittalk();
    c_wait(10);
    c_var_instance(no_actor, "shakeamt", 0.6);
    c_msgsetloc(0, "\\Ei* That's not..^1. the..^1. ThornRing^1, is it...?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1440_0");
    c_talk();
    c_var_instance(id, "text_speed", 3);
    c_var_instance(id, "set_text_speed", true);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_sel(no);
    c_walkdirect(no_actor.x + 8, no_actor.y, 10);
    c_wait(20);
    c_waittalk();
    c_wait(30);
    c_msc(1292);
    c_talk_wait();
}
if (con == 78 && !d_ex())
{
    con = 79;
    c_sel(no);
    c_sprite(spr_noelle_sit_1_side_b);
    c_sel(kr);
    c_walkdirect(kr_actor.x + 8, kr_actor.y, 45);
    c_mus2("pitchtime", 0.2, 30);
    c_wait(40);
    c_sel(no);
    c_walkdirect(no_actor.x + 5, no_actor.y, 5);
    c_wait(80);
    c_sprite(spr_noelle_sit_2_side_b);
    c_speaker("noelle");
    c_msgsetloc(0, "\\El* K..^1. Kris..^1. c'mon..^1. you..^1. you still.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1484_0");
    c_talk();
    c_sel(no);
    c_walkdirect(no_actor.x + 10, no_actor.y, 10);
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_var_instance(id, "shake_amount", 0.25);
    c_var_instance(id, "shake_text", true);
    c_wait(12);
    c_waittalk();
    c_speaker("noelle");
    c_msgsetloc(0, "\\ED* What about..^1. what about last night? What about.../%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1497_0");
    c_talk();
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_var_instance(id, "shake_amount", 0.5);
    c_var_instance(id, "shake_text", true);
    c_sel(no);
    c_walkdirect(no_actor.x + 15, no_actor.y, 10);
    c_wait(18);
    c_waittalk();
    c_speaker("noelle");
    c_msgsetloc(0, "\\ED* Didn't you..^1. want to..^1. protect me...?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1510_0");
    c_talk();
    c_var_instance(id, "text_speed", 2);
    c_var_instance(id, "set_text_speed", true);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_sel(no);
    c_walkdirect(no_actor.x + 20, no_actor.y, 10);
    c_wait(18);
    c_waittalk();
    c_wait(30);
    c_msc(1294);
    c_talk_wait();
}
if (con == 80 && !d_ex())
{
    con = 81;
    c_sel(kr);
    c_walkdirect(kr_actor.x + 8, kr_actor.y, 34);
    c_mus2("pitchtime", 0.3, 30);
    c_wait(29);
    c_sel(no);
    c_sprite(spr_noelle_sit_1_side_b);
    c_sel(no);
    c_walkdirect(no_actor.x + 5, no_actor.y, 5);
    c_wait(30);
    c_wait(45);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ek* (Why..^1. can't..^1. I..^1. move?)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1550_0");
    c_var_instance(id, "idealfadesinamt", 3);
    c_talk();
    c_var_instance(id, "text_speed", 2.5);
    c_var_instance(id, "set_text_speed", true);
    c_var_instance(id, "shake_amount", 0.25);
    c_var_instance(id, "shake_text", true);
    c_var_instance(no_actor, "shaketype", 1);
    c_var_instance(no_actor, "shakeamt", 0.5);
    c_waittalk();
    c_msgsetloc(0, "\\Ek* (Why..^1. can't I..^1. look..^1. away?)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1562_0");
    c_talk();
    c_var_instance(no_actor, "shakeamt", 0.6);
    c_sel(kr);
    c_walkdirect(kr_actor.x + 13, kr_actor.y, 15);
    c_var_instance(id, "idealfadesinamt", 5);
    c_mus2("pitchtime", 0.4, 30);
    c_var_instance(id, "text_speed", 3);
    c_var_instance(id, "set_text_speed", true);
    c_var_instance(id, "shake_amount", 0.5);
    c_var_instance(id, "shake_text", true);
    c_var_instance(no_actor, "shaketype", 1);
    c_var_instance(no_actor, "shakeamt", 1);
    c_wait(30);
    c_waittalk();
    c_msgsetloc(0, "\\Ek* (NOELLE^1, DO SOMETHING!!!)/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1579_0");
    c_talk();
    c_var_instance(id, "idealfadesinamt", 7);
    c_var_instance(no_actor, "shaketype", 1);
    c_var_instance(no_actor, "shakeamt", 1);
    c_var_instance(id, "text_speed", 3.5);
    c_var_instance(id, "set_text_speed", true);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_sel(kr);
    c_walkdirect(kr_actor.x + 17, kr_actor.y, 15);
    c_mus2("pitchtime", 0.5, 30);
    c_wait(30);
    c_waittalk();
    c_mus2("pitchtime", 0.6, 30);
    c_wait(30);
    c_msc(1296);
    c_talk_wait();
}
if (con == 82 && !d_ex())
{
    con = 83;
    c_var_instance(no_actor, "shakeamt", 0);
    c_sel(no);
    c_autodepth(0);
    c_sprite(spr_kris_noelle_sit_shaking_hand_side_b);
    c_imagespeed(0.2);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ei* Kris^1, I really think I%%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1615_0");
    c_talk();
    c_sel(kr);
    c_mus2("pitchtime", 0.8, 15);
    c_var_instance(id, "idealfadesinamt", 9);
    c_sel(no);
    c_sprite(spr_kris_noelle_sit_shaking_hand_side_b_lookathand);
    c_wait_box(0);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_wait(15);
    c_waittalk();
    c_speaker("noelle");
    c_msgsetloc(0, "\\El* I mean I just%%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1631_0");
    c_talk();
    c_sel(kr);
    c_mus2("pitchtime", 1, 15);
    c_var_instance(id, "idealfadesinamt", 11);
    c_sel(no);
    c_sprite(spr_kris_noelle_sit_shaking_hand_side_b);
    c_wait_box(0);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_wait(15);
    c_waittalk();
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ej* I think I need to%%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1647_0");
    c_talk();
    c_sel(kr);
    c_mus2("pitchtime", 1.2, 15);
    c_var_instance(id, "idealfadesinamt", 13);
    c_sel(no);
    c_sprite(spr_kris_noelle_sit_shaking_hand_side_b_lookathand);
    c_wait_box(0);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_wait(15);
    c_waittalk();
    c_speaker("noelle");
    c_msgsetloc(0, "\\Ei* G-gosh^1, I think I have to%%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1663_0");
    c_talk();
    c_mus2("pitchtime", 1.4, 15);
    c_var_instance(id, "idealfadesinamt", 15);
    c_sel(no);
    c_sprite(spr_kris_noelle_sit_shaking_hand_side_b);
    c_wait_box(0);
    c_var_instance(id, "shake_amount", 1);
    c_var_instance(id, "shake_text", true);
    c_wait(15);
    c_waittalk();
    c_var_instance(id, "idealfadesinamt", 17);
    c_wait(20);
    c_sel(kr);
    c_walkdirect_wait(kr_actor.x + 12, kr_actor.y, 6);
    c_sprite(spr_kris_noelle_sit_reach_side_b_alt);
    c_halt();
    c_sel(no);
    c_halt();
    c_visible(0);
    c_sel(kr);
    c_var_instance(desaturate_fx, "snowflakes_stop_fast", true);
    c_mus2("free_all", 0, 0);
    c_imagespeed(0);
    c_imageindex(0);
    for (var i = 0; i < 14; i++)
    {
        c_imageindex(i);
        if (i == 3)
        {
            c_soundplay(snd_grab);
            c_wait(1);
            c_soundplay_x(snd_noelle_scared, 0.6, 1.2);
            c_wait(1);
            c_var_instance(id, "idealfadesinamt", 0);
            c_var_instance(id, "fadecon", 999);
        }
        else if (i == 7)
        {
            c_wait(60);
        }
        else if (i == 9)
        {
            c_soundplay(snd_wing);
            c_wait(2);
        }
        else
        {
            c_wait(6);
        }
    }
    c_wait(30);
    c_msc(1298);
    c_talk_wait();
}
if (con == 84 && !d_ex())
{
    con = 85;
    c_mus2("free_all", 0, 0);
    c_sel(kr);
    c_sprite(spr_kris_noelle_sit_hand_on_hand_side_b_alt);
    c_imageindex(9);
    for (var i = 9; i < 14; i++)
    {
        c_wait(8);
        c_imageindex(i);
    }
    c_wait(30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\Eh* ..^1. K..^1. Kris?/%", "obj_ch4_PDC14A_noelle_slash_Step_0_gml_1749_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "text_speed", 4);
    c_var_instance(id, "set_text_speed", true);
    c_wait(30);
    c_sprite(spr_kris_noelle_sit_hand_on_hand_side_b_smile);
    c_imageindex(0);
    c_waittalk();
    c_wait(2);
    c_sprite(spr_kris_noelle_sit_hand_on_hand_side_b_alt);
    c_imageindex(13);
    c_wait(10);
    c_wait(15);
    c_var_instance(blackall, "visible", 1);
    c_var_instance(id, "blood_drip", true);
    c_wait(60);
    c_wait(60);
    c_soundplay(snd_ominous_worse);
    c_wait(220);
    c_wait_if(id, "blood_drip", "=", false);
    c_wait(150);
    c_wait(150);
    c_pannable(0);
    c_terminatekillactors();
}
if (con == 85 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.plot = 90;
    global.interact = 3;
    global.entrance = (ord(string_upper("L")) - 76) + 1;
    scr_flag_set(7, 0);
    snd_free_all();
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_lw_noellehouse_bathroom);
}
if (krishandshakecon == 1)
    kr_actor.image_index = floor(random(1) + krishandshakeval);
if (fadecon == 1)
{
    ominousfademarker1.x = camerax() + 160;
    ominousfademarker1.y = cameray() + 80;
    ominousfademarker2.x = camerax() + 160;
    ominousfademarker2.y = cameray() + 80;
    ominousfademarker3.x = camerax() + 160;
    ominousfademarker3.y = cameray() + 80;
    fadecon = 1.5;
}
if (fadecon == 1.5)
{
    scr_lerpvar_instance(ominousfademarker1, "image_alpha", 0, 1, 300);
    scr_lerpvar_instance(ominousfademarker2, "image_alpha", 0, 1, 360);
    scr_lerpvar_instance(ominousfademarker3, "image_alpha", 0, 1, 420);
    fadecon = 2;
}
if (fadecon == 2)
{
    fademarksin++;
    ominousfademarker1.image_angle = 0;
    ominousfademarker2.image_angle = 0;
    ominousfademarker3.image_angle = 0;
    ominousfademarker1.image_yscale = abs(sin(fademarksin / 60) * 0.05) + 0.85;
    ominousfademarker2.image_xscale = abs(sin(fademarksin / 90) * 0.05) + 0.85;
    ominousfademarker3.image_xscale = abs(sin(fademarksin / 90) * 0.05) + 0.85;
    ominousfademarker3.image_yscale = abs(cos(fademarksin / 90) * 0.05) + 0.85;
    if (i_ex(blackall))
    {
        if (blackall.visible == true)
            fadecon = 3;
    }
}
if (fadecon == 3)
{
    ominousfademarker1.image_alpha = 0;
    ominousfademarker2.image_alpha = 0;
    ominousfademarker3.image_alpha = 0;
    fadecon = 4;
}
if (blood_drip)
{
    drip_timer--;
    if (drip_marker.visible == 0)
    {
        with (drip_marker)
            setxy(camerax() + 146, cameray() + 50);
        drip_marker.visible = 1;
    }
    if (drip_timer <= 0)
    {
        drip_index++;
        if (drip_index == 1)
            snd_play(snd_ominous_stab_harsh_2);
        if (drip_index < array_length(drip_timestamps))
        {
            drip_timer = drip_timestamps[drip_index] / drip_modifier;
            drip_marker.image_index = drip_index;
        }
        else
        {
            blood_drip = false;
            scr_lerp_var_instance(drip_marker, "image_alpha", 1, 0, 60);
        }
    }
}
if (shake_text)
{
    shake_text = false;
    scr_writer_setshake(shake_amount);
}
if (set_text_speed)
{
    set_text_speed = false;
    scr_writer_setspeed(text_speed);
}
if (desaturate_room)
{
    desaturate_room = false;
    with (desaturate_fx)
    {
        con = 0;
        palette_index = 1;
    }
}
if (saturate_room)
{
    saturate_room = false;
    with (desaturate_fx)
        con = 10;
}
