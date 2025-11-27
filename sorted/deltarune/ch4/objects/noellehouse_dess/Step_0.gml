if (con < 0)
    exit;
if (!init)
{
    if (i_ex(obj_mainchara))
    {
        init = true;
        var loader = instance_create(0, 0, obj_homealone_vent_loader);
        loader.load_room = 53;
        loader.load_vent = "door";
    }
    else
    {
        init = true;
    }
}
if (kris_move)
{
    if (global.facing != 2)
    {
        var can_move = false;
        with (obj_trigger)
        {
            if (place_meeting(x, y, obj_mainchara))
                can_move = true;
        }
        if (can_move)
            kris_move_timer++;
        if (kris_move_timer >= 5 && !d_ex() && global.interact == 0)
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
        }
        with (obj_readable_room1)
        {
            x = -100;
            y = -100;
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
        with (obj_readable_room1)
        {
            x = xstart;
            y = ystart;
        }
    }
}
if (!i_ex(obj_homealone_heart))
    exit;
if (!init_heart)
{
    if (scr_flag_get(7) == 0)
        scr_flag_set(7, 1);
    with (obj_homealone_vent_overlay)
        instance_destroy();
    overlay = instance_create(0, 0, obj_noellehouse_basement_overlay);
    with (overlay)
    {
        depth = 5100;
        with (tree_overlay)
            instance_destroy();
        set_alpha(0.3);
        set_heart_target(568);
        heart_glow_show();
    }
    if (scr_debug())
    {
        if (global.tempflag[90] == 1)
        {
            global.interact = 1;
            instance_create(0, 0, obj_homealone_vent_overlay);
            with (overlay)
                instance_destroy();
            with (ceiling_collider)
                instance_destroy();
            with (ceiling_right)
                instance_destroy();
            with (obj_homealone_dess_closet_controller)
                con = 1;
            con = 10;
            with (obj_homealone_heart)
            {
                cutscene = 1;
                visible = 0;
            }
            with (guitar_marker)
                visible = 0;
            with (hockey_throw)
                create_puck(208, 130, 79988);
            scr_losechar();
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            su = actor_count + 1;
            su_actor = instance_create(45, 112, obj_actor);
            scr_actor_setup(su, su_actor, "susie");
            su_actor.sprite_index = spr_susie_sit_normal;
            no = actor_count + 2;
            no_actor = instance_create(64, 110, obj_actor);
            scr_actor_setup(no, no_actor, "noelle");
            no_actor.sprite_index = spr_noelle_sit;
            c_sel(su);
            c_autodepth(0);
            c_depth(29000);
            c_sel(no);
            c_autodepth(0);
            c_depth(29000);
            c_waitcustom();
        }
        if (global.tempflag[90] == 2)
        {
            global.interact = 1;
            con = 50;
            instance_create(0, 0, obj_homealone_vent_overlay);
            with (overlay)
                instance_destroy();
            with (ceiling_collider)
                instance_destroy();
            with (ceiling_right)
                instance_destroy();
            with (obj_homealone_dess_closet_controller)
                con = 1;
            with (obj_homealone_heart)
            {
                cutscene = 1;
                visible = 0;
            }
            camerax_set(20);
            cameray_set(-20);
            with (guitar_marker)
                visible = 0;
            with (convo_controller)
                instance_destroy();
            with (hockey_throw)
                create_puck(208, 130, 79988);
            scr_losechar();
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            su = actor_count + 1;
            su_actor = instance_create(45, 112, obj_actor);
            scr_actor_setup(su, su_actor, "susie");
            su_actor.sprite_index = spr_susie_sit_normal;
            no = actor_count + 2;
            no_actor = instance_create(64, 110, obj_actor);
            scr_actor_setup(no, no_actor, "noelle");
            no_actor.sprite_index = spr_noelle_sit;
            c_sel(su);
            c_autodepth(0);
            c_depth(29000);
            c_sel(no);
            c_autodepth(0);
            c_depth(29000);
            c_waitcustom();
        }
    }
    init_heart = true;
}
if (con == 0)
{
    if (obj_homealone_heart.x >= 190 && obj_homealone_heart.x < 240 && obj_homealone_heart.y > 80 && obj_homealone_heart.y < 140)
    {
        kris_bed_hide = true;
        with (obj_homealone_heart)
            cutscene = 1;
    }
}
if (kris_bed_hide)
{
    if (kris_bed_con == 0)
    {
        kris_bed_con = 1;
        snd_play(snd_grab);
        with (hockey_throw)
        {
            visible = 1;
            throw_choco = true;
        }
        with (obj_homealone_vent_overlay)
            circle_radius = 1;
    }
    if (hit_heart)
    {
        heart_fall_timer++;
        if (heart_fall_timer == 1)
        {
            global.interact = 1;
            instance_create(0, 0, obj_homealone_vent_overlay);
            with (overlay)
                instance_destroy();
            with (ceiling_collider)
                instance_destroy();
            with (ceiling_right)
                instance_destroy();
            heart_fall_ypos = obj_homealone_heart.y;
            with (obj_homealone_heart)
            {
                cutscene = 1;
                image_angle += 45;
                scr_shakeobj();
            }
        }
        if (heart_fall_timer == 2)
        {
            with (obj_homealone_heart)
                scr_jump_to_point(198, 123, 12, 12);
        }
        if (heart_fall_timer == 14)
        {
            snd_play(snd_susie_strum_mistake);
            snd_play(snd_bump);
        }
        if (heart_fall_timer == 60)
        {
            hit_heart = false;
            anim_player.init(kris_bed_marker, 3096, kris_bed_timestamps);
            anim_player.event_connect("anim_end", kris_get_heart);
            anim_player.start();
        }
    }
}
if (con == 1)
{
    con = 10;
    scr_losechar();
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    su = actor_count + 1;
    su_actor = instance_create(132, 260, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = spr_susie_walk_up_lw;
    no = actor_count + 2;
    no_actor = instance_create(133, 260, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = spr_noelle_walk_up_lw;
    with (obj_homealone_heart)
        depth = 81000;
    c_var_instance(kris_marker, "x", 57);
    c_var_instance(kris_marker, "y", 112);
    c_var_instance(kris_marker, "visible", 1);
    c_var_instance(kris_marker, "depth", hockey_throw.depth - 10);
    c_var_instance(kris_marker, "sprite_index", spr_dkris_dr);
    c_var_instance(kris_bed_marker, "visible", 0);
    c_wait(12);
    c_var_instance(kris_marker, "image_speed", 0.2);
    c_var_lerp_to_instance(kris_marker, "y", 132, 12);
    c_var_lerp_to_instance(kris_marker, "x", 72, 12);
    c_wait(12);
    c_var_lerp_to_instance(kris_marker, "x", 172, 24);
    c_wait(24);
    c_snd_play(snd_jump);
    c_var_instance(kris_marker, "image_index", 0);
    c_var_instance(kris_marker, "sprite_index", spr_kris_leap_loop);
    c_var_instance(kris_marker, "image_speed", 0.2);
    c_var_instance(kris_marker, "vspeed", -10);
    c_var_instance(kris_marker, "hspeed", 1);
    c_var_instance(kris_marker, "gravity", 1);
    c_wait(14);
    c_var_instance(kris_marker, "vspeed", 0);
    c_var_instance(kris_marker, "hspeed", 0);
    c_var_instance(kris_marker, "gravity", 0);
    c_var_instance(kris_marker, "sprite_index", spr_kris_leap_land);
    c_var_instance(kris_marker, "image_speed", 0);
    c_var_instance(kris_marker, "image_index", 0);
    c_var_instance(kris_marker, "x", 180);
    c_var_instance(kris_marker, "y", 97);
    c_var_instance(kris_marker, "image_index", 1);
    c_shakeobj();
    c_wait(2);
    c_var_instance(kris_marker, "image_index", 2);
    c_var_instance(568, "visible", 0);
    c_wait(2);
    c_var_instance(kris_marker, "x", 172);
    c_var_instance(kris_marker, "y", 88);
    c_var_instance(kris_marker, "sprite_index", spr_kris_guitar_soul_pickup);
    c_var_instance(kris_marker, "image_index", 0);
    c_var_instance(guitar_marker, "visible", 0);
    c_wait(2);
    c_var_lerp_to_instance(kris_marker, "image_index", 7, 16);
    c_wait(4);
    c_snd_play(snd_bump);
    c_wait(45);
    c_var_instance(kris_marker, "sprite_index", spr_kris_guitar_soul_lookback);
    c_var_instance(kris_marker, "image_index", 1);
    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgsetloc(0, "* D..^1. did you just hear that? It sounded like a guitar.../%", "obj_noellehouse_dess_slash_Step_0_gml_437_0");
    c_talk_wait();
    if (scr_flag_get(1579) > 0)
    {
        c_wait(5);
        c_speaker("susie");
        c_fefc(0, 0);
        c_msgsetloc(0, "* Huh? It's probably just Kris^1, like the other stuff.../%", "obj_noellehouse_dess_slash_Step_0_gml_447_0");
        c_talk_wait();
    }
    c_wait(15);
    c_var_instance(kris_marker, "image_index", 0);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Oh hell. Dude^1, it's GONE^1! The angel fell over!/", "obj_noellehouse_dess_slash_Step_0_gml_458_0");
    c_msgnextloc("* That thing could be anywhere!/%", "obj_noellehouse_dess_slash_Step_0_gml_459_0");
    c_talk_wait();
    c_wait(15);
    c_var_instance(kris_marker, "image_index", 1);
    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgsetloc(0, "* It had to have been coming from.../", "obj_noellehouse_dess_slash_Step_0_gml_467_0");
    c_msgnextloc("* ..^1. um^1, in here^1, but.../%", "obj_noellehouse_dess_slash_Step_0_gml_468_0");
    c_talk_wait();
    c_wait(15);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Hey^1, let's go!/%", "obj_noellehouse_dess_slash_Step_0_gml_475_0");
    c_talk_wait();
    c_var_instance(kris_marker, "image_index", 0);
    c_var_instance(kris_marker, "image_speed", 0.2);
    c_var_instance(kris_marker, "sprite_index", spr_kris_guitar_soul_walk);
    c_var_lerp_to_instance(kris_marker, "x", 190, 6);
    c_var_lerp_to_instance(kris_marker, "y", 88, 6);
    c_wait(6);
    c_var_instance(kris_marker, "image_index", 0);
    c_var_instance(kris_marker, "image_speed", 0);
    c_var_instance(kris_marker, "depth", 5200);
    c_wait(6);
    c_var_instance(191, "dess_closet_cover", true);
    c_var_instance(850, "con", 1);
    c_snd_play(snd_wing);
    c_var_instance(850, "open_closet", true);
    c_wait(6);
    c_var_instance(191, "dess_closet_cover", false);
    c_var_instance(kris_marker, "image_speed", 0.2);
    c_var_lerp_to_instance(kris_marker, "y", 80, 6);
    c_wait(6);
    c_var_instance(kris_marker, "image_index", 0);
    c_var_instance(kris_marker, "image_speed", 0);
    c_var_instance(310, "kris_sprite", 3534);
    c_var_instance(310, "kris_x", 190);
    c_var_instance(310, "kris_y", 80);
    c_var_instance(310, "kris_active", true);
    c_var_instance(kris_marker, "visible", 0);
    c_snd_play(snd_wing);
    c_var_instance(850, "close_closet", true);
    c_wait(4);
    c_snd_play(snd_dooropen);
    c_sel(no);
    c_autodepth(0);
    c_depth(29000);
    c_walkdirect(no_actor.x, 173, 30);
    c_delaywalkdirect(31, 147, 111, 20);
    c_wait(15);
    c_snd_play(snd_doorclose);
    c_sel(su);
    c_autodepth(0);
    c_depth(29000);
    c_walkdirect_wait(su_actor.x, 175, 30);
    c_walkdirect_wait(115, 114, 20);
    c_wait(30);
    c_sel(no);
    c_facing("r");
    c_wait(30);
    c_facing("u");
    c_wait(15);
    c_msgside("bottom");
    c_speaker("noelle");
    c_msgsetloc(0, "\\E1* Hmm..^1. it's quiet./", "obj_noellehouse_dess_slash_Step_0_gml_540_0");
    c_facenext("susie", "L");
    c_msgnextloc("\\EL* Yeah^1, well^1, it's probably scared of us./%", "obj_noellehouse_dess_slash_Step_0_gml_542_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch);
    c_imagespeed(0.2);
    c_addxy(-2, -1);
    c_wait_talk();
    c_sel(su);
    c_autowalk(1);
    c_imagespeed(0);
    c_facing("u");
    c_addxy(2, 1);
    c_wait(5);
    c_sel(no);
    c_sprite(spr_noelle_walk_left_lw_neutral);
    c_sel(su);
    c_walkdirect_wait(45, 110, 30);
    c_autowalk(0);
    c_imagespeed(0);
    c_imageindex(0);
    c_wait(5);
    c_sel(no);
    c_sprite(spr_noelle_surprise_left);
    c_emote("!", 30);
    c_sel(su);
    c_snd_play(snd_wing);
    c_sprite(spr_susie_sit_normal);
    c_shakeobj();
    c_setxy(40, 112);
    c_wait(30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EB* Susie..^1. t-touching that..^1. isn't.../", "obj_noellehouse_dess_slash_Step_0_gml_592_0");
    c_facenext("susie", 10);
    c_msgnextloc("\\EA* Let's just chill out. If it's gonna come out^1, we'll hear it./%", "obj_noellehouse_dess_slash_Step_0_gml_594_0");
    c_talk_wait();
    c_sel(no);
    c_autowalk(0);
    c_sprite(spr_noelle_walk_left_lw_neutral);
    c_sel(no);
    c_emote("...", 30);
    c_wait(30);
    c_imagespeed(0.2);
    c_walkdirect_wait(120, 111, 60);
    c_halt();
    c_sprite(spr_noelle_walk_left_lw_neutral);
    c_wait(30);
    c_imagespeed(0.2);
    c_walkdirect_wait(80, 111, 40);
    c_halt();
    c_sprite(spr_noelle_walk_left_awkward);
    c_wait(30);
    c_autowalk(1);
    c_sprite(spr_noelle_walk_left_lw);
    c_sel(no);
    c_autodepth(0);
    c_depth(28000);
    c_walkdirect_wait(64, 111, 12);
    c_autowalk(0);
    c_imagespeed(0);
    c_imageindex(0);
    c_facing("d");
    c_wait(5);
    c_snd_play(snd_wing);
    c_sprite(spr_noelle_sit);
    c_setxy(64, 110);
    c_shakeobj();
    c_wait(15);
    c_msgside("bottom");
    c_speaker("noelle");
    c_msgsetloc(0, "\\E6* Yeah..^1. you're right. We'll know it's there if it \\cRmakes noise\\cW./%", "obj_noellehouse_dess_slash_Step_0_gml_637_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 10 && customcon == 1)
{
    con = 11;
    with (obj_homealone_dess_closet_controller)
        closet_fadein = true;
    with (obj_homealone_vent_overlay)
    {
        scr_delay_var("dess_closet_fade_in", true, 30);
        scr_delay_var("dess_room_alpha_target", 0, 30);
    }
}
if (con == 11)
{
    var convo_ready = false;
    with (obj_homealone_dess_closet_kris)
    {
        if (kris_ready == 2)
            convo_ready = true;
    }
    if (convo_ready)
    {
        con = 12;
        scr_delay_var("con", 15, 30);
    }
}
if (con == 15)
{
    con = 16;
    with (convo_controller)
        start_convo();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 51;
    customcon = 0;
    var kris_closet_x = 224;
    wall_marker = scr_marker(241, 46, bg_noellehouse_dess_wall);
    with (wall_marker)
        depth = 6000;
    with (obj_homealone_vent_overlay)
    {
        dess_closet_alpha = 0.5;
        dess_closet_alpha_target = 0.5;
    }
    with (obj_noellehouse_dess_closet)
    {
        door_alpha = 1;
        door_xpos = door_base_xpos;
        kris_active = true;
        kris_sprite = spr_kris_guitar_soul_put_away;
        kris_index = 5;
        kris_x = 203;
        kris_y = 80;
    }
    with (obj_homealone_heart)
    {
        cutscene = 1;
        visible = 0;
    }
    c_waitcustom_end();
    c_snd_play(snd_impact);
    c_snd_play(snd_hurt1);
    c_snd_play(snd_guitar_hit_01);
    c_shake();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_noelle_cling_jump);
    c_imageindex(0);
    c_addxy(0, -4);
    c_jump_in_place(8, 9);
    c_sel(no);
    c_visible(0);
    c_wait(9);
    c_sel(su);
    c_sprite(spr_susie_noelle_cling);
    c_shakeobj();
    c_wait(60);
    c_snd_play(snd_guitar_hit_03);
    c_snd_play(snd_impact);
    c_snd_play(snd_hurt1);
    c_shake();
    c_wait(30);
    c_snd_play(snd_guitar_hit_01);
    c_snd_play(snd_impact);
    c_snd_play(snd_hurt1);
    c_shake();
    c_wait(15);
    c_snd_play(snd_guitar_hit_03);
    c_snd_play(snd_impact);
    c_snd_play(snd_hurt1);
    c_shake();
    c_sel(su);
    c_imageindex(1);
    c_wait(8);
    c_snd_play(snd_guitar_hit_02);
    c_snd_play(snd_impact);
    c_snd_play(snd_hurt1);
    c_shake();
    c_wait(30);
    c_snd_play(snd_guitar_hit_01);
    c_snd_play(snd_impact);
    c_snd_play(snd_hurt1);
    c_shake();
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_sit_arms_crossed_tsun_look_left);
    c_addxy(0, 4);
    c_halt();
    c_sel(no);
    c_visible(1);
    c_autodepth(0);
    c_depth(29000);
    c_autowalk(0);
    c_sprite(spr_noelle_sit_expressions);
    c_addxy(5, 0);
    c_imageindex(6);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. wait a sec./%", "obj_noellehouse_dess_slash_Step_0_gml_850_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_autodepth(0);
    c_depth(28000);
    c_sprite(spr_susie_walk_down_lw_unhappy);
    c_halt();
    c_snd_play(snd_noise);
    c_walkdirect_wait(45, 114, 4);
    c_imageindex(0);
    c_shakeobj();
    c_wait(15);
    c_sel(no);
    c_imageindex(7);
    c_delaycmd(20, "imageindex", 8);
    c_pan(0, 0, 60);
    c_sel(su);
    c_autowalk(1);
    c_facing("susieunhappy");
    c_walkdirect_wait(188, 114, 40);
    c_walkdirect_wait(188, 82, 20);
    c_autowalk(1);
    c_facing("u");
    c_wait(30);
    c_snd_play(snd_wing);
    c_var_instance(310, "kris_sprite", 3820);
    c_var_instance(310, "kris_x", 213);
    c_var_instance(310, "kris_y", 89);
    c_var_instance(310, "open_door", true);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* (Dude^1, stop making so much goddamn noise!)/", "obj_noellehouse_dess_slash_Step_0_gml_892_0");
    c_msgnextloc("\\E5* (You're supposed to be searching for clues^1, dumbass!)/%", "obj_noellehouse_dess_slash_Step_0_gml_893_0");
    c_talk_wait();
    c_snd_play(snd_grab);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_guitar_grab_up);
    c_lerp_var_instance(su_actor, "image_index", 0, 4, 16);
    c_wait(8);
    c_var_instance(310, "kris_sprite", 4635);
    c_var_instance(310, "kris_index", 0);
    c_wait(45);
    c_snd_play(snd_wing);
    c_var_instance(310, "close_door", true);
    c_wait(15);
    c_sel(no);
    c_autowalk(0);
    c_delaycmd(60, "sprite", spr_noelle_sit_surprise_down);
    c_delaycmd(60, "imageindex", 0);
    c_delaycmd(64, "imageindex", 1);
    c_sel(su);
    c_autodepth(0);
    c_depth(no_actor.depth - 10);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_walk_down_lw_guitar);
    c_walkdirect_wait(188, 147, 30);
    c_sprite(spr_susie_walk_left_lw_guitar);
    c_walkdirect_wait(69, 147, 50);
    c_sprite(spr_susie_walk_up_lw_guitar);
    c_halt();
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Hey^1, uh..^1. sorry about that^1, I.../", "obj_noellehouse_dess_slash_Step_0_gml_936_0");
    c_facenext("noelle", "B");
    c_msgnextloc("\\EB* S-Susie...? That guitar^1, you..^1. you're.../%", "obj_noellehouse_dess_slash_Step_0_gml_938_0");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_walk_right_lw_guitar);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Huh...? Uhh^1, should I^1, uh^1, put it back...?/", "obj_noellehouse_dess_slash_Step_0_gml_947_0");
    c_facenext("noelle", "F");
    c_msgnextloc("\\EF* Ummm..^1. well.../%", "obj_noellehouse_dess_slash_Step_0_gml_949_0");
    c_talk();
    c_wait_box(2);
    c_sel(no);
    c_sprite(spr_noelle_sit_expressions);
    c_imageindex(8);
    c_wait_talk();
    c_wait(30);
    c_imageindex(4);
    c_wait(30);
    c_sel(no);
    c_imageindex(5);
    c_wait(60);
    c_sel(no);
    c_imageindex(7);
    c_sel(su);
    c_sprite(spr_susie_walk_up_lw_guitar);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E9* No..^1. No^1, it's..^1. I think you should play it./", "obj_noellehouse_dess_slash_Step_0_gml_976_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* Me...? Uhh^1, sure. Sure^1, I can give it a shot./", "obj_noellehouse_dess_slash_Step_0_gml_978_0");
    c_msgnextloc("\\EK* Let's uh^1, just go somewhere else though./", "obj_noellehouse_dess_slash_Step_0_gml_979_0");
    c_facenext("noelle", 27);
    c_msgnextloc("\\ER* Umm^1, okay!/%", "obj_noellehouse_dess_slash_Step_0_gml_981_0");
    c_talk_wait();
    c_sel(no);
    c_sprite(spr_noelle_walk_down_lw);
    c_walkdirect_wait(60, 112, 6);
    c_shakeobj();
    c_snd_play(snd_noise);
    c_wait(15);
    c_sel(no);
    c_autowalk(1);
    c_walkdirect(132, 112, 30);
    c_delaywalkdirect(31, 132, 240, 30);
    c_wait(15);
    c_sel(su);
    c_facing("r");
    c_wait(15);
    c_imagespeed(0.2);
    c_sprite(spr_susie_walk_right_lw_guitar);
    c_walkdirect_wait(134, 147, 30);
    c_sprite(spr_susie_walk_down_lw_guitar);
    c_walkdirect(134, 240, 30);
    c_wait(10);
    c_snd_play(snd_dooropen);
    c_wait(24);
    c_snd_play(snd_doorclose);
    c_wait(60);
    c_sel(no);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_customfunc(function()
    {
        var black_cover = scr_marker(0, room_height, spr_pixel_white);
        with (black_cover)
        {
            image_blend = c_black;
            image_xscale = 100;
            image_yscale = 40;
        }
    });
    c_snd_play(snd_noise);
    c_var_instance(310, "kris_x", kris_closet_x);
    c_var_instance(310, "kris_y", 80);
    c_var_instance(310, "kris_sprite", 1460);
    c_var_lerp_to_instance(310, "door_xpos", obj_noellehouse_dess_closet.door_xpos - 14, 15);
    c_wait(30);
    c_var_instance(kris_marker, "x", kris_closet_x);
    c_var_instance(kris_marker, "y", 80);
    c_var_instance(kris_marker, "sprite_index", spr_kris_walk_hide_arm);
    c_var_instance(kris_marker, "visible", 1);
    c_var_instance(kris_marker, "depth", 29000);
    c_var_instance(310, "kris_active", false);
    c_var_instance(kris_marker, "image_speed", 0.2);
    c_var_lerp_to_instance(kris_marker, "x", kris_closet_x - 10, 15);
    c_wait(15);
    c_var_instance(kris_marker, "image_speed", 0);
    c_sel(kr);
    c_autodepth(0);
    c_autowalk(0);
    c_depth(29000);
    c_sprite(spr_kris_walk_hide_arm);
    c_setxy(kris_closet_x - 10, 80);
    c_visible(1);
    c_var_instance(kris_marker, "visible", 0);
    c_wait(30);
    c_autowalk(0);
    c_sprite(spr_kris_phone_take_out);
    c_halt();
    c_var_lerp_instance(kr_actor, "image_index", 0, 6, 16);
    c_wait(30);
    c_sprite(spr_kris_soul_phone_dial);
    c_halt();
    c_imagespeed(0.2);
    c_wait(30);
    c_imagespeed(0);
    c_sprite(spr_kris_soul_phone_up);
    c_halt();
    c_var_lerp_instance(kr_actor, "image_index", 0, 3, 8);
    c_wait(8);
    c_var_instance(phone_speech, "start_speech", true);
    c_wait(120);
    c_wait_if(phone_speech, "speech_active", "=", false);
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_kris_phone_take_out);
    c_halt();
    c_var_lerp_instance(kr_actor, "image_index", 6, 0, 30);
    c_wait(45);
    c_sel(kr);
    c_sprite(spr_kris_soul_walk_side);
    c_halt();
    c_delaycmd(7, "imageindex", 1);
    c_delaycmd(14, "imageindex", 0);
    c_delaycmd(21, "imageindex", 1);
    c_delaycmd(28, "imageindex", 0);
    c_walkdirect(202, 80, 30);
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(310, "door_xpos", obj_noellehouse_dess_closet.door_xpos - 14 - 10, 30);
    c_wait(90);
    c_waitcustom();
}
if (con == 51 && !d_ex() && customcon == 1)
{
    con = 52;
    anim_player.reset();
    anim_player.init(kr_actor, 770, heart_in_timestamps);
    anim_player.event_connect("frame_change", heart_burst_event, 6);
    anim_player.event_connect("anim_end", cutscene_end);
    anim_player.start();
}
if (con == 53 && !d_ex() && customcon == 1)
{
    con = 54;
    customcon = 0;
    global.facing = 0;
    c_waitcustom_end();
    c_wait(30);
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(310, "door_xpos", obj_noellehouse_dess_closet.door_xpos + 14 + 10, 15);
    c_sel(kr);
    c_autodepth(0);
    c_depth(10000);
    c_autowalk(1);
    c_facing("d");
    c_setxy(218, 81);
    c_walk_wait("d", 1, 16);
    c_var_instance(kris_marker, "sprite_index", spr_krisd);
    c_var_instance(kris_marker, "image_index", 0);
    c_var_instance(kris_marker, "x", 218);
    c_var_instance(kris_marker, "y", 97);
    c_var_instance(kris_marker, "visible", 1);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 54 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.tempflag[90] = 0;
    global.interact = 0;
    global.plot = 67;
    kris_move = true;
    fall_trigger[0] = instance_create(110, 120, obj_trigger);
    with (fall_trigger[0])
    {
        image_xscale = 9;
        image_yscale = 2;
    }
    fall_trigger[1] = instance_create(110, 140, obj_trigger);
    with (fall_trigger[1])
    {
        image_xscale = 11;
        image_yscale = 4.1;
    }
    fall_trigger[2] = instance_create(110, 148, obj_trigger);
    with (fall_trigger[2])
    {
        image_xscale = 4;
        image_yscale = 8;
    }
    with (kris_bed_marker)
        instance_destroy();
    with (phone_speech)
        instance_destroy();
    with (obj_homealone_heart)
        instance_destroy();
    with (convo_controller)
        instance_destroy();
    with (obj_homealone_dess_closet_controller)
        clean_up();
    with (kris_marker)
        instance_destroy();
    with (hockey_throw)
        clean_up();
    with (wall_marker)
        instance_destroy();
    with (obj_mainchara)
    {
        cutscene = 0;
        freeze = 0;
    }
    with (kris_marker)
        instance_destroy();
    if (scr_flag_get(7) == 1)
        scr_flag_set(7, 0);
    with (obj_doorAny)
        doorPreset = 0;
}
