if (canrest)
{
    if (obj_mainchara.x > x && (!sunkus_kb_check_pressed(1) && !scr_gamepad_check_any()) && global.interact == 0)
        timer++;
    else if (timer > 0)
        timer = 0;
    if (timer >= 300 && con == -1)
    {
        con = 1;
        timer = 0;
    }
    if (global.chapter == 2)
    {
        if (con == 1)
        {
            con = 2;
            global.interact = 1;
            global.facing = 1;
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            mus_volume(global.currentsong[1], 0, 60);
        }
        if (con == 2)
        {
            con = 3;
            oceansong[0] = snd_init("ocean.ogg");
            oceansong[1] = mus_loop(oceansong[0]);
            mus_volume(oceansong[1], 0, 0);
            mus_volume(oceansong[1], 0.5, 150);
            c_sel(su);
            c_walkdirect(362, 88, 30);
            c_delayfacing(31, "r");
            c_sel(kr);
            c_walkdirect(364, 122, 30);
            c_delayfacing(31, "r");
            c_pannable(1);
            c_panspeed(1, 0, 40);
            c_wait(32);
            c_autowalk(0);
            c_sprite(spr_kris_sit_wind);
            c_imagespeed(0.1);
            c_sel(su);
            c_wait(5);
            c_autowalk(0);
            c_sprite(spr_susie_sit_wind);
            c_imagespeed(0.1);
            c_wait(15);
            c_waitcustom();
        }
        if (con == 3 && customcon == 1 && (sunkus_kb_check_pressed(1) || scr_gamepad_check_any()))
        {
            con = 4;
            customcon = 0;
            alarm[0] = 30;
            c_waitcustom_end();
            c_panobj(kr_actor, 60);
            mus_volume(oceansong[1], 0, 90);
            mus_volume(global.currentsong[1], 1, 90);
            c_wait(65);
            c_sel(kr);
            c_autowalk(1);
            c_sprite(spr_krisr);
            c_sel(su);
            c_autowalk(1);
            c_sprite(spr_susie_walk_right_lw);
            c_actortokris();
            c_actortocaterpillar();
            c_terminatekillactors();
        }
        if (con == 5 && !i_ex(obj_cutscene_master))
        {
            con = -1;
            snd_free(oceansong[1]);
            obj_mainchara.cutscene = 0;
            global.interact = 0;
            global.facing = 0;
        }
    }
    if (global.chapter == 4)
    {
        if (susie_talk)
        {
            if (con == 1)
            {
                con = 2;
                global.interact = 1;
                scr_speaker("susie");
                msgsetloc(0, "\\E0* ..^1. Looks like your weird friend is busy today./", "obj_room_beach_slash_Step_0_gml_127_0");
                msgnextloc("\\E1* Let's go already./%", "obj_room_beach_slash_Step_0_gml_128_0");
                d_make();
            }
            if (con == 2 && !d_ex())
            {
                con = 99;
                scr_flag_set(771, 1);
                global.interact = 0;
                global.facing = 0;
            }
        }
        if (skip_stones)
        {
            if (rock_fall)
            {
                rock_fall_timer++;
                if (rock_fall_timer == 1)
                {
                    rock_marker.visible = 1;
                    with (rock_marker)
                    {
                        hspeed = 4;
                        gravity = 0.3;
                    }
                }
                if (rock_fall_timer == 10)
                    snd_play(snd_stepsplash1);
                if (rock_fall_timer == 12)
                {
                    rock_fall = false;
                    rock_marker.vspeed = 0;
                    rock_marker.gravity = 0;
                    rock_marker.hspeed = 0;
                    rock_marker.visible = 0;
                }
            }
            if (con == 1)
            {
                con = 2;
                global.interact = 1;
                splash_marker = scr_marker(452, 100, spr_beach_splash);
                with (splash_marker)
                    scr_depth();
                splash_marker.image_speed = 0;
                cutscene_master = scr_cutscene_make();
                scr_maincharacters_actors();
            }
            if (con == 2)
            {
                con = 3;
                c_sel(kr);
                c_facing("r");
                c_sel(su);
                c_facing("r");
                c_speaker("susie");
                c_msgsetloc(0, "\\E2* ..^1. hey Kris^1, watch this./%", "obj_room_beach_slash_Step_0_gml_200_0");
                c_talk_wait();
                c_sel(kr);
                c_walkdirect(350, 100, 15);
                c_delayfacing(16, "r");
                c_sel(su);
                c_walkdirect_wait(375, 74, 15);
                c_wait(5);
                c_sprite(spr_susie_pick_up);
                c_sound_play(snd_wing);
                c_shakeobj();
                c_wait(30);
                c_sprite(spr_susie_beach_throw_stone);
                c_halt();
                c_wait(15);
                c_msgside("bottom");
                c_speaker("susie");
                c_msgsetloc(0, "\\E7* Lake..^1. skip!/%", "obj_room_beach_slash_Step_0_gml_222_0");
                c_talk_wait();
                c_sel(su);
                c_autowalk(0);
                c_imagespeed(0);
                c_imageindex(1);
                c_wait(20);
                c_imageindex(2);
                c_wait(1);
                c_imageindex(3);
                c_var_instance(id, "rock_fall", true);
                c_wait(10);
                c_var_instance(splash_marker, "image_speed", 0.25);
                c_wait(25);
                c_var_instance(splash_marker, "image_speed", 0);
                c_wait(60);
                c_sel(kr);
                c_sprite(spr_kris_stifle_laugh);
                c_wait(60);
                c_speaker("susie");
                c_msgsetloc(0, "\\EK* ..^1. I can hear you trying not to laugh^1, dumbass./%", "obj_room_beach_slash_Step_0_gml_253_0");
                c_talk_wait();
                c_sel(kr);
                c_facing("r");
                c_sel(su);
                c_sprite(spr_susie_walk_right_lw);
                c_halt();
                c_autowalk(1);
                c_walkdirect_wait(320, 94, 20);
                c_facing("r");
                c_speaker("susie");
                c_msgsetloc(0, "\\EP* Fine. We'll see how far YOU get at the lake next time./%", "obj_room_beach_slash_Step_0_gml_268_0");
                c_talk_wait();
                c_pannable(1);
                c_panobj(kr_actor, 10);
                c_wait(11);
                c_pannable(0);
                c_sel(kr);
                c_facing("d");
                c_actortokris();
                c_actortocaterpillar();
                c_terminatekillactors();
            }
            if (con == 3 && !i_ex(obj_cutscene_master))
            {
                con = 99;
                scr_flag_set(771, 3);
                global.interact = 0;
                global.facing = 0;
            }
        }
    }
}
