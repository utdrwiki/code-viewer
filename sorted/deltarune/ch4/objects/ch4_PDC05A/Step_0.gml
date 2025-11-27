if (con == 0 && !d_ex() && global.interact == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    scr_flag_set(7, 1);
    table_marker = scr_marker(7, 111, bg_diner_table);
    with (table_marker)
        depth = 98500;
    sundae_marker = scr_marker(51, 111, spr_diner_sundae);
    sundae_marker.depth = table_marker.depth - 10;
    sundae_marker.visible = 0;
    seat_marker = scr_marker(20, 151, bg_diner_seat_back_mid);
    with (seat_marker)
        depth = 98200;
    counter_marker = scr_marker(101, 89, bg_diner_counter);
    with (counter_marker)
        depth = 99000;
    qc_marker = scr_marker(130, 83, spr_npc_qc);
    qc_marker.depth = counter_marker.depth + 10;
    with (obj_npc_room)
    {
        if (sprite_index == spr_npc_qc)
            visible = 0;
    }
    backdoor_marker = scr_marker(260, 57, bg_diner_backdoor);
    backdoor_marker.depth = qc_marker.depth + 10;
    light_marker = scr_marker(260, 57, bg_diner_backdoor_light);
    light_marker.depth = qc_marker.depth - 10;
}
if (qc_hide)
{
    qc_shadow = clamp(qc_shadow + 0.2, 0, 1);
    var shadow = qc_shadow;
    with (qc_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (qc_shadow >= 1)
        qc_hide = false;
}
if (qc_show)
{
    qc_shadow = clamp(qc_shadow - 0.2, 0, 1);
    var shadow = qc_shadow;
    with (qc_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (qc_shadow <= 0)
        qc_show = false;
}
if (door_time)
{
    door_timer++;
    if (door_timer == 66)
    {
        snd_play(snd_dooropen);
        backdoor_marker.image_index = 1;
    }
    if (door_timer == 71)
        qc_hide = true;
    if (door_timer == 81)
    {
        snd_play(snd_doorclose);
        backdoor_marker.image_index = 0;
        door_time = false;
    }
}
if (diner_bgm)
{
    diner_bgm = false;
    alarm[2] = 31;
}
if (diner_bgm_stop)
{
    diner_bgm_stop = false;
    mus_volume(diner_song[1], 0, 30);
    alarm[1] = 30;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    qc = actor_count + 1;
    qc_actor = instance_create(qc_marker.x, qc_marker.y, obj_actor);
    scr_actor_setup(qc, qc_actor, "qc");
    qc_actor.sprite_index = qc_marker.sprite_index;
    c_sel(qc);
    c_autodepth(0);
    c_depth(qc_marker.depth);
    c_var_instance(qc_marker, "visible", 0);
    c_var_instance(id, "door_time", true);
    c_mus2("volume", 0, 30);
    c_sel(qc);
    c_autowalk(0);
    c_sprite(spr_npc_qc_walk_down);
    c_setxy(qc_marker.x - 1, qc_marker.y);
    c_wait(5);
    c_sprite(spr_npc_qc_walk_right);
    c_imagespeed(0.25);
    c_walkdirect(270, 83, 50);
    c_delaycmd(51, "sprite", spr_npc_qc_walk_up);
    c_delaycmd(51, "imagespeed", 0);
    c_delaycmd(56, "imagespeed", 0.25);
    c_delaywalkdirect(56, 270, 60, 15);
    c_delaycmd(71, "imagespeed", 0);
    c_delaycmd(71, "visible", 0);
    c_sel(kr);
    c_walkdirect(48, 122, 30);
    c_delayfacing(31, "u");
    c_delaycmd(31, "autowalk", 0);
    c_delaywalk(31, "d", 3, 3);
    c_sel(su);
    c_walkdirect_wait(110, 107, 15);
    c_walkdirect_wait(78, 107, 15);
    c_walkdirect_wait(78, 86, 15);
    c_walkdirect_wait(45, 86, 15);
    c_facing("d");
    c_walk("d", 3, 3);
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_soundplay(snd_susie_yawn);
    c_sprite(spr_susie_yawn);
    c_imagespeed(0.25);
    c_wait(40);
    c_halt();
    c_sprite(spr_susie_stretch);
    c_imagespeed(0.2);
    c_wait(40);
    c_imagespeed(0);
    c_sprite(spr_susie_table_lean);
    c_addxy(-3, 7);
    c_autodepth(0);
    c_depth(7000);
    c_halt();
    c_var_instance(id, "diner_bgm", true);
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* The diner^1, huh.../", "obj_ch4_PDC05A_slash_Step_0_gml_195_0");
    c_msgnextloc("\\EN* Haven't eaten here since..^1. Your mom took me./", "obj_ch4_PDC05A_slash_Step_0_gml_196_0");
    c_msgnextloc("\\ES* I remember plowing into my food with a runny nose./", "obj_ch4_PDC05A_slash_Step_0_gml_197_0");
    c_msgnextloc("\\E2* I probably became every janitor's enemy after that./", "obj_ch4_PDC05A_slash_Step_0_gml_198_0");
    c_msgnextloc("\\ED* ..^1. But..^1. it's funny./", "obj_ch4_PDC05A_slash_Step_0_gml_199_0");
    c_msgnextloc("\\EK* Even though I was only making a mess.../", "obj_ch4_PDC05A_slash_Step_0_gml_200_0");
    c_msgnextloc("\\ES* Her face looked so..^1. Happy./", "obj_ch4_PDC05A_slash_Step_0_gml_201_0");
    c_msgnextloc("\\EN* Just sitting there..^1. smiling^1, watching me./", "obj_ch4_PDC05A_slash_Step_0_gml_202_0");
    c_msgnextloc("\\E1* .../", "obj_ch4_PDC05A_slash_Step_0_gml_203_0");
    c_msgnextloc("\\ET* Kind of like you're doing now./", "obj_ch4_PDC05A_slash_Step_0_gml_204_0");
    c_msgnextloc("\\EN* .../", "obj_ch4_PDC05A_slash_Step_0_gml_205_0");
    c_msgnextloc("\\EQ* Jeez./", "obj_ch4_PDC05A_slash_Step_0_gml_206_0");
    c_msgnextloc("\\E2* Kris^1, anyone tell you your family is goddamn weird?/%", "obj_ch4_PDC05A_slash_Step_0_gml_207_0");
    c_talk();
    c_wait_box(1);
    c_imageindex(1);
    c_wait_box(2);
    c_imageindex(0);
    c_wait_box(4);
    c_imageindex(1);
    c_wait_box(5);
    c_imageindex(0);
    c_wait_box(9);
    c_imageindex(1);
    c_wait_box(10);
    c_imageindex(0);
    c_wait_box(11);
    c_imageindex(2);
    c_wait_box(12);
    c_imageindex(3);
    c_waittalk();
    c_wait(30);
    c_soundplay(snd_dooropen);
    c_var_instance(backdoor_marker, "image_index", 1);
    c_sel(qc);
    c_sprite(spr_npc_qc_walk_down_tray);
    c_visible(1);
    c_var_instance(id, "qc_show", true);
    c_imagespeed(0.25);
    c_walkdirect(270, 65, 15);
    c_wait(10);
    c_soundplay(snd_doorclose);
    c_var_instance(backdoor_marker, "image_index", 0);
    c_wait(5);
    c_sprite(spr_npc_qc_walk_left_tray);
    c_walkdirect_wait(80, 65, 60);
    c_sel(su);
    c_imageindex(4);
    c_sel(qc);
    c_sprite(spr_npc_qc_walk_down_tray);
    c_walkdirect(80, 97, 30);
    c_wait(15);
    c_sel(su);
    c_depth(100000);
    c_sprite(spr_susie_walk_down_lw);
    c_addxy(3, -7);
    c_shakeobj();
    c_wait(15);
    c_sel(qc);
    c_imagespeed(0);
    c_sprite(spr_npc_qc_walk_left_tray);
    c_wait(5);
    c_var_instance(table_marker, "sprite_index", spr_diner_table_food);
    c_soundplay(snd_bump);
    c_wait(15);
    c_speaker("no_name");
    c_msgsetloc(0, "* Here you go./", "obj_ch4_PDC05A_slash_Step_0_gml_283_0");
    c_msgnextloc("* And here's a little something extra for your friend./%", "obj_ch4_PDC05A_slash_Step_0_gml_284_0");
    c_talk_wait();
    c_sel(qc);
    c_sprite(spr_npc_qc_walk_left_tray_empty);
    c_var_instance(sundae_marker, "visible", 1);
    c_soundplay(snd_bump);
    c_wait(5);
    c_sel(su);
    c_sprite(spr_susie_sheeh_lw);
    c_shakeobj();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Huh!?/", "obj_ch4_PDC05A_slash_Step_0_gml_304_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* If you need anything else^1, just holler./%", "obj_ch4_PDC05A_slash_Step_0_gml_306_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_down_lw_unhappy);
    c_sel(qc);
    c_sprite(spr_npc_qc_walk_up);
    c_imagespeed(0.25);
    c_walkdirect_wait(80, 65, 30);
    c_sprite(spr_npc_qc_walk_right_tray_empty);
    c_walkdirect_wait(126, 65, 15);
    c_sprite(spr_npc_qc_walk_down_tray_empty);
    c_walkdirect_wait(130, 83, 15);
    c_wait(5);
    c_imagespeed(0);
    c_walk_wait("d", 3, 3);
    c_soundplay(snd_noise);
    c_sprite(spr_npc_qc);
    c_walk_wait("u", 3, 3);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* .../", "obj_ch4_PDC05A_slash_Step_0_gml_329_0");
    c_msgnextloc("\\EQ* Alright^1, Kris./", "obj_ch4_PDC05A_slash_Step_0_gml_330_0");
    c_msgnextloc("\\EX* Don't hold anything back./%", "obj_ch4_PDC05A_slash_Step_0_gml_331_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susied);
    c_setxy(45, 93);
    c_waittalk();
    c_var_instance(blackall, "depth", 4900);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(45);
    c_soundplay(snd_weaponpull);
    c_wait(30);
    c_soundplay(snd_badexplosion);
    c_wait(20);
    c_soundplay(snd_sussurprise);
    c_wait(45);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* ..^1. phew./", "obj_ch4_PDC05A_slash_Step_0_gml_360_0");
    c_msgnextloc("\\E2* .../%", "obj_ch4_PDC05A_slash_Step_0_gml_361_0");
    c_talk_wait();
    c_var_instance(id, "choose_sundae", true);
    c_msc(1254);
    c_talk_wait();
    c_waitcustom();
}
if (choose_sundae && i_ex(obj_choicer_neo) && con < 4)
{
    choosetimer++;
    if (choosetimer == 30)
    {
        if (obj_choicer_neo.choiced == 0)
        {
            con = 4;
            with (obj_choicer_neo)
            {
                canchoose = 0;
                choiced = 1;
                instance_destroy();
            }
            if (i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
            }
            scr_speaker("susie");
            msgsetloc(0, "\\EY* Too slow^1! Hahaha!/%", "obj_ch4_PDC05A_slash_Step_0_gml_394_0");
            d_make();
        }
    }
    if (choosetimer == 35)
    {
        choose_sundae = false;
        choose_timeup = true;
        if (i_ex(obj_dialoguer))
        {
            with (obj_dialoguer)
                instance_destroy();
        }
    }
}
if (con == 4 && !d_ex())
{
    con = 5;
    c_waitcustom_end();
    c_wait(15);
    c_soundplay(snd_swallow);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* So^1, guess we should get going^1, huh...?/", "obj_ch4_PDC05A_slash_Step_0_gml_428_0");
    c_msgnextloc("\\E6* ...?/%", "obj_ch4_PDC05A_slash_Step_0_gml_429_0");
    c_talk_wait();
    c_msc(1256);
    c_talk_wait();
}
if (con == 6 && !d_ex())
{
    con = 8;
    scr_flag_set(702, 1);
    c_wait(15);
    c_soundplay_x(snd_window_draw_squeak, 1, 1.2);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. Is that me?/", "obj_ch4_PDC05A_slash_Step_0_gml_450_0");
    c_msgnextloc("\\EQ* Heh. Not bad^1, y'know./%", "obj_ch4_PDC05A_slash_Step_0_gml_451_0");
    c_talk_wait();
}
if (con == 8 && !d_ex())
{
    con = 9;
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Here^1, lemme draw something./%", "obj_ch4_PDC05A_slash_Step_0_gml_462_0");
    c_talk_wait();
    c_wait(15);
    c_soundplay(snd_window_draw_squeak);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* It's you./%", "obj_ch4_PDC05A_slash_Step_0_gml_473_0");
    c_talk_wait();
    c_msc(1258);
    c_talk_wait();
}
if (con == 10 && !d_ex())
{
    var drew_susie = scr_flag_get(702) == 1;
    con = drew_susie ? 11 : 16;
    c_wait(15);
    c_soundplay(snd_window_draw_squeak);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Look^1, I made you talk./", "obj_ch4_PDC05A_slash_Step_0_gml_493_0");
    c_msgnextloc("\\E9* \"Susie rulez\"!/%", "obj_ch4_PDC05A_slash_Step_0_gml_494_0");
    c_talk_wait();
    if (drew_susie)
    {
        c_msc(1260);
        c_talk_wait();
    }
}
if (con == 12 && !d_ex())
{
    con = 16;
    c_soundplay_x(snd_window_draw_squeak, 1, 1.2);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* What are you--/", "obj_ch4_PDC05A_slash_Step_0_gml_514_0");
    c_msgnextloc("\\EH* I WOULDN'T SAY THAT!!!/%", "obj_ch4_PDC05A_slash_Step_0_gml_515_0");
    c_talk_wait();
}
if (con == 14 && !d_ex())
{
    con = 16;
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Here^1, I'll help./%", "obj_ch4_PDC05A_slash_Step_0_gml_524_0");
    c_talk_wait();
    c_soundplay(snd_window_draw_squeak);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Now I'm saying \"Shut up\"./%", "obj_ch4_PDC05A_slash_Step_0_gml_533_0");
    c_talk_wait();
}
if (con == 16 && !d_ex())
{
    con = 17;
    with (obj_event_manager)
        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_29);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* And then the rain fell down and.../%", "obj_ch4_PDC05A_slash_Step_0_gml_544_0");
    c_talk_wait();
    c_soundplay(snd_window_erase_squeak);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* Washed everything away./", "obj_ch4_PDC05A_slash_Step_0_gml_553_0");
    c_msgnextloc("\\EA* Heh./%", "obj_ch4_PDC05A_slash_Step_0_gml_554_0");
    c_talk_wait();
    c_msc(1262);
    c_talk_wait();
}
if (con == 18 && !d_ex())
{
    con = 20;
    scr_flag_set(703, 1);
    c_soundplay_x(snd_window_draw_squeak, 1, 1.2);
    c_wait(10);
    c_soundplay_x(snd_window_draw_squeak, 1, 1.2);
    c_wait(45);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* ..^1. huh?/", "obj_ch4_PDC05A_slash_Step_0_gml_575_0");
    c_msgnextloc("\\E0* ..^1. are you writing something?/%", "obj_ch4_PDC05A_slash_Step_0_gml_576_0");
    c_talk_wait();
    c_wait(15);
    c_soundplay_x(snd_window_draw_squeak, 1, 1.2);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* Heh^1, Kris.../", "obj_ch4_PDC05A_slash_Step_0_gml_587_0");
    c_msgnextloc("\\E2* I can never tell when you're messing around./%", "obj_ch4_PDC05A_slash_Step_0_gml_588_0");
    c_talk_wait();
}
if (con == 20 && !d_ex())
{
    con = 22;
    c_sel(su);
    c_sprite(spr_susie_walk_down_lw);
    c_var_instance(table_marker, "sprite_index", spr_diner_table_messy);
    c_var_instance(sundae_marker, "visible", 0);
    c_var_instance(id, "diner_bgm_stop", true);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_wait(30);
    c_wait(30);
    c_soundplay(snd_susie_yawn);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_yawn);
    c_imagespeed(0.25);
    c_wait(40);
    c_halt();
    c_autowalk(1);
    c_facing("d");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Well^1, let's get out of here./%", "obj_ch4_PDC05A_slash_Step_0_gml_627_0");
    c_talk_wait();
    c_sel(kr);
    c_autowalk(1);
    c_walk_wait("u", 2, 3);
    c_walk_wait("r", 2, 8);
    c_sel(qc);
    c_sprite(spr_npc_qc_walk_left);
    c_sel(su);
    c_sprite(spr_susie_sheeh_lw);
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* You mind cleaning your place up a bit first^1, hon?/", "obj_ch4_PDC05A_slash_Step_0_gml_644_0");
    c_facenext("susie", 16);
    c_msgnextloc("\\EG* Huh? Ohh^1, uhhh^1, yeah^1, sure..^1. heheh./%", "obj_ch4_PDC05A_slash_Step_0_gml_646_0");
    c_talk_wait();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 15);
    c_wait(45);
    c_var_instance(table_marker, "sprite_index", bg_diner_table);
    c_sel(qc);
    c_sprite(spr_npc_qc);
    c_sel(su);
    c_sprite(spr_susie_walk_down_lw);
    c_sel(kr);
    c_facing("l");
    c_setxy(80, 105);
    c_wait(15);
    c_soundplay(snd_noise);
    c_wait(15);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
    c_wait(15);
    c_sel(su);
    c_walkdirect_wait(78, 86, 15);
    c_facing("d");
    c_sel(kr);
    c_facing("d");
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Alright^1, let's go./%", "obj_ch4_PDC05A_slash_Step_0_gml_682_0");
    c_talk_wait();
    c_var_instance(qc_marker, "visible", 1);
    c_mus2("volume", 1, 30);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 22 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    if (global.plot >= 45 && global.plot < 50)
    {
        if (scr_flag_get(1559) < 2)
            scr_flag_set(1559, 2);
    }
    scr_flag_set(701, 1);
    con = 99;
    scr_flag_set(7, 0);
    with (obj_npc_room)
    {
        if (sprite_index == spr_npc_qc)
            visible = 1;
    }
    with (qc_marker)
        instance_destroy();
    with (table_marker)
        instance_destroy();
    with (sundae_marker)
        instance_destroy();
    with (seat_marker)
        instance_destroy();
    with (counter_marker)
        instance_destroy();
}

enum UnknownEnum
{
    Value_0,
    Value_29 = 29
}
