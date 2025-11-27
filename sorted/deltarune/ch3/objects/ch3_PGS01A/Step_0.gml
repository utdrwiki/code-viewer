if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    obj_mainchara.x = 400;
    obj_mainchara.y = 200;
    if (!scr_havechar(2))
    {
        scr_getchar(2);
        scr_makecaterpillar(obj_mainchara.x + 40, cameray() - 100, 2, 0);
        with (obj_caterpillarchara)
            visible = 0;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    circlezoom = instance_create(420, 210, obj_circlezoom);
    circlezoom.type = 2;
    scr_maincharacters_actors();
    c_sel(su);
    c_visible(0);
    c_sel(kr);
    c_setxy(338, 154);
    c_autowalk(0);
    c_sprite(spr_couch_susie_sleeping);
    c_imagespeed(0.1);
    c_wait(120);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 90);
    c_wait(90);
    c_wait(150);
    c_var_instance(id, "susie_snore_stop", true);
    c_sel(kr);
    c_sprite(spr_couch_susie_sleeping_pop);
    c_animate(0, 4, 0.25);
    c_wait(8);
    c_soundplay_x(snd_whip_crack_only, 1, 2);
    c_wait(60);
    c_sel(kr);
    c_sprite(spr_couch_susie_awake);
    c_wait(30);
    c_sprite(spr_couch_susie_blinking);
    c_imagespeed(0);
    c_imageindex(1);
    c_wait(6);
    c_imageindex(0);
    c_soundplay(snd_xylophone_blink);
    c_wait(3);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_soundplay(snd_xylophone_blink);
    c_wait(3);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_soundplay(snd_xylophone_blink);
    c_wait(3);
    c_imageindex(1);
    c_wait(4);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EG* H..^1. huh!?/%", "obj_ch3_PGS01A_slash_Step_0_gml_102_0");
    c_talk_wait();
    c_var_instance(circlezoom, "type", 3);
    c_sprite(spr_couch_susie_looking);
    c_wait(8);
    c_imageindex(1);
    c_wait(8);
    c_imageindex(2);
    c_wait(8);
    c_halt();
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EF* Kris.../%", "obj_ch3_PGS01A_slash_Step_0_gml_117_0");
    c_talk_wait();
    c_wait(30);
    c_soundplay(snd_wing);
    c_sprite(spr_couch_susie_kicking);
    c_wait(8);
    c_imageindex(1);
    c_wait(60);
    c_soundplay(snd_wing);
    c_imageindex(0);
    c_wait(8);
    c_imageindex(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Kris..^1. Kris..^1. Hey^1, wake up!!/", "obj_ch3_PGS01A_slash_Step_0_gml_138_0");
    c_msgnextloc("\\EP* We're..^1. in the Dark World!!/%", "obj_ch3_PGS01A_slash_Step_0_gml_139_0");
    c_talk();
    c_wait_box(1);
    c_soundplay(snd_wing);
    c_imageindex(0);
    c_wait(8);
    c_imageindex(1);
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_couch_susie_knock_over);
    c_setxy(380, 180);
    c_visible(1);
    c_wait(1);
    c_autowalk(0);
    c_animate(0, 2, 0.3);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_couch_kris_knock_over);
    c_halt();
    c_animate(0, 2, 0.3);
    c_wait(6);
    c_sel(kr);
    c_facing("r");
    c_halt();
    c_sound_play(snd_noise);
    c_var_instance(kr_actor, "image_angle", 90);
    c_setxy(300, 224);
    c_shakeobj();
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("l");
    c_halt();
    c_var_instance(su_actor, "image_angle", -90);
    c_setxy(480, 180);
    c_shakeobj();
    c_wait(60);
    c_sound_play(snd_wing);
    c_sel(kr);
    c_autowalk(0);
    c_spin(3);
    c_walkdirect(300, 250, 30);
    c_sel(su);
    c_autowalk(0);
    c_spin(-3);
    c_walkdirect_wait(480, 206, 30);
    c_spin(0);
    c_sel(kr);
    c_spin(0);
    c_var_instance(kr_actor, "gravity", 1);
    c_var_instance(su_actor, "gravity", 1);
    c_wait(10);
    c_sound_play(snd_impact);
    c_var_instance(kr_actor, "gravity", 0);
    c_var_instance(kr_actor, "vspeed", 0);
    c_var_instance(su_actor, "gravity", 0);
    c_var_instance(su_actor, "vspeed", 0);
    c_sel(kr);
    c_var_instance(kr_actor, "image_angle", 0);
    c_imageindex(0);
    c_imagespeed(0);
    c_sprite(spr_kris_dw_landed);
    c_setxy(300, 226);
    c_shakeobj();
    c_sel(su);
    c_var_instance(su_actor, "image_angle", 0);
    c_setxy(400, 212);
    c_imageindex(0);
    c_imagespeed(0);
    c_sprite(spr_susie_dw_landed);
    c_shakeobj();
    c_wait(15);
    c_sel(su);
    c_imageindex(1);
    c_sel(kr);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_autowalk(1);
    c_facing("d");
    c_addxy(0, 2);
    c_sel(su);
    c_imageindex(0);
    c_autowalk(1);
    c_facing("d");
    c_addxy(8, 0);
    c_wait(30);
    c_sel(su);
    c_autowalk(1);
    c_facing("l");
    c_sel(kr);
    c_facing("r");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EF* The hell did this happen...?/%", "obj_ch3_PGS01A_slash_Step_0_gml_259_0");
    c_talk_wait();
    c_sel(su);
    c_facing("d");
    c_wait(60);
    c_sprite(spr_susie_pose);
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* ... well^1, who cares! This means another adventure^1, right?/%", "obj_ch3_PGS01A_slash_Step_0_gml_273_0");
    c_talk_wait();
    c_facing("susiedarkeyes");
    c_walkdirect_wait(408, 222, 8);
    c_walkdirect_wait(250, 222, 26);
    c_walkdirect_wait(250, 212, 8);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Let's see what else is around./%", "obj_ch3_PGS01A_slash_Step_0_gml_283_0");
    c_talk_wait();
    c_mus2("initloop", "wind_highplace.ogg", 0);
    c_mus2("volume", 0, 1);
    c_wait(1);
    c_mus2("volume", 0.5, 30);
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 10;
    left_couch = true;
    run_check = scr_flag_get(1258) == 0;
    if (global.tempflag[40] == 1)
    {
        with (couch)
            show_sparkle();
    }
    con = 99;
}
if (left_couch)
{
    if (obj_mainchara.x >= 870)
    {
        left_couch = false;
        with (couch)
        {
            walkaway = true;
            hide_sparkle();
        }
    }
}
if (susie_snore)
{
    susie_snore = false;
    susie_snore_sfx = snd_loop(snd_susie_snore);
}
if (susie_snore_stop)
{
    susie_snore_stop = false;
    snd_stop(susie_snore_sfx);
    snd_free(susie_snore_sfx);
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 11;
    alarm[0] = 30;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_facing("u");
    c_wait(15);
    c_speaker("no_name");
    c_msgsetloc(0, "* (For some reason^1, you decided to go back to sleep...)/%", "obj_ch3_PGS01A_slash_Step_0_gml_362_0");
    c_talk_wait();
    c_sel(su);
    if (abs(su_actor.x - (kr_actor.x + 40)) > 40)
        c_walkdirect_speed_wait(kr_actor.x + 40, su_actor.y, 6);
    if (abs(su_actor.y - (kr_actor.y - 16)) > 0)
        c_walkdirect_wait(kr_actor.x + 40, kr_actor.y - 16, 8);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Dude^1, you're gonna sleep through THE DARK WORLD?/", "obj_ch3_PGS01A_slash_Step_0_gml_377_0");
    c_msgnextloc("\\E1* .../", "obj_ch3_PGS01A_slash_Step_0_gml_378_0");
    c_msgnextloc("\\E0* Alright^1, well^1, I'm out./%", "obj_ch3_PGS01A_slash_Step_0_gml_379_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_walkdirect_speed_wait(camerax() + view_wport[0] + 100, kr_actor.y - 16, 6);
    c_mus2("volume", 0, 30);
    c_var_instance(blackall, "depth", 6000);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(120);
    c_speaker("tenna");
    c_msgsetloc(0, "* Hey^1, Kris^1! What'd you do^1, ride the couch all the way here!?/", "obj_ch3_PGS01A_slash_Step_0_gml_398_0");
    c_msgnextloc("* Great timing^1! The game's about to start!/%", "obj_ch3_PGS01A_slash_Step_0_gml_399_0");
    c_talk_wait();
    c_wait(30);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 12 && !i_ex(obj_cutscene_master))
{
    con = -1;
    snd_free_all();
    global.plot = 80;
    if (global.lang == "en")
    {
        global.flag[1012] = 10;
        global.flag[1013] = 17;
        global.flag[1014] = 18;
    }
    else
    {
        global.flag[1273] = 1;
        global.flag[1012] = 0;
        global.flag[1013] = 0;
        global.flag[1014] = 0;
    }
    global.flag[1274] = global.flag[1012];
    global.flag[1275] = global.flag[1013];
    global.flag[1276] = global.flag[1014];
    scr_flag_set(1071, 1);
    if (!scr_havechar(2))
        scr_getchar(2);
    if (!scr_havechar(3))
        scr_getchar(3);
    global.flag[7] = 1;
    room_goto(room_board_gsa02_b0);
}
if (run_check)
{
    if (run_con < 0)
    {
        if (obj_mainchara.walk == 1)
            run_timer++;
        if (run_timer >= 60)
        {
            if (obj_mainchara.runcounter <= 5)
            {
                run_con = 0;
            }
            else
            {
                run_timer = 0;
                run_check = false;
            }
        }
    }
    if (run_con == 0 && global.interact == 0)
    {
        run_con = 1;
        global.interact = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\EK* Dude^1, you know we can RUN^1, right?/", "obj_ch3_PGS01A_slash_Step_0_gml_488_0");
        msgnextloc("\\EK* The hell are you still walking everywhere for?/%", "obj_ch3_PGS01A_slash_Step_0_gml_489_0");
        var d = d_make();
    }
    if (run_con == 1 && !d_ex())
    {
        run_con = -1;
        global.interact = 0;
        run_timer = 0;
        run_check = false;
        scr_flag_set(1258, 1);
    }
}
