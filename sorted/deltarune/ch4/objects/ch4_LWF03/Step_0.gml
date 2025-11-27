if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    scr_flag_set(778, 1);
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    su = actor_count + 1;
    su_actor = instance_create(630, 129, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = spr_susie_walk_left_lw_unhappy;
    to = actor_count + 2;
    to_actor = instance_create(494, 121, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = spr_toriel_rt;
    sa = actor_count + 3;
    sa_actor = instance_create(460, 142, obj_actor);
    scr_actor_setup(sa, sa_actor, "sans");
    sa_actor.sprite_index = spr_sans_d;
    c_sel(kr);
    c_setxy(615, 130);
    c_facing("l");
    c_sel(to);
    c_visible(0);
    c_sel(sa);
    c_autowalk(0);
    c_sprite(spr_toriel_sans_dance_loop);
    c_imagespeed(0.25);
    c_pannable(1);
    c_pan(560, 0, 1);
    c_wait(1);
    c_pan(530, 0, 15);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_wait(30);
    c_var_instance(door_marker, "visible", 1);
    c_soundplay(snd_dooropen);
    c_msgzurasu(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* So^1, uh..^1. do you mind if I.../%", "obj_ch4_LWF03_slash_Step_0_gml_71_0");
    c_talk();
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_walk_left_facedown);
    c_imagespeed(0.25);
    c_walkdirect(570, 130, 30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_walk_left_lw_lookback);
    c_imagespeed(0.25);
    c_walkdirect_wait(582, su_actor.y, 30);
    c_halt();
    c_sel(kr);
    c_halt();
    c_wait_talk();
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_surprised_left_lw);
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_kris_head_down);
    c_wait(60);
    c_sel(kr);
    c_sprite(spr_kris_head_down_side);
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* (Um..^1. Kris?)/%", "obj_ch4_LWF03_slash_Step_0_gml_118_0");
    c_talk_wait();
    c_wait(5);
    c_sel(su);
    c_sprite(spr_susie_surprised_left_lw);
    c_sel(kr);
    c_sprite(spr_kris_head_down);
    c_mus2("initloop", "jitterbug.ogg", 0);
    c_mus2("volume", 0, 1);
    c_wait(1);
    c_mus2("volume", 1, 60);
    c_panspeed(-1, 0, 180);
    c_wait(60);
    c_sel(sa);
    c_sprite(spr_toriel_sans_dance_kick_stop);
    c_animate(0, 7, 0.25);
    c_wait(60);
    c_sel(sa);
    c_sprite(spr_sans_dance_loop);
    c_imagespeed(0.15);
    c_var_lerp("siner_amplitude0", 0, 2, 10);
    c_var("siner_add0", 0.2);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_dance_loop);
    c_imagespeed(0.15);
    c_visible(1);
    c_var_lerp("siner_amplitude0", 0, -2, 10);
    c_var("siner_add0", 0.2);
    c_wait(60);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* Haha^1, I have not danced the \"jitter bug\" like this in ages!/", "obj_ch4_LWF03_slash_Step_0_gml_163_0");
    c_facenext("sans", "5");
    c_msgnextloc("\\E5* well^1, you aren't bugging me^1, so jitter away./", "obj_ch4_LWF03_slash_Step_0_gml_165_0");
    c_facenext("toriel", 4);
    c_msgnextloc("\\E4* Ahahahaha!^1! Why..^1. why didn't the skeleton.../", "obj_ch4_LWF03_slash_Step_0_gml_167_0");
    c_msgnextloc("\\E4* Have anybody to dance with?/", "obj_ch4_LWF03_slash_Step_0_gml_168_0");
    c_msgnextloc("\\E4* Because..^1. he..^1. had no \"body\" to dance with^1! Hahahah!!/", "obj_ch4_LWF03_slash_Step_0_gml_169_0");
    c_facenext("sans", 3);
    c_msgnextloc("\\E3* hahahahahah. good one./", "obj_ch4_LWF03_slash_Step_0_gml_171_0");
    c_msgnextloc("\\E5* not only did you totally botch that joke^1, but^1,/", "obj_ch4_LWF03_slash_Step_0_gml_172_0");
    c_msgnextloc("\\E2* i'm dancin' with ya^1, so it doesn't make any sense./", "obj_ch4_LWF03_slash_Step_0_gml_173_0");
    c_facenext("toriel", 4);
    c_msgnextloc("\\E4* Ahhhahahaha!!/%", "obj_ch4_LWF03_slash_Step_0_gml_175_0");
    c_talk();
    c_wait_box(4);
    c_sel(sa);
    c_sprite(spr_sans_dance_loop_back);
    c_sel(to);
    c_sprite(spr_toriel_dance_loop_back);
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_sel(kr);
    c_sprite(spr_kris_head_down_side);
    c_wait_box(7);
    c_sel(su);
    c_sprite(spr_susie_surprised_left_lw);
    c_sel(kr);
    c_facing("l");
    c_wait_box(8);
    c_sel(sa);
    c_sprite(spr_sans_dance_loop);
    c_sel(to);
    c_sprite(spr_toriel_dance_loop);
    c_wait_talk();
    c_sel(sa);
    c_halt();
    c_var("siner_add0", 0);
    c_sel(to);
    c_halt();
    c_var("siner_add0", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* Are..^1. we^1, uh..^1. interrupting? Something?/%", "obj_ch4_LWF03_slash_Step_0_gml_221_0");
    c_talk_wait();
    c_sel(sa);
    c_sprite(spr_sans_r);
    c_sel(to);
    c_sprite(spr_toriel_rt_blush);
    c_emote("!", 30);
    c_wait(30);
    c_imagespeed(0.25);
    c_sel(kr);
    c_sprite(spr_kris_head_down);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E8* Oh!^1! Kris!^1! Snoozie!!/%", "obj_ch4_LWF03_slash_Step_0_gml_240_0");
    c_talk_wait();
    c_sel(to);
    c_halt();
    c_sel(to);
    c_autowalk(1);
    c_walkdirect_wait(495, 106, 5);
    c_autowalk(0);
    c_sprite(spr_toriel_l_blush);
    c_imagespeed(0.25);
    c_walkdirect_wait(457, 106, 10);
    c_halt();
    c_soundplay(snd_noise);
    c_mus("pause");
    c_var_instance(phono_marker, "image_speed", 0);
    c_var_instance(phono_marker, "image_index", 0);
    c_var_instance(id, "play_music", false);
    c_wait(30);
    c_sprite(spr_toriel_rt_blush);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* No^1, no^1, you are not interrupting anything!!/", "obj_ch4_LWF03_slash_Step_0_gml_270_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* We were looking for you at church^1, and.../%", "obj_ch4_LWF03_slash_Step_0_gml_272_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_sel(kr);
    c_sprite(spr_kris_head_down_side);
    c_sel(to);
    c_halt();
    c_wait_talk();
    c_sel(to);
    c_autowalk(1);
    c_walkdirect_wait(495, 106, 10);
    c_autowalk(0);
    c_sprite(spr_toriel_d_blush);
    c_imagespeed(0.25);
    c_walkdirect_wait(495, 120, 15);
    c_halt();
    c_sprite(spr_toriel_drunk_tilt_talk);
    c_imagespeed(0.25);
    c_sel(su);
    c_sprite(spr_susie_walk_left_lw_unhappy);
    c_sel(kr);
    c_facing("l");
    c_speaker("toriel");
    c_msgsetloc(0, "\\E9* Sorry^1, sorry^1, I cancelled choir practice today due to the rain./", "obj_ch4_LWF03_slash_Step_0_gml_306_0");
    c_msgnextloc("\\E1* The weather was so bad^1, and.../%", "obj_ch4_LWF03_slash_Step_0_gml_307_0");
    c_talk_wait();
    c_sel(to);
    c_halt();
    c_sel(to);
    c_sprite(spr_toriel_drunk_tilt_look);
    c_wait(60);
    c_sprite(spr_toriel_drunk_tilt_look_right);
    c_imagespeed(0.25);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* Err^1, Kris^1, Susie^1, have you met Mr. Sans?/", "obj_ch4_LWF03_slash_Step_0_gml_322_0");
    c_facenext("sans", "2");
    c_msgnextloc("\\E2* heya./", "obj_ch4_LWF03_slash_Step_0_gml_327_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* Umm.../%", "obj_ch4_LWF03_slash_Step_0_gml_332_0");
    c_talk();
    c_wait_box(2);
    c_sel(to);
    c_halt();
    c_sel(sa);
    c_sprite(spr_sans_wave);
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_sel(kr);
    c_sprite(spr_kris_head_down_side);
    c_sel(sa);
    c_sprite(spr_sans_r);
    c_wait_talk();
    c_sel(to);
    c_autowalk(1);
    c_walk_wait("r", 4, 5);
    c_autowalk(0);
    c_sprite(spr_toriel_rt_blush);
    c_imagespeed(0.25);
    c_sel(su);
    c_sprite(spr_susie_walk_left_lw_unhappy);
    c_sel(kr);
    c_sprite(spr_kris_head_down);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E8* Oh^1! Susie^1, did you..^1. want to stay over again...?/", "obj_ch4_LWF03_slash_Step_0_gml_371_0");
    c_msgnextloc("\\E4* You could just sleep in^1, uhh^1, Asriel's bed^1! Haha!/%", "obj_ch4_LWF03_slash_Step_0_gml_372_0");
    c_talk();
    c_wait_box(1);
    c_sel(to);
    c_sprite(spr_toriel_laugh_drunk);
    c_wait_talk();
    c_sel(to);
    c_halt();
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_facing("susieunhappy");
    c_facing("l");
    c_walk_wait("r", 1, 5);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* I think I.../", "obj_ch4_LWF03_slash_Step_0_gml_395_0");
    c_msgnextloc("\\EV* Gotta be going^1, actually.../", "obj_ch4_LWF03_slash_Step_0_gml_399_0");
    c_facenext("toriel", 1);
    c_msgnextloc("\\E1* Oh..^1. alright./", "obj_ch4_LWF03_slash_Step_0_gml_404_0");
    c_msgnextloc("\\E4* See you later^1, honey!!/", "obj_ch4_LWF03_slash_Step_0_gml_405_0");
    c_msgnextloc("\\E8* Err^1, I mean Susie!^1! Haha!!/", "obj_ch4_LWF03_slash_Step_0_gml_409_0");
    c_facenext("susie", "V");
    c_msgnextloc("\\EV* ..^1. later./%", "obj_ch4_LWF03_slash_Step_0_gml_411_0");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_facing("r");
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walk("l", 2, 8);
    c_delaycmd(9, "halt");
    c_wait_box(3);
    c_sel(to);
    c_sprite(spr_toriel_dt_blush);
    c_imagespeed(0.25);
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_surprised_left_lw);
    c_halt();
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_drunk_wave);
    c_imagespeed(0.15);
    c_wait_box(5);
    c_sel(to);
    c_sprite(spr_toriel_laugh_drunk);
    c_wait_box(7);
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_sel(su);
    c_facing("l");
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walk("r", 2, 12);
    c_wait(12);
    c_halt();
    c_sel(su);
    c_visible(0);
    c_wait(5);
    c_var_instance(door_marker, "image_index", 1);
    c_soundplay(snd_doorclose);
    c_shake();
    c_sel(kr);
    c_sprite(spr_kris_head_down_right_alt);
    c_sel(sa);
    c_sprite(spr_sans_r);
    c_sel(to);
    c_autowalk(1);
    c_sprite(spr_toriel_r_blush);
    c_halt();
    c_wait(90);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_rt_blush);
    c_imagespeed(0.25);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E8* Kris^1, is..^1. Susie OK?/%", "obj_ch4_LWF03_slash_Step_0_gml_491_0");
    c_talk_wait();
    c_halt();
    c_sel(to);
    c_sprite(spr_toriel_l_blush);
    c_sel(sa);
    c_imagespeed(0.25);
    c_walk("r", 2, 8);
    c_speaker("sans");
    c_msgsetloc(0, "\\E2* hey^1, she'll be fine./", "obj_ch4_LWF03_slash_Step_0_gml_506_0");
    c_msgnextloc("\\E1* i'm sure she'll figure it all out./", "obj_ch4_LWF03_slash_Step_0_gml_507_0");
    c_msgnextloc("\\E2* meanwhile^1, let's get back to business./%", "obj_ch4_LWF03_slash_Step_0_gml_508_0");
    c_talk();
    c_wait(8);
    c_sel(sa);
    c_halt();
    c_wait_talk();
    c_sel(sa);
    c_sprite(spr_sans_l);
    c_imagespeed(0.25);
    c_walkdirect_wait(446, 141, 10);
    c_sprite(spr_sans_u);
    c_walkdirect_wait(446, 129, 5);
    c_halt();
    c_sel(kr);
    c_facing("l");
    c_soundplay(snd_noise);
    c_var_instance(phono_marker, "image_speed", 0.15);
    c_mus("resume");
    c_mus2("pitch", 0.05, 0);
    c_mus2("pitchtime", 1, 30);
    c_wait(30);
    c_var_instance(id, "play_timer", 0);
    c_var_instance(id, "play_music", true);
    c_sel(sa);
    c_sprite(spr_sans_d);
    c_wait(30);
    c_sprite(spr_sans_shrug2);
    c_wait(5);
    c_speaker("sans");
    c_msgsetloc(0, "\\E5* kris^1, what about you? you wanna party?/%", "obj_ch4_LWF03_slash_Step_0_gml_548_0");
    c_talk_wait();
    c_sel(sa);
    c_sprite(spr_sans_d);
    c_sel(kr);
    c_sprite(spr_kris_head_down);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_drunk_clap);
    c_imagespeed(0.25);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* Kris!^1! Party!^1! Party!^1! Board games!!/%", "obj_ch4_LWF03_slash_Step_0_gml_564_0");
    c_talk_wait();
    c_sel(sa);
    c_imagespeed(0.25);
    c_walkdirect_wait(446, 141, 15);
    c_sprite(spr_sans_r);
    c_walkdirect_wait(464, 141, 10);
    c_halt();
    c_sprite(spr_sans_shrug2);
    c_sel(to);
    c_autowalk(1);
    c_facing("l");
    c_sel(kr);
    c_facing("l");
    c_speaker("sans");
    c_msgsetloc(0, "\\E1* and hey^1, we don't gotta just do disco dancin'^1, kid./", "obj_ch4_LWF03_slash_Step_0_gml_584_0");
    c_msgnextloc("\\E3* we can play some brand-new music too./", "obj_ch4_LWF03_slash_Step_0_gml_585_0");
    c_msgnextloc("\\E2* how 'bout we pump up the tunes?/%", "obj_ch4_LWF03_slash_Step_0_gml_586_0");
    c_talk_wait();
    c_sel(sa);
    c_sprite(spr_sans_r);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_drunk_clap);
    c_imagespeed(0.25);
    c_sel(kr);
    c_sprite(spr_kris_head_down);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* Pump the tunes^1! Pump the tunes!^1! Pump the tunes!!/%", "obj_ch4_LWF03_slash_Step_0_gml_602_0");
    c_talk_wait();
    c_sel(to);
    c_sprite(spr_toriel_laugh_fall_timing);
    c_animate(0, 22, 0.25);
    c_var_instance(id, "toriel_fall", true);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* Hahaha!!/%", "obj_ch4_LWF03_slash_Step_0_gml_614_0");
    c_talk();
    c_wait(46);
    c_sel(kr);
    c_facing("l");
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect(585, 130, 10);
    c_wait(10);
    c_halt();
    c_sel(kr);
    c_sprite(spr_kris_head_down);
    c_wait(29);
    c_sel(to);
    c_sprite(spr_toriel_laugh_fall_loop);
    c_imagespeed(0.25);
    c_wait_talk();
    c_wait(30);
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect_wait(587, 150, 10);
    c_walkdirect(422, 150, 80);
    c_wait(10);
    c_sel(to);
    c_halt();
    c_sprite(spr_toriel_laugh_fall_look);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E1* Kris? Where are you going? You're going to bed already?/", "obj_ch4_LWF03_slash_Step_0_gml_655_0");
    c_msgnextloc("\\E9* There are pancakes in the fridge if you want them^1, dear.../", "obj_ch4_LWF03_slash_Step_0_gml_656_0");
    c_msgnextloc("\\E0* Goodnight^1, honey!/%", "obj_ch4_LWF03_slash_Step_0_gml_657_0");
    c_talk();
    c_wait_box(2);
    c_sel(to);
    c_sprite(spr_toriel_laugh_fall_loop);
    c_imagespeed(0.25);
    c_wait_talk();
    c_wait_if(kr_actor, "x", "<=", 422);
    c_sel(kr);
    c_walkdirect(277, 150, 60);
    c_panspeed(-3, 0, 60);
    c_wait(10);
    c_sel(sa);
    c_sprite(spr_sans_r);
    c_imagespeed(0.25);
    c_walk("r", 2, 24);
    c_wait(50);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_var_instance(id, "make_npcs", true);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 310;
    con = 99;
    upstairs_check = true;
}
if (make_npcs)
{
    make_npcs = false;
    toriel_npc = scr_marker(500, 121, spr_toriel_dance_loop);
    toriel_npc.image_speed = 0.15;
    with (toriel_npc)
        scr_depth();
    sans_npc = scr_marker(466, 142, spr_sans_dance_loop);
    sans_npc.image_speed = 0.15;
    with (sans_npc)
        scr_depth();
    var dance_collider = instance_create(457, sans_npc.y, obj_solidblockLight);
    dance_collider.image_xscale = 4;
    dance_collider.image_yscale = 1.5;
    var dance_readable = instance_create(467, sans_npc.y + 8, obj_readable_room1);
    dance_readable.image_xscale = 4;
    dance_readable.image_yscale = 1.18;
    dance_npc = true;
    with (door_frame_marker)
        depth = 100000;
}
if (dance_npc)
{
    dance_timer++;
    if (!dance_kick)
    {
        sinerx = 0;
        siner0 += siner_add0;
        sinmove = sin(siner0) * 0.8;
        toriel_npc.x += lengthdir_x(sinmove, siner_direction0);
        sans_npc.x -= lengthdir_x(sinmove, siner_direction0);
    }
    if (dance_timer == 1)
    {
        dance_kick = false;
        toriel_npc.visible = 1;
        toriel_npc.sprite_index = spr_toriel_dance_loop_back;
        sans_npc.sprite_index = spr_sans_dance_loop_back;
        dance_speed = 0.15;
        sans_npc.image_speed = dance_speed;
    }
    if (dance_timer == 120)
    {
        toriel_npc.sprite_index = spr_toriel_dance_loop;
        sans_npc.sprite_index = spr_sans_dance_loop;
    }
    if (dance_timer == 240)
    {
        dance_kick = true;
        toriel_npc.visible = 0;
        sans_npc.sprite_index = spr_toriel_sans_dance_loop;
        dance_speed = 0.25;
        sans_npc.image_speed = dance_speed;
    }
    if (dance_timer == 360)
        sans_npc.sprite_index = spr_toriel_sans_dance_kick_stop;
    if (dance_timer >= 360 && sans_npc.image_index >= 7)
        dance_timer = 0;
    if (music_faster)
    {
        if (dance_pitch < 1.36)
            dance_pitch = 1.36;
        if (toriel_npc != -4)
        {
            if (toriel_npc.image_speed != (dance_speed * 2))
                toriel_npc.image_speed = dance_speed * 2;
        }
        if (sans_npc != -4)
        {
            if (sans_npc.image_speed != (dance_speed * 2))
                sans_npc.image_speed = dance_speed * 2;
        }
    }
    else
    {
        if (dance_pitch > 1)
            dance_pitch = 1;
        if (toriel_npc != -4)
        {
            if (toriel_npc.image_speed != dance_speed)
                toriel_npc.image_speed = dance_speed;
        }
        if (sans_npc != -4)
        {
            if (sans_npc.image_speed != dance_speed)
                sans_npc.image_speed = dance_speed;
        }
    }
    var current_pitch = scr_movetowards(audio_sound_get_pitch(global.currentsong[0]), dance_pitch, 0.25);
    snd_pitch(global.currentsong[0], current_pitch);
}
if (upstairs_check)
{
    if (upstairs_con == 0)
    {
        if (obj_mainchara.x < 160 && obj_mainchara.y < 80)
        {
            global.interact = 1;
            global.facing = 2;
            upstairs_con = 1;
        }
    }
    if (upstairs_con == 1)
    {
        upstairs_con = 2;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_sound_play(snd_escaped);
        c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
        c_mus2("volume", 0, 30);
        c_wait(210);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (upstairs_con == 2 && !i_ex(obj_cutscene_master))
    {
        snd_free_all();
        upstairs_con = 99;
        upstairs_check = false;
        scr_flag_set(778, 0);
        if (scr_flag_get(931) == 0)
        {
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_4);
        }
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_2, UnknownEnum.Value_1);
        scr_complete_save_file();
        room_goto(room_krisroom_dark);
    }
}
if (play_music)
{
    play_timer++;
    if (play_timer == 1)
    {
        var start_x = phono_marker.x + 10 + irandom(10);
        var start_y = phono_marker.y + 10;
        var note_marker = scr_marker(start_x, start_y, spr_musical_notes_small);
        note_marker.depth = phono_marker.depth - 10;
        note_marker.image_alpha = 0;
        var note_speed = music_faster ? 0.5 : 1;
        scr_lerp_var_instance(note_marker, "image_alpha", 0, 1, 10 * note_speed);
        scr_lerp_var_instance(note_marker, "x", start_x, start_x + 20 + irandom(10), 30 * note_speed);
        scr_lerp_var_instance(note_marker, "y", start_y, start_y - (30 + irandom(10)), 30 * note_speed);
        with (note_marker)
            scr_script_delayed(scr_lerp_var_instance, 11 * note_speed, id, "image_alpha", 1, 0, 10 * note_speed);
        scr_doom(note_marker, 61 * note_speed);
    }
    if (music_faster)
    {
        with (phono_marker)
            image_speed = 0.3;
        if (play_timer >= 10)
            play_timer = 0;
    }
    else
    {
        with (phono_marker)
            image_speed = 0.15;
        if (play_timer >= 20)
            play_timer = 0;
    }
}
if (toriel_fall)
{
    if (to_actor.image_index < 11)
        exit;
    toriel_fall_timer++;
    with (to_actor)
    {
        if (hspeed < 1)
            hspeed = scr_movetowards(hspeed, 1, 0.25);
    }
    if (toriel_fall_timer == 17)
    {
        sound_play(snd_bump);
        scr_shakescreen();
        with (to_actor)
            friction = 1;
        toriel_fall = false;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4
}
