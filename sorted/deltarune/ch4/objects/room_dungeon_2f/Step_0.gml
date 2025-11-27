if (global.chapter == 2)
{
    if (obj_mainchara.x < x && global.flag[301] == 1)
    {
        global.flag[301] = 2;
        global.interact = 1;
        global.facing = 1;
        con = 1;
    }
    if (con == 1)
    {
        con = 3;
        global.facing = 1;
        with (obj_caterpillarchara)
        {
            fun = 1;
            _remsprite = sprite_index;
            sprite_index = rsprite;
            image_index = 0;
        }
        scr_smallface(0, "ralsei", 1, "mid", "bottom", stringsetloc("Aww, cute!", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_24_0"));
        scr_smallface(1, "susie", 17, "right", "bottom", stringsetloc("WE'RE DONE#TALKING TO YOU!", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_25_0"));
        global.fe = 5;
        scr_speaker("king");
        msgsetloc(0, "\\E5* .../", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_28_0");
        msgnextloc("\\M1* By the way.../", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_29_0");
        msgnextloc("\\E6\\E3* Is my son..^1. happy...?/", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_30_0");
        scr_anyface_next("susie", 0);
        msgnextloc("\\ER* Like you CARE!/", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_32_0");
        msgnextloc("\\ER* You were gonna throw him off a CLIFF!/", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_33_0");
        scr_anyface_next("king", 5);
        msgnextloc("\\E5* Ah. Your prejudice made my bluff too effective^1, I see./", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_35_0");
        msgnextloc("\\E5* ..^1. besides^1, even IF I threw him^1, he would just.../", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_36_0");
        msgnextloc("\\E0* Bounce./", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_37_0");
        msgnextloc("* My son..^1. is.../", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_38_0");
        msgnextloc("\\E8\\M0* A bouncy little pumpkin.\\f0\\f1 /%", "obj_ch2_room_dungeon_2f_slash_Step_0_gml_39_0");
        d_make();
    }
    if (con == 3)
    {
        if (!d_ex())
        {
            with (obj_caterpillarchara)
                fun = 0;
            global.interact = 0;
            con = -1;
            instance_destroy();
        }
    }
}
if (global.chapter == 4)
{
    if (con == 10 && obj_mainchara.x >= 970 && global.interact == 0)
    {
        con = 11;
        alarm[0] = 30;
        global.interact = 1;
        global.facing = 0;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        la = actor_count + 1;
        la_actor = instance_create(lancer_marker.x, lancer_marker.y, obj_actor);
        scr_actor_setup(la, la_actor, "lancer");
        la_actor.sprite_index = lancer_marker.sprite_index;
        c_sel(la);
        c_autodepth(0);
        c_depth(lancer_marker.depth);
        ki = actor_count + 2;
        ki_actor = instance_create(king_npc.x, king_npc.y, obj_actor);
        scr_actor_setup(ki, ki_actor, "king");
        ki_actor.sprite_index = king_npc.sprite_index;
        c_sel(ki);
        c_autodepth(0);
        c_depth(king_npc.depth);
        te = actor_count + 3;
        te_actor = instance_create(680, cameray() - 200, obj_actor_tenna);
        scr_actor_setup(te, te_actor, "tenna");
        te_actor.preset = 1;
        c_sel(te);
        c_autodepth(0);
        c_depth(500010);
        c_var_instance(king_npc, "visible", 0);
        c_var_instance(lancer_marker, "visible", 0);
        c_mus2("volume", 0, 30);
        c_sel(kr);
        c_walkdirect(1302, 220, 40);
        c_delayfacing(41, "u");
        c_sel(su);
        c_walkdirect(1241, 205, 40);
        c_delayfacing(41, "u");
        c_sel(ra);
        c_walkdirect(1187, 210, 40);
        c_delayfacing(41, "u");
        c_pannable(1);
        c_pan(960, 0, 40);
        c_wait(40);
        c_wait(15);
        c_customfunc(function()
        {
            with (bars_vfx)
                hide_bars();
        });
        c_var_lerp_instance(kr_actor, "image_alpha", 1, 0, 30);
        c_var_lerp_instance(su_actor, "image_alpha", 1, 0, 30);
        c_var_lerp_instance(ra_actor, "image_alpha", 1, 0, 30);
        c_wait(30);
        c_msgside("bottom");
        c_speaker("lancer");
        c_msgsetloc(0, "\\E1* Don't cry^1, papa^1! This jokester will make your belly laugh like jelly!/", "obj_room_dungeon_2f_slash_Step_0_gml_134_0");
        c_facenext("king", "0");
        c_msgnextloc("\\E0* A new court jester^1, eh...? Hm. Let us see it./%", "obj_room_dungeon_2f_slash_Step_0_gml_136_0");
        c_talk();
        c_wait_box(2);
        c_sel(ki);
        c_sprite(spr_king_sulk_left);
        c_sel(la);
        c_facing("l");
        c_wait_talk();
        c_wait(15);
        c_customfunc(function()
        {
            if (!snd_is_playing(tenna_track[1]))
            {
                tenna_track[0] = snd_init("baci_perugina.ogg");
                tenna_track[1] = mus_loop_ext(tenna_track[0], 0.7, 1);
            }
        });
        c_sel(te);
        c_autowalk(0);
        c_imagespeed(2);
        c_setxy(700, 240);
        c_wait(1);
        c_var_instance(te_actor, "preset", 18);
        c_var_instance(te_actor, "speedscale", 2);
        c_var_lerp_instance(te_actor, "x", te_actor.x, 1110, 15, 2, "out");
        c_snd_play(snd_wing);
        c_wait(30);
        c_speaker("tenna");
        c_msgsetloc(0, "* Hey^1, KINGY-DOODLE!^1! IT'S ME!!^1! THE NEW FUNNY..^1. MR. ANT TENNA!!/%", "obj_room_dungeon_2f_slash_Step_0_gml_159_0");
        c_talk_wait();
        c_var_instance(te_actor, "preset", 34);
        c_var_instance(te_actor, "speedscale", 1);
        c_var_instance(te_actor, "image_xscale", -2);
        c_var_instance(te_actor, "xscale", -2);
        c_var_instance(te_actor, "scaled_bounce", 1);
        c_speaker("tenna");
        c_msgsetloc(0, "* I can do dances!^3! Prances!^3! Practical jokes!^3! CLEAN YOUR SON'S EARS!!!/%", "obj_room_dungeon_2f_slash_Step_0_gml_170_0");
        c_talk_wait();
        c_customfunc(function()
        {
            with (te_actor)
            {
                image_speed = 0;
                wobblestate = 0;
                wobbletime = 0;
                wobbleamt = 0;
            }
        });
        c_wait(30);
        c_tenna_sprite(spr_tenna_spray);
        c_var_lerp_instance(te_actor, "x", 1110, 1170, 10, 2, "out");
        c_wait(11);
        c_var_instance(te_actor, "bounce", 1);
        c_snd_play(snd_squeaky);
        c_wait(12);
        c_var_instance(te_actor, "bounce", 1);
        c_snd_play(snd_squeaky);
        c_wait(30);
        c_var_lerp_to_instance(te_actor, "x", 1210, 30, 2, "out");
        c_wait(60);
        c_var_instance(te_actor, "bounce", 1);
        c_snd_play(snd_squeaky);
        c_wait(60);
        c_tenna_sprite(spr_tenna_point_left);
        c_sel(te);
        c_addxy(0, 15);
        c_speaker("tenna");
        c_msgsetloc(0, "* Hey^1, WHAT did the playing card say to the television!?/%", "obj_room_dungeon_2f_slash_Step_0_gml_205_0");
        c_talk_wait();
        c_wait(30);
        c_sel(ki);
        c_sprite(spr_king_sulk);
        c_sel(la);
        c_sprite(spr_lancer_ut);
        c_speaker("king");
        c_msgsetloc(0, "\\E5* Hm.../", "obj_room_dungeon_2f_slash_Step_0_gml_215_0");
        c_msgnextloc("\\E4* \"Leave.\"/%", "obj_room_dungeon_2f_slash_Step_0_gml_216_0");
        c_talk();
        c_wait_box(1);
        c_customfunc(function()
        {
            snd_free(tenna_track[0]);
        });
        c_sel(ki);
        c_sprite(spr_king_sulk_left);
        c_sel(la);
        c_sprite(spr_lancer_lt);
        c_tenna_sprite(spr_tenna_hurt);
        c_wait_talk();
        c_wait(60);
        c_tenna_sprite(spr_tenna_pose_podium);
        c_speaker("tenna");
        c_msgsetloc(0, "* Ah. He^1, uh^1, he did^1, huh!/%", "obj_room_dungeon_2f_slash_Step_0_gml_232_0");
        c_talk_wait();
        c_tenna_sprite(spr_tenna_tie_adjust_a);
        c_var_lerp_to_instance(te_actor, "x", 1170, 10, 2, "out");
        c_wait(11);
        c_speaker("tenna");
        c_msgsetloc(0, "* Haha^1, tough audience today^1, uh^1, folks!/%", "obj_room_dungeon_2f_slash_Step_0_gml_239_0");
        c_talk_wait();
        c_tenna_sprite(spr_tenna_pose_headlowered_nose);
        c_var_instance(te_actor, "image_xscale", 2);
        c_var_instance(te_actor, "xscale", 2);
        c_var_instance(te_actor, "scaled_bounce", 0);
        c_speaker("tenna");
        c_msgsetloc(0, "* Maybe I was too modern^1, too relevant.../%", "obj_room_dungeon_2f_slash_Step_0_gml_249_0");
        c_talk();
        c_wait_talk();
        c_sel(te);
        c_var_lerp_to_instance(te_actor, "x", 1110, 15, 2, "in");
        c_wait(16);
        c_snd_play(snd_bump);
        c_sprite(spr_tenna_fall_start);
        c_jump_in_place(24, 15);
        c_wait(16);
        c_sprite(spr_tenna_fallen);
        c_wait(4);
        c_imageindex(1);
        c_shakeobj();
        c_snd_play(snd_impact);
        c_wait(30);
        c_speaker("tenna");
        c_msgsetloc(0, "* Wh-whoops!!^1! I tripped!!/%", "obj_room_dungeon_2f_slash_Step_0_gml_314_0");
        c_talk_wait();
        c_wait(30);
        c_snd_play(snd_lancerlaugh);
        c_snd_play(snd_dadlaugh);
        c_sel(la);
        c_autowalk(0);
        c_sprite(spr_lancer_lt_laugh);
        c_imagespeed(0.2);
        c_sel(ki);
        c_autowalk(0);
        c_sprite(spr_king_sulk_drink_left);
        c_sel(la);
        c_addxy(0, -10);
        c_sel(ki);
        c_imageindex(0);
        c_wait(4);
        repeat (5)
        {
            c_sel(la);
            c_addxy(0, 4);
            c_sel(ki);
            c_imageindex(1);
            c_wait(4);
            c_sel(la);
            c_addxy(0, -4);
            c_sel(ki);
            c_imageindex(0);
            c_wait(4);
        }
        c_sel(la);
        c_halt();
        c_wait(15);
        c_sel(la);
        c_addxy(0, 6);
        c_autowalk(0);
        c_sprite(spr_lancer_lt);
        c_halt();
        c_sel(ki);
        c_sprite(spr_king_sulk_left);
        c_halt();
        c_wait(15);
        c_tenna_preset(12);
        c_speaker("tenna");
        c_msgsetloc(0, "* HEY!!^1! Don't laugh at my misfortune!!^1! I..!!/%", "obj_room_dungeon_2f_slash_Step_0_gml_373_0");
        c_talk_wait();
        c_wait(15);
        c_sel(te);
        c_customfunc(function()
        {
            with (te_actor)
            {
                image_speed = 0;
                wobblestate = 0;
                wobbletime = 0;
                wobbleamt = 0;
                scr_shakeobj();
            }
        });
        c_speaker("king");
        c_msgsetloc(0, "\\E4* Good work^1, son. I LIKE this one./%", "obj_room_dungeon_2f_slash_Step_0_gml_274_0");
        c_talk_wait();
        c_wait(15);
        c_tenna_preset(22);
        c_speaker("tenna");
        c_msgsetloc(0, "* A-heh^1! I mean^1, uh^1, they like me^1! They really like me!/%", "obj_room_dungeon_2f_slash_Step_0_gml_401_0");
        c_talk_wait();
        c_wait(15);
        c_tenna_preset(6);
        c_wait(30);
        c_var_lerp_to_instance(te_actor, "x", te_actor.x, 30, 2, "out");
        c_var_lerp_to_instance(la_actor, "x", camerax() - 100, 60);
        c_customfunc(function()
        {
            with (bars_vfx)
                show_bars();
        });
        c_var_lerp_instance(kr_actor, "image_alpha", 0, 1, 30);
        c_var_lerp_instance(su_actor, "image_alpha", 0, 1, 30);
        c_var_lerp_instance(ra_actor, "image_alpha", 0, 1, 30);
        c_mus2("volume", 0.7, 30);
        c_wait(61);
        c_var_instance(king_npc, "visible", 1);
        c_pannable(1);
        c_panobj(kr_actor, 20);
        c_wait(21);
        c_pannable(0);
        c_sel(kr);
        c_facing("d");
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 12 && !i_ex(obj_cutscene_master))
    {
        con = -1;
        global.interact = 0;
        global.facing = 0;
        scr_flag_set(790, 1);
    }
}
