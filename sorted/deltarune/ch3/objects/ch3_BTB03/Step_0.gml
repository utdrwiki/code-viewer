if (con == 0 && global.interact == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 425, 485, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_grasp_anim;
    te_actor.preset = 0;
    c_sel(kr);
    if (kr_actor.y < (dustpile.y + 10) || kr_actor.y >= (dustpile.y + 20))
    {
        c_walkdirect_speed(kr_actor.x, dustpile.y + 10, 6);
        c_delaywalkdirect(7, dustpile.x + 30, dustpile.y + 10, 12);
    }
    else
    {
        c_walkdirect(dustpile.x + 30, dustpile.y + 10, 12);
    }
    c_sel(su);
    if (su_actor.y < (dustpile.y + 4) || su_actor.y >= (dustpile.y + 6))
    {
        c_walkdirect(su_actor.x, dustpile.y, 8);
        c_delaywalkdirect(9, dustpile.x + 30, dustpile.y, 12);
    }
    else
    {
        c_walkdirect(dustpile.x + 30, dustpile.y, 18);
    }
    c_sel(ra);
    if (ra_actor.y < (dustpile.y + 2) || su_actor.y >= (dustpile.y + 4))
    {
        c_walkdirect(ra_actor.x, dustpile.y + 6, 14);
        c_delaywalkdirect(15, dustpile.x + 30, dustpile.y + 6, 12);
    }
    else
    {
        c_walkdirect(dustpile.x + 30, dustpile.y + 10, 22);
    }
    c_wait(30);
    c_pannable(1);
    c_panspeed(6, 0, 90);
    c_wait(91);
    c_sel(te);
    c_tenna_preset(16);
    c_wait(1);
    c_imageindex(1015);
    c_imagespeed(0.25);
    c_speaker("tenna");
    c_msgsetloc(0, "* Elnina!^1! Lanino!? You two!? C'mon^1, old friends^1, you can't leave...!/%", "obj_ch3_BTB03_slash_Step_0_gml_47_0");
    c_talk_wait();
    c_var_instance(te_actor, "image_speed", 0.75);
    c_var_instance(te_actor, "wobbleamt", 30);
    c_var_instance(id, "staff_leave", true);
    c_var_instance(id, "staff_leave_loop", true);
    c_wait(160);
    c_var_lerp_instance(te_actor, "image_speed", 0.5, 0, 100);
    c_var_lerp_instance(te_actor, "wobbleamt", 30, 0, 100);
    c_wait(30);
    c_panspeed(4, 0, 52);
    c_wait(100);
    c_sel(te);
    c_tenna_sprite(spr_tenna_tie_adjust_c);
    c_tenna_preset(15);
    c_var_instance(te_actor, "xscale", -2);
    c_var_lerp_instance(te_actor, "wobbleamt", 6, 0, 60);
    c_msgzurasu(1);
    c_speaker("tenna");
    c_msgsetloc(0, "* Fine!^1! Fine^1, you wanna go^1, GO!!/", "obj_ch3_BTB03_slash_Step_0_gml_82_0");
    c_msgnextloc("* We'll see how far the Lightners get.../%", "obj_ch3_BTB03_slash_Step_0_gml_83_0");
    c_talk();
    c_wait(60);
    c_wait_talk();
    c_tenna_sprite(spr_tenna_laugh);
    c_imagespeed(0.2);
    c_var_instance(te_actor, "xscale", 2);
    c_speaker("tenna");
    c_msgsetloc(0, "* WITHOUT THE WEATHER CHANNEL!^1! HAHAHA!/%", "obj_ch3_BTB03_slash_Step_0_gml_96_0");
    c_talk_wait();
    c_var_lerp_instance(te_actor, "image_speed", 0.2, 0.5, 30);
    c_tenna_preset(16);
    c_var_instance(te_actor, "xscale", -2);
    c_tenna_sprite(spr_tenna_laugh);
    c_speaker("tenna");
    c_msgsetloc(0, "* How can they know the Weather without TV!?!? Hahahaha!!/%", "obj_ch3_BTB03_slash_Step_0_gml_106_0");
    c_talk_wait();
    c_halt();
    c_tenna_sprite(spr_tenna_grasp_anim);
    c_tenna_preset(15);
    c_imagespeed(0.5);
    c_var_lerp_instance(te_actor, "wobbleamt", 6, 0, 30);
    c_var_instance(te_actor, "xscale", 2);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* What? Apps? What..^1. What are those!? Everything's changing so fast.../%", "obj_ch3_BTB03_slash_Step_0_gml_119_0");
    c_talk_wait();
    c_var_instance(id, "musfade", 1);
    c_imagespeed(0);
    c_imageindex(2);
    c_var_instance(id, "show_spotlight", true);
    c_soundplay(snd_impact);
    c_soundplay(snd_locker);
    c_wait(60);
    c_imageindex(0);
    c_speaker("tenna");
    c_msgsetloc(0, "* M..^1. Mike? Mike^1, you..^1. you're leaving^1, too!?/%", "obj_ch3_BTB03_slash_Step_0_gml_135_0");
    c_talk_wait();
    c_halt();
    c_tenna_sprite(spr_tenna_grasp_e);
    c_tenna_preset(15);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* MIKE!^1! NO!^1! ANYONE BUT YOU!^1! ANYONE!!/%", "obj_ch3_BTB03_slash_Step_0_gml_145_0");
    c_talk_wait();
    c_lerp_var_instance(te_actor, "wobbleamt", 6, 20, 30);
    c_wait(60);
    c_var_instance(id, "staff_cleanup", true);
    c_pan(2050, 233, 30);
    c_var_instance(id, "musfade", 3);
    c_wait(60);
    c_sel(kr);
    c_walkdirect(dustpile.x + 240, 435, 40);
    c_sel(su);
    c_delaywalkdirect(12, dustpile.x + 180, 417, 30);
    c_sel(ra);
    c_delaywalkdirect(18, dustpile.x + 140, 423, 30);
    c_wait(20);
    c_var_instance(id, "hide_spotlight", true);
    c_wait(30);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    with (obj_mainchara)
        cutscene = 0;
    global.interact = 0;
    global.facing = 0;
    global.plot = 280;
    if (global.tempflag[90] != 0)
        global.tempflag[90] = 0;
    with (dustpile_block)
        instance_destroy();
    with (dustpile_readable)
        instance_destroy();
    con = 99;
}
if (staff_leave)
{
    staff_leave_timer++;
    if (staff_leave_phase == 0)
    {
        if (staff_leave_timer == 1)
        {
            with (staff_markers[staff_index])
            {
            }
        }
        if (staff_leave_timer == 10)
        {
            if (staff_index > 0)
            {
                with (staff_markers[staff_index])
                    scr_lerpvar("x", x, x - 30, 25);
            }
            else
            {
                with (staff_markers[staff_index])
                    scr_lerpvar("x", x, x - 40, 50);
            }
        }
        if (staff_leave_timer == 20)
        {
            staff_index++;
            staff_leave_timer = 0;
            if (staff_leave_loop)
            {
                if (staff_index >= array_length_1d(staff_markers))
                    staff_leave_phase++;
            }
            else
            {
                staff_leave = false;
            }
        }
    }
    else if (staff_leave_phase == 1)
    {
        if (staff_leave_timer == 45)
        {
            with (staff_markers[1])
                image_xscale = -2;
        }
        if (staff_leave_timer == 60)
        {
            with (staff_markers[0])
                image_index = 1;
        }
        if (staff_leave_timer == 80)
        {
            staff_index++;
            staff_leave_timer = 0;
            if (staff_leave_loop)
            {
                if (staff_index >= array_length_1d(staff_markers))
                    staff_leave_phase++;
            }
            else
            {
                staff_leave = false;
            }
        }
    }
    else if (staff_leave_phase == 2)
    {
        if (staff_leave_timer == 10)
        {
            with (staff_markers[1])
                image_xscale = 2;
        }
        if (staff_leave_timer == 40)
        {
            with (staff_markers[1])
                image_xscale = -2;
        }
        if (staff_leave_timer == 50)
        {
            with (staff_markers[1])
                image_index = 1;
        }
        if (staff_leave_timer == 60)
        {
            with (staff_markers[1])
                image_index = 1;
        }
        if (staff_leave_timer == 75)
        {
            with (staff_markers[0])
            {
                image_xscale = -2;
                scr_lerpvar("x", x, camerax() - 100, 30);
            }
        }
        if (staff_leave_timer == 79)
        {
            with (staff_markers[1])
                scr_lerpvar("x", x, camerax() - 100, 30);
        }
        if (staff_leave_timer == 120)
        {
            staff_index++;
            staff_leave_timer = 0;
            if (staff_leave_loop)
            {
                if (staff_index >= array_length_1d(staff_markers))
                    staff_leave = false;
            }
            else
            {
                staff_leave = false;
            }
        }
    }
}
if (staff_cleanup)
{
    staff_cleanup = false;
    camenary_hover = false;
    var i = array_length_1d(staff_markers) - 1;
    while (i >= 0)
    {
        with (staff_markers[i])
            instance_destroy();
        i--;
    }
}
if (show_spotlight)
{
    show_spotlight = false;
    spotlight = instance_create(2842, y, obj_ch3_BTB03_spotlight);
}
if (hide_spotlight)
{
    hide_spotlight = false;
    with (spotlight)
        clean_up();
}
if (musfade == 1)
{
    musfade = 2;
    musvol = audio_sound_get_gain(global.currentsong[1]);
    snd_volume(global.currentsong[1], 0, 0);
}
if (musfade == 3)
{
    snd_volume(global.currentsong[1], musfade, 240);
    musfade = 0;
}
