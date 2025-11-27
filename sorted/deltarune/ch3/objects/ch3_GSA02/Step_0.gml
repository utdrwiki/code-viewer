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
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 420, cameray() + 274, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_pose_podium;
    te_actor.preset = 0;
    c_sel(te);
    c_autodepth(0);
    c_depth(spotlight.depth - 10);
    c_var_instance(podium[0], "y", cameray() - 80);
    c_var_instance(podium[1], "y", cameray() - 80);
    c_var_instance(podium[2], "y", cameray() - 80);
    c_sel(kr);
    c_facing("d");
    c_setxy(84, 176);
    c_sel(su);
    c_facing("d");
    c_setxy(166, 160);
    c_sel(ra);
    c_facing("d");
    c_setxy(246, 164);
    c_mus2("volume", 0, 15);
    c_var_instance(gameshow_screen, "screen_alpha", 0);
    c_var_instance(gameshow_screen, "screen_state", "tv_logo");
    c_wait(90);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "* (I..^1. I'm a little nervous...)/%", "obj_ch3_GSA02_slash_Step_0_gml_59_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* (Quit messing with your ears^1! We're about to be on!)/%", "obj_ch3_GSA02_slash_Step_0_gml_65_0");
    c_talk_wait();
    c_wait(30);
    c_sound_play(snd_locker);
    c_var_instance(spotlight, "visible", 1);
    c_var_instance(te_actor, "x", 340);
    c_wait(30);
    c_sound_play(snd_drumroll);
    c_speaker("tenna");
    c_msgsetloc(0, "* Would everyone please give a warm welcome.../%", "obj_ch3_GSA02_slash_Step_0_gml_80_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_laugh_pose);
    c_sound_play(snd_wing);
    c_var_lerp_to_instance(spotlight, "x", spotlight.x + 140, 15, -1, "out");
    c_var_lerp_to_instance(te_actor, "x", 493, 15, -1, "out");
    c_wait(15);
    var star_text = (global.lang == "ja") ? 4818 : 1724;
    var y_offset = (global.lang == "ja") ? 0 : -10;
    scr_funnytext_init(0, 0, y_offset, star_text, 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* To today's \\O0&contestants!!!/%", "obj_ch3_GSA02_slash_Step_0_gml_96_0");
    c_talk_wait();
    c_sound_play(snd_locker);
    c_var_instance(spotlight, "visible", 0);
    c_var_instance(blackall, "visible", 0);
    c_var_instance(id, "border_show", true);
    c_wait(15);
    c_var_instance(id, "audience_sfx_start", true);
    c_var_instance(audience_cheer, "audience_active", true);
    c_var_instance(audience_cheer, "audience_show", true);
    c_wait(30);
    c_sel(kr);
    c_facing("r");
    c_delaycmd(3, "sprite", spr_kris_pose);
    c_delaycmd4(3, "addxy", -2, -2, 0, 0);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_addxy(2, 2);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_curtsy);
    c_imagespeed(0.2);
    c_wait_if(ra_actor, "image_index", "=", 3);
    c_imagespeed(0);
    c_wait(30);
    c_wait(15);
    c_sel(su);
    c_facing("d");
    c_addxy(-2, -2);
    c_sel(kr);
    c_facing("r");
    c_addxy(2, 2);
    c_delayfacing(3, "d");
    c_sel(ra);
    c_imageindex(2);
    c_delaycmd(4, "imageindex", 1);
    c_delayfacing(8, "d");
    c_delaycmd(8, "imageindex", 0);
    c_sel(te);
    c_tenna_preset(21);
    c_speaker("tenna");
    scr_funnytext_init(1, 0, -10, scr_84_get_sprite("spr_funnytext_names"), 0, 0);
    c_msgsetloc(0, "* Everyone^1! Please cheer their&\\O1^1!/%", "obj_ch3_GSA02_slash_Step_0_gml_152_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_point_at_screen_c);
    c_var_instance(audience_cheer, "audience_pause", true);
    c_sel(te);
    c_tenna_preset(0);
    c_var_instance(id, "audience_sfx_stop_instant", true);
    c_script_instance(id, snd_play, 60, snd_crowd_crickets);
    c_wait(60);
    c_script_instance_stop(id, snd_play);
    c_wait(30);
    c_speaker("tenna");
    c_msgsetloc(0, "* Oh^1, right./", "obj_ch3_GSA02_slash_Step_0_gml_177_0");
    c_msgnextloc("* CONTESTANTS!!!/%", "obj_ch3_GSA02_slash_Step_0_gml_178_0");
    c_talk();
    c_sel(te);
    c_tenna_sprite(spr_tenna_tie_adjust_a);
    c_wait_box(1);
    c_sel(te);
    c_tenna_preset(2);
    c_wait_talk();
    c_var_instance(audience_cheer, "audience_hide", true);
    c_var_lerp_instance(podium[0], "y", -80, podium[0].ystart, 10, 1, "out");
    c_wait(10);
    c_sound_play(snd_locker);
    c_shakeobj_instance(podium[0]);
    c_wait(5);
    c_var_lerp_instance(podium[1], "y", -80, podium[0].ystart, 10, 1, "out");
    c_wait(10);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_shakeobj();
    c_sound_play(snd_locker);
    c_shakeobj_instance(podium[1]);
    c_wait(5);
    c_var_lerp_instance(podium[2], "y", -80, podium[0].ystart, 10, 1, "out");
    c_wait(10);
    c_sel(ra);
    c_sound_play(snd_locker);
    c_sprite(spr_ralsei_shocked_right);
    c_shakeobj();
    c_shakeobj_instance(podium[2]);
    c_wait(60);
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_speaker("tenna");
    c_msgsetloc(0, "* Your \\O1 please!!^1!/%", "obj_ch3_GSA02_slash_Step_0_gml_227_0");
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_left);
    c_talk_wait();
    c_mus2("initloop", "ch3_tvtime.ogg", 0);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_sel(te);
    c_imageindex(0);
    c_var_instance(id, "name_select", true);
    c_waitcustom();
}
if (name_select && customcon == 1 && !d_ex())
{
    name_select_timer++;
    if (name_select_timer == 1)
    {
        with (obj_quiz_podium)
            nameentry = true;
    }
    if (name_select_timer >= 30)
    {
        if (!i_ex(obj_gameshow_nameentry))
        {
            name_select_timer = 0;
            name_select = false;
            con = 5;
            if (global.lang == "ja")
                global.flag[1273] = 1;
        }
    }
}
if (con == 5)
{
    con = 6;
    alarm[0] = 15;
    with (obj_tennatalkbubble)
        instance_destroy();
}
if (con == 7)
{
    con = 9;
    alarm[0] = 15;
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 11;
    customcon = 0;
    c_waitcustom_end();
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(2);
    c_speaker("tenna");
    c_msgsetloc(0, "* Alright^1! Now^1, for the introductions!!!/%", "obj_ch3_GSA02_slash_Step_0_gml_294_0");
    c_talk_wait();
    c_imageindex(3);
    c_speaker("tenna");
    c_msgsetloc(0, "* First up^1, prince-from-the-dark and three time accidental fluffiest pet contest winner!/%", "obj_ch3_GSA02_slash_Step_0_gml_301_0");
    c_talk_wait();
    c_wait_talk();
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(2);
    c_speaker("tenna");
    c_msgsetloc(0, "* RAL-sei!!!/%", "obj_ch3_GSA02_slash_Step_0_gml_312_0");
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_quiz_down);
    c_imageindex(1);
    c_wait(6);
    c_sound_play(snd_noise);
    c_imageindex(2);
    c_wait(6);
    c_imageindex(1);
    c_wait(6);
    c_facing("d");
    c_halt();
    c_sound_play(snd_coin);
    c_var_lerp_to_instance(podium[2], "screen_alpha", 1, 5);
    c_wait(5);
    if (global.lang == "en")
        c_var_instance(podium[2], "mystring", "RAL");
    else if (global.lang == "ja")
        c_var_instance(podium[2], "mystring", "ラルセ");
    c_var_lerp_to_instance(podium[2], "screen_alpha", 0, 5);
    c_wait(30);
    c_var_instance(id, "audience_sfx_start", true);
    c_var_instance(audience_cheer, "audience_show", true);
    c_var_instance(audience_cheer, "audience_pause", false);
    c_sound_play(snd_applause);
    c_wait(5);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_clap);
    c_imagespeed(0.3);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_curtsy);
    c_imagespeed(0.2);
    c_wait_if(ra_actor, "image_index", "=", 3);
    c_imagespeed(0);
    c_wait(60);
    c_facing("d");
    c_halt();
    c_var_instance(id, "audience_sfx_stop", true);
    c_var_instance(audience_cheer, "audience_hide", true);
    c_sel(su);
    c_facing("d");
    c_halt();
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(3);
    c_wait(5);
    c_speaker("tenna");
    c_msgsetloc(0, "* Next up^1, Kris's friend^1, monster maniac^1, and WHERE did you wreck those pants?/%", "obj_ch3_GSA02_slash_Step_0_gml_378_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(2);
    c_speaker("tenna");
    c_msgsetloc(0, "* SUSIE!!!/%", "obj_ch3_GSA02_slash_Step_0_gml_387_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_quiz_down);
    c_imageindex(1);
    c_wait(6);
    c_sound_play(snd_noise);
    c_imageindex(2);
    c_wait(6);
    c_imageindex(1);
    c_wait(6);
    c_facing("d");
    c_halt();
    c_sound_play(snd_coin);
    c_var_lerp_to_instance(podium[1], "screen_alpha", 1, 5);
    c_wait(5);
    if (global.lang == "en")
        c_var_instance(podium[1], "mystring", "ASS");
    else if (global.lang == "ja")
        c_var_instance(podium[1], "mystring", "クソダ");
    c_var_lerp_to_instance(podium[1], "screen_alpha", 0, 5);
    c_wait(30);
    c_var_instance(id, "audience_sfx_start", true);
    c_sound_play(snd_applause_single);
    c_sound_play(snd_suslaugh);
    c_sound_play(snd_crowd_laughter_single);
    c_var_instance(audience_cheer, "audience_show", true);
    c_sel(su);
    c_sprite(spr_susie_laugh_dw);
    c_imagespeed(0.2);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_left);
    c_shakeobj();
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EW* Susie!!^1!/%", "obj_ch3_GSA02_slash_Step_0_gml_433_0");
    c_talk_wait();
    c_var_instance(audience_cheer, "audience_hide", true);
    c_var_instance(id, "audience_sfx_stop", true);
    c_sel(te);
    c_tenna_sprite(spr_tenna_whisper);
    c_speaker("tenna");
    c_msgsetloc(0, "* Hey folks^1, looks like the censors ARE gonna kill me^1!\\M1/%", "obj_ch3_GSA02_slash_Step_0_gml_444_0");
    c_talk_wait();
    c_wait(60);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(3);
    c_sel(su);
    c_halt();
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_speaker("tenna");
    c_msgsetloc(0, "* Only on THIS show because they weren't blue enough for \"The Sblurfs\".../%", "obj_ch3_GSA02_slash_Step_0_gml_461_0");
    c_talk_wait();
    c_sel(kr);
    c_halt();
    c_facing("d");
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(2);
    var reaction_state = 0;
    var kris_name = scr_gameshowname();
    if (scr_debug())
    {
    }
    if (kris_name == "KRI")
    {
        reaction_state = 1;
    }
    else if (kris_name == "KRS")
    {
        reaction_state = 2;
    }
    else if (kris_name == "ASS" || kris_name == "PEE" || kris_name == "POO" || kris_name == "TIT" || kris_name == "BUT" || kris_name == "BUM" || kris_name == "クソダ")
    {
        reaction_state = 3;
    }
    else if (kris_name == "RAL" || kris_name == "SUS")
    {
        reaction_state = 4;
    }
    else if (kris_name == "FUC" || kris_name == "FUX" || kris_name == "FUK" || kris_name == "FCK")
    {
        reaction_state = 5;
        setname = 1;
    }
    else if (kris_name == "AAA")
    {
        reaction_state = 6;
    }
    else if (kris_name == "ウソダ")
    {
        reaction_state = 7;
    }
    else if (kris_name == "クソス")
    {
        reaction_state = 8;
    }
    else if (kris_name == "ソソソ")
    {
        reaction_state = 9;
    }
    else if (kris_name == "アソア")
    {
        reaction_state = 10;
    }
    c_speaker("tenna");
    c_msgsetloc(0, "* Kris!!!/%", "obj_ch3_GSA02_slash_Step_0_gml_514_0");
    c_talk_wait();
    c_sel(kr);
    c_halt();
    c_autowalk(0);
    c_sprite(spr_kris_quiz_down);
    c_imageindex(1);
    c_wait(6);
    c_sound_play(snd_noise);
    c_imageindex(2);
    c_wait(6);
    c_imageindex(1);
    c_wait(6);
    c_autowalk(1);
    c_facing("d");
    c_halt();
    c_sound_play(snd_coin);
    c_var_lerp_to_instance(podium[0], "screen_alpha", 1, 5);
    c_wait(5);
    c_var_instance(podium[0], "mystring", kris_name);
    c_var_lerp_to_instance(podium[0], "screen_alpha", 0, 5);
    c_wait(30);
    if (reaction_state != 5)
    {
        c_var_instance(id, "audience_sfx_start", true);
        c_sound_play(snd_applause);
        c_var_instance(audience_cheer, "audience_show", true);
    }
    switch (reaction_state)
    {
        case 1:
            c_speaker("tenna");
            c_msgsetloc(0, "* Well^1, don't \"Kri\" until the ending^1, folks!/%", "obj_ch3_GSA02_slash_Step_0_gml_556_0");
            c_talk_wait();
            break;
        case 2:
            c_speaker("tenna");
            c_msgsetloc(0, "* \"KRS\"? I told you^1! No KuRSing or the censors will kill me!/%", "obj_ch3_GSA02_slash_Step_0_gml_561_0");
            c_talk_wait();
            break;
        case 3:
            c_sound_play(snd_suslaugh);
            c_sel(su);
            c_sprite(spr_susie_laugh_dw);
            c_imagespeed(0.2);
            c_sel(ra);
            c_sprite(spr_ralsei_walk_down_blush);
            c_wait(60);
            c_speaker("susie");
            c_msgsetloc(0, "\\EY* Hahahahah^1, Kris^1, knew I could count on you!!/%", "obj_ch3_GSA02_slash_Step_0_gml_578_0");
            c_talk_wait();
            c_sel(su);
            c_facing("d");
            c_halt();
            c_sel(ra);
            c_facing("d");
            break;
        case 4:
            c_speaker("tenna");
            c_msgsetloc(0, "* Well^1, this is gonna get confusing^1, isn't it^1, folks!?/%", "obj_ch3_GSA02_slash_Step_0_gml_590_0");
            c_talk_wait();
            break;
        case 5:
            c_mus("pause");
            c_sound_play(snd_suslaugh);
            c_sel(te);
            c_sprite(spr_tenna_hurt);
            c_shakeobj();
            c_sel(su);
            c_sprite(spr_susie_laugh_dw);
            c_imagespeed(0.2);
            c_sel(ra);
            c_sprite(spr_ralsei_shocked_left);
            c_shakeobj();
            c_wait(120);
            c_sel(te);
            c_depth(blackall.depth + 10);
            c_mus2("pitch", 1.75, 0);
            c_mus("resume");
            c_var_instance(technical_difficulties, "type", 1);
            c_var_instance(technical_difficulties, "con", 0);
            c_var_instance(podium[0], "mystring", "FUN");
            c_var_instance(audience_cheer, "visible", 0);
            c_sel(su);
            c_facing("d");
            c_halt();
            c_sel(ra);
            c_facing("d");
            c_sel(te);
            c_tenna_sprite(spr_tenna_pose_podium);
            c_imageindex(2);
            c_wait(120);
            c_var_instance(technical_difficulties, "con", -1);
            c_mus2("pitch", 1, 0);
            break;
        case 6:
            c_speaker("tenna");
            c_msgsetloc(0, "* AAA!? They're already SCREAMING from DELIGHT^1, folks!!!/%", "obj_ch3_GSA02_slash_Step_0_gml_648_0");
            c_talk_wait();
            break;
        case 7:
            c_speaker("tenna");
            c_msgsetloc(0, "＊ いえ^1！　ワタクシ\n　 ウソは　申しません！/%", "obj_ch3_GSA02_slash_Step_0_gml_702_0");
            c_talk_wait();
            break;
        case 8:
            c_speaker("tenna");
            c_msgsetloc(0, "＊ なぜでしょう^1…\n　 字面から　イラ立ちが\n　 感じられる気が　いたします！/%", "obj_ch3_GSA02_slash_Step_0_gml_707_0_b");
            c_talk_wait();
            break;
        case 9:
            c_speaker("tenna");
            c_msgsetloc(0, "＊ 「ソソソ」？\n　 そんなにコソコソしないで\n　 堂々としてください！！/%", "obj_ch3_GSA02_slash_Step_0_gml_712_0");
            c_talk_wait();
            break;
        case 10:
            c_speaker("tenna");
            c_msgsetloc(0, "＊ 「アアア」に　したかったのかな^1？\n　 …勇者は　みんな　その名前が\n　 好きですねえ…^1　いいでしょう！/%", "obj_ch3_GSA02_slash_Step_0_gml_717_0");
            c_talk();
            c_var_instance(id, "aaa", 1);
            c_wait_talk();
            break;
        default:
            c_wait(30);
            c_speaker("tenna");
            c_msgsetloc(0, "* Hey^1, hopefully someday you can learn how to spell your own name^1, too!\\M1/%", "obj_ch3_GSA02_slash_Step_0_gml_647_0");
            c_talk_wait();
            c_wait(60);
            break;
    }
    if (reaction_state != 5)
    {
        c_var_instance(id, "audience_sfx_stop", true);
        c_var_instance(audience_cheer, "audience_hide", true);
    }
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_up);
    c_speaker("tenna");
    c_msgsetloc(0, "* Now that we've all been (im)properly introduced.../%", "obj_ch3_GSA02_slash_Step_0_gml_666_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_point_left);
    c_speaker("tenna");
    scr_funnytext_init(2, 0, 0, scr_84_get_sprite("spr_funnytext_board"), 0, 0);
    c_msgsetloc(0, "* MIKE^1, the \\O2^1,&please!/%", "obj_ch3_GSA02_slash_Step_0_gml_675_0");
    c_talk_wait();
    c_snd_play(snd_item);
    c_var_instance(gameshow_screen, "screen_state", "desert_board");
    c_wait(30);
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    scr_funnytext_init(3, 0, -14, scr_84_get_sprite("spr_funnytext_love"), 0, 0);
    scr_funnytext_init(4, 0, -10, scr_84_get_sprite("spr_funnytext_quizzes"), 0, 0);
    c_sel(te);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_speaker("tenna");
    c_msgsetloc(0, "* Today's \"GAME\" SHOW will be..^1. A VIRTUAL ADVENTURE through TV DESERT!/", "obj_ch3_GSA02_slash_Step_0_gml_703_0");
    c_msgnextloc("* Each of you will use our CUTTING EDGE^1, PROPRIETARY CONTROLLER PADS.../", "obj_ch3_GSA02_slash_Step_0_gml_704_0");
    c_msgnextloc("* To control FANTASY VERSIONS OF YOURSELF in a world so REAL^1, you'll forget IT'S NOT!/", "obj_ch3_GSA02_slash_Step_0_gml_705_0");
    c_msgnextloc("* On your QUEST you will fight BATTLES..^1. quiz \\O4..^1. gain POINTs.../", "obj_ch3_GSA02_slash_Step_0_gml_706_0");
    c_msgnextloc("* And maybe learn to \\O3 each other a little along the way./%", "obj_ch3_GSA02_slash_Step_0_gml_707_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(2);
    c_snd_play(snd_item);
    c_var_instance(gameshow_screen, "screen_state", "game_controller");
    c_wait_box(2);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(0);
    c_snd_play(snd_item);
    c_var_instance(gameshow_screen, "screen_state", "desert_board");
    c_wait_box(3);
    c_imageindex(1);
    c_wait_box(4);
    c_tenna_sprite(spr_tenna_whisper_blush);
    c_wait_talk();
    c_wait(15);
    c_tenna_preset(2);
    c_speaker("tenna");
    c_msgsetloc(0, "* Now^1, don't TOUCH THAT DIAL^1, and don't STOP THOSE SMILES!^1! Because.../%", "obj_ch3_GSA02_slash_Step_0_gml_746_0");
    c_talk_wait();
    c_mus("free_all");
    c_sel(kr);
    c_sprite(spr_kris_pose);
    c_addxy(-2, -2);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_addxy(2, 2);
    c_sel(ra);
    c_sprite(spr_ralsei_pose);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_tenna_preset(0);
    c_var_instance(tv_time, "show_text", true);
    c_wait(10);
    c_wait_if(tv_time, "is_active", "=", false);
    c_var_instance(id, "screen_wipe_start", true);
    c_var_instance(audience_cheer, "audience_active", false);
    c_wait(100);
    c_mus("free_all");
    c_terminatekillactors();
}
if (screen_wipe_start)
{
    screen_wipe_start = false;
    global.plot = 80;
    global.flag[1274] = global.flag[1012];
    global.flag[1275] = global.flag[1013];
    global.flag[1276] = global.flag[1014];
    con = 99;
    with (obj_border_controller)
        hide_border(0.5);
    if (i_ex(obj_ch3_screen_wipe))
    {
        with (obj_ch3_screen_wipe)
            instance_destroy();
    }
    var screen_wipe = instance_create(0, 0, obj_ch3_screen_wipe);
    screen_wipe.start = true;
}
if (global.flag[20] == 1)
    laugh_track = true;
if (laugh_track)
{
    laugh_track_timer++;
    if (laugh_track_timer == 1)
        snd_play(snd_crowd_laughter_single);
    if (laugh_track_timer >= 30 && !d_ex())
    {
        laugh_track = false;
        laugh_track_timer = 0;
        global.flag[20] = 0;
    }
}
if (setname == 1)
{
    setname = 0;
    global.flag[1012] = 5;
    global.flag[1013] = 20;
    global.flag[1014] = 13;
    debug_print(scr_gameshowname());
}
if (audience_sfx_start)
{
    audience_sfx_start = false;
    audience_sfx[1] = mus_loop_ext(audience_sfx[0], 1, 1);
}
if (audience_sfx_stop)
{
    audience_sfx_stop = false;
    snd_volume(audience_sfx[1], 0, 30);
}
if (audience_sfx_stop_instant)
{
    audience_sfx_stop_instant = false;
    snd_stop(audience_sfx[1]);
}
if (border_show)
{
    border_show = false;
    with (obj_border_controller)
        show_border();
}
if (border_white_start)
{
    border_white_start = false;
    with (obj_border_controller)
        hide_border(1, c_white);
}
if (border_white_stop)
{
    border_white_stop = false;
    with (obj_border_controller)
        set_border(border_dw_blue_stars, 1);
}
if (aaa == 1)
{
    aaatimer++;
    if (button3_h())
        aaatimer += 5;
    if (aaatimer >= 30)
    {
        aaa = 2;
        var str = scr_ja_alphanumericarray_check("ア");
        global.flag[1012] = str;
        global.flag[1013] = str;
        global.flag[1014] = str;
        with (obj_quiz_podium)
        {
            if (name == "kris")
            {
                snd_play(snd_coin);
                scr_lerpvar("screen_alpha", 0, 1, 5);
                scr_script_delayed(scr_lerpvar, 6, "screen_alpha", 1, 0, 5);
                scr_var_delayed("mystring", "アアア", 5);
            }
        }
    }
}
