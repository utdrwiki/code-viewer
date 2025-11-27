visible = true;
if (con >= 99)
{
    if (lcon == 0)
    {
        var leftbit = 24;
        var rightbit = 592;
        if (obj_mainchara.x < leftbit || obj_mainchara.x > rightbit)
        {
            obj_mainchara.x = clamp(obj_mainchara.x, leftbit, rightbit);
            global.interact = 1;
            lcon = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* (There is a distinct lack of steppable objects in that direction.)/%", "obj_ch4_DCA05_slash_Step_0_gml_18_0");
            d_make(undefined, undefined, undefined, 1);
        }
    }
    if (lcon == 1 && !d_ex())
    {
        lcon = 0;
        global.interact = 0;
    }
}
if (con < 0)
    exit;
if (con == 0 && global.interact == 0 && !d_ex() && obj_mainchara.x < 210)
{
    con = 1;
    global.interact = 1;
}
if (con == 1)
{
    con = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_speaker("gerson");
    c_msgsetloc(0, "* Hmm..^1. I've a mighty hankerin' to read a \\cGbook\\cW. But I just can't reach.../", "obj_ch4_DCA05_slash_Step_0_gml_49_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* Can it^1, old man. What's this look like^1, a library?/%", "obj_ch4_DCA05_slash_Step_0_gml_51_0");
    c_talk_wait();
    c_sel(su);
    c_walkdirect_speed_wait(170, su_actor.y, 6);
    c_walkdirect_speed_wait(170, 122, 6);
    c_facing("u");
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\EB* Now^1, the hell do we get this open?/%", "obj_ch4_DCA05_slash_Step_0_gml_62_0");
    c_talk_wait();
    c_actortokris();
    c_waitcustom();
}
if (con == 2 && customcon == 1 && !d_ex())
{
    con = 3;
    var sus_x = su_actor.x;
    var sus_y = su_actor.y;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            follow = 0;
            fun = 1;
            x = sus_x;
            y = sus_y;
            sprite_index = usprite;
        }
        else
        {
            visible = 1;
        }
    }
    with (ra_actor)
        instance_destroy();
    global.interact = 0;
    global.facing = 0;
    explore = true;
}
if (con == 3)
{
}
if (con == 10 && !d_ex() && customcon == 1)
{
    con = 20;
    global.interact = 1;
    with (su_actor)
        instance_destroy();
    with (door_readable)
        extflag = "door";
}
if (con == 20 && !d_ex() && customcon == 1)
{
    customcon = 0;
    c_waitcustom_end();
    scr_maincharacters_actors();
    global.facing = 0;
    bo = actor_count + 1;
    bo_actor = instance_create(camerax() - 100, cameray() - 100, obj_actor);
    scr_actor_setup(bo, bo_actor, "book");
    bo_actor.sprite_index = spr_dw_book;
    c_sel(bo);
    c_autowalk(0);
    c_visible(0);
    c_sprite(spr_dw_book);
    c_speaker("no_name");
    c_msgsetloc(0, "* (You investigated the climbable stool.)/%", "obj_ch4_DCA05_slash_Step_0_gml_151_0");
    c_talk_wait();
    c_wait(5);
    if (obj_mainchara.x >= 162)
    {
        c_sel(kr);
        c_walkdirect_speed_wait(180, 190, 4);
        c_walkdirect(64, 209, 20);
        c_delaywalkdirect(21, 64, 190, 10);
        c_delayfacing(32, "r");
    }
    else
    {
        c_sel(kr);
        c_walkdirect(64, 209, 12);
        c_delaywalkdirect(13, 64, 190, 10);
        c_delayfacing(24, "r");
    }
    c_var_instance(gerson_npc, "facing_right", false);
    c_var_instance(gerson_npc, "current_state", 0);
    c_sel(ra);
    c_walkdirect_speed_wait(138, 198, 4);
    c_walkdirect_wait(138, 178, 8);
    c_facing("l");
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 220, 16);
    c_wait(16);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait(25);
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_var_instance(gerson_npc, "facing_right", true);
    c_var_instance(gerson_npc, "facing_up", true);
    c_speaker("gerson");
    c_msgsetloc(0, "* 'Scuse me^1, miss^1, wouldja mind helpin' me reach this book?/", "obj_ch4_DCA05_slash_Step_0_gml_202_0");
    c_facenext("susie", "K");
    c_msgnextloc("\\EK* Not now^1, dude. I'm solving the door./", "obj_ch4_DCA05_slash_Step_0_gml_204_0");
    c_msgnextloc("\\E5* Ralsei^1, help him reach the thing./", "obj_ch4_DCA05_slash_Step_0_gml_205_0");
    c_facenext("ralsei", "2");
    c_msgnextloc("\\E2* Of course^1!/%", "obj_ch4_DCA05_slash_Step_0_gml_207_0");
    c_talk();
    c_wait_box(3);
    c_sel(ra);
    c_facing("u");
    c_wait_box(5);
    c_sel(ra);
    c_jump_in_place(8, 8);
    c_var_instance(gerson_npc, "facing_right", false);
    c_var_instance(gerson_npc, "facing_up", false);
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_pose);
    c_wait(5);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EH* There's something you can stand on right here!/%", "obj_ch4_DCA05_slash_Step_0_gml_230_0");
    c_talk_wait();
    c_wait(5);
    c_cmd("fadeout", 10, 16777215, 0, 0);
    c_soundplay(snd_great_shine);
    c_wait(12);
    c_sel(kr);
    c_facing("r");
    c_var_instance(gerson_npc, "facing_right", true);
    c_sel(ra);
    c_sprite(spr_ralsei_stool);
    c_setxy(352, 174);
    c_wait(10);
    c_fadein(10);
    c_wait(150);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E1* Um^1, anyone^1, um..^1. feel free to..^1. step on me./%", "obj_ch4_DCA05_slash_Step_0_gml_257_0");
    c_talk_wait();
    c_wait(60);
    c_var_instance(gerson_npc, "facing_right", true);
    c_var_instance(gerson_npc, "facing_up", true);
    c_speaker("gerson");
    c_msgsetloc(0, "* Miss^1, I think I still need your help./", "obj_ch4_DCA05_slash_Step_0_gml_267_0");
    c_facenext("susie", "H");
    c_msgnextloc("\\EH* Alright^1, FINE./%", "obj_ch4_DCA05_slash_Step_0_gml_269_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("d");
    c_wait_talk();
    c_sel(su);
    c_walkdirect_speed_wait(170, 170, 6);
    c_var_instance(gerson_npc, "facing_right", true);
    c_var_instance(gerson_npc, "facing_up", false);
    c_walkdirect_speed_wait(330, 170, 6);
    c_autowalk(0);
    c_sprite(spr_susie_reach_up);
    c_imagespeed(0.2);
    c_wait(30);
    c_halt();
    c_sprite(spr_susie_walk_up_dw);
    c_imagespeed(0.2);
    c_walk_wait("d", 4, 8);
    c_halt();
    c_wait(5);
    c_sprite(spr_susie_reach_up);
    c_jump(330, 164, 25, 12);
    c_wait(6);
    c_sound_play(snd_grab);
    c_var_instance(book_marker, "image_blend", 0);
    c_wait(6);
    c_sel(su);
    c_sprite(spr_susie_walk_up_dw);
    c_sound_play(snd_splat);
    c_sel(ra);
    c_autodepth(0);
    c_depth(97600);
    c_sprite(spr_ralsei_splat);
    c_setxy(312, 220);
    c_shakeobj();
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_wait(30);
    c_sel(bo);
    c_setxy(330, 214);
    c_stickto(su_actor, -10);
    c_visible(1);
    c_sel(su);
    c_facing("l");
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Here^1, will you take this and -/%", "obj_ch4_DCA05_slash_Step_0_gml_333_0");
    c_talk_wait();
    c_sound_play(snd_locker);
    c_shake();
    c_var_instance(door_marker, "image_index", 1);
    c_sel(su);
    c_emote("!", 30);
    c_sprite(spr_susie_surprised_left);
    c_wait(45);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey^1, the door opened^1! Let's go!/%", "obj_ch4_DCA05_slash_Step_0_gml_348_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(1);
    c_autodepth(0);
    c_depth(96000);
    c_walkdirect_speed_wait(230, 164, 6);
    c_facing("u");
    c_sel(bo);
    c_stickto_stop();
    c_autodepth(0);
    c_depth(96900);
    c_wait(5);
    c_var_instance(gerson_npc, "facing_right", false);
    c_sel(bo);
    c_walkdirect(232, 160, 8);
    c_wait(6);
    c_sound_play(snd_bump);
    c_wait(15);
    c_sel(su);
    c_walkdirect_speed_wait(173, 164, 6);
    c_walkdirect(173, 108, 20);
    c_wait(15);
    c_var_instance(id, "susie_hide", true);
    c_wait(15);
    c_visible(0);
    c_wait(30);
    c_var_instance(gerson_npc, "current_state", 6);
    c_speaker("gerson");
    c_msgsetloc(0, "* Much obliged./%", "obj_ch4_DCA05_slash_Step_0_gml_388_0");
    c_talk_wait();
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 9);
    c_var_instance(gerson_npc, "facing_up", true);
    c_sel(bo);
    c_walk_wait("u", 4, 4);
    c_autodepth(0);
    c_depth(99900);
    c_walk_wait("d", 4, 4);
    c_visible(0);
    c_sound_play(snd_item);
    c_wait(30);
    c_var_instance(gerson_npc, "facing_up", false);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 164, 15);
    c_wait(15);
    c_var_instance(gerson_npc, "facing_up", true);
    c_var_instance(gerson_npc, "facing_right", true);
    c_var_lerp_to_instance(gerson_npc, "y", 110, 40);
    c_wait(30);
    c_var_instance(gerson_npc, "enter_door", true);
    c_wait(20);
    c_var_instance(gerson_npc, "visible", 0);
    c_var_instance(ralsei_marker, "x", 312);
    c_var_instance(ralsei_marker, "y", 220);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_terminatekillactors();
}
if (con == 20 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 145;
    with (obj_caterpillarchara)
    {
        follow = 0;
        fun = 1;
        if (name == "susie")
            visible = 0;
        if (name == "ralsei")
        {
            sprite_index = spr_ralsei_splat;
            x = 312;
            y = 220;
            visible = 1;
            ignoredepth = 1;
            depth = 98000;
        }
    }
    ralsei_marker.visible = 0;
    with (obj_actor)
        instance_destroy();
    with (door_readable)
        instance_destroy();
    with (door_collider)
        instance_destroy();
    with (book_readable)
        instance_destroy();
    with (gerson_npc)
        instance_destroy();
    var ralsei_readable = instance_create(322, 242, obj_readable_room1);
    with (ralsei_readable)
    {
        extflag = "ralsei";
        image_xscale = 4;
    }
    ralsei_splat_fx = true;
    con = 99;
}
if (ralsei_splat_fx)
{
    var offset = (obj_mainchara.x < 325) ? 0 : 5;
    var play_sound = -1;
    if (point_in_rectangle(obj_mainchara.x + sprite_get_width(obj_mainchara.sprite_index), obj_mainchara.y + (sprite_get_height(obj_mainchara.sprite_index) * 2) + offset, ralsei_marker.x, ralsei_marker.y, ralsei_marker.x + (sprite_get_width(ralsei_marker.sprite_index) * 2), ralsei_marker.y + (sprite_get_height(ralsei_marker.sprite_index) * 2)))
    {
        if (!ralsei_splat_toggle)
        {
            ralsei_splat_toggle = true;
            play_sound = 1;
        }
    }
    else if (ralsei_splat_toggle)
    {
        ralsei_splat_toggle = false;
        play_sound = 2;
    }
    if (play_sound > 0)
    {
        var splat_audio = (play_sound == 1) ? 115 : 22;
        snd_play(splat_audio);
    }
}
if (kris_splat && !d_ex())
{
    if (global.interact == 0)
        global.interact = 1;
    kris_splat_timer++;
    if (kris_splat_timer == 1)
    {
        global.interact = 1;
        with (obj_mainchara)
        {
            fun = 1;
            cutscene = 1;
            sprite_index = spr_krisd_dark;
            image_speed = 0.2;
            scr_move_to_point_over_time(obj_mainchara.x, 215, 10);
        }
    }
    if (kris_splat_timer == 11)
    {
        with (obj_mainchara)
        {
            sprite_index = (global.facing == 3) ? spr_krisl_dark : spr_krisr_dark;
            var distance = distance_to_point(312, 220);
            var max_speed = clamp(distance / 10, 10, 20);
            scr_move_to_point_over_time(346, 215, max_speed);
        }
    }
    if (kris_splat_timer == 26)
    {
        with (obj_mainchara)
        {
            sprite_index = spr_krisr_dark;
            image_speed = 0;
            scr_jump_to_point(397, 218, 15, 8);
        }
    }
    if (kris_splat_timer == 34)
    {
        sound_play(snd_splat);
        with (obj_mainchara)
        {
            sprite_index = spr_kris_splat;
            scr_shakeobj();
        }
    }
    if (kris_splat_timer >= 60)
    {
        if (sunkus_kb_check_pressed(1) || scr_gamepad_check_any())
        {
            if (scr_flag_get(834) == 0)
                scr_flag_set(834, 1);
            global.interact = 0;
            global.facing = 0;
            with (obj_mainchara)
            {
                fun = 0;
                cutscene = 0;
            }
            kris_splat = false;
            kris_splat_timer = 0;
        }
    }
}
if (susie_hide)
{
    susie_shadow = clamp(susie_shadow + 0.2, 0, 1);
    var shadow = susie_shadow;
    with (su_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (susie_shadow >= 1)
        susie_hide = false;
}
if (!explore)
    exit;
if (con == 3)
{
    if (explore_con == 0)
    {
        if (!d_ex())
        {
            var susie_stop = false;
            var kris_x = obj_mainchara.x;
            var stop_ralsei = obj_mainchara.x < 40 || obj_mainchara.x > 560;
            if (!ralsei_pause_follow && stop_ralsei)
            {
                ralsei_pause_follow = true;
                with (obj_caterpillarchara)
                {
                    if (name == "ralsei")
                    {
                        if (follow == 1)
                            follow = 0;
                    }
                }
            }
            if (obj_mainchara.x < 20)
            {
                susie_stop = true;
                kris_x = 20;
            }
            if (obj_mainchara.x > 570)
            {
                susie_stop = true;
                kris_x = 570;
            }
            if (susie_stop)
            {
                explore_con = 1;
                global.interact = 1;
                with (obj_mainchara)
                    x = kris_x;
                global.facing = 3;
                scr_speaker("susie");
                msgsetloc(0, "\\E5* (Hey^1, if I don't get to skip the puzzle^1, you don't either!)/%", "obj_ch4_DCA05_slash_Step_0_gml_655_0");
                d_make();
            }
        }
    }
    if (explore_con == 1 && !d_ex())
    {
        explore_con = 0;
        global.interact = 0;
    }
    if (ralsei_pause_follow)
    {
        if (obj_mainchara.x > 40 && obj_mainchara.x < 560)
        {
            ralsei_pause_follow = false;
            with (obj_caterpillarchara)
            {
                if (name == "ralsei")
                {
                    follow = 1;
                    scr_caterpillar_interpolate();
                }
            }
        }
    }
}
else
{
    explore = false;
}
